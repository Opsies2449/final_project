/*
 Adam
 Final processing project
 TODO: add brief description of final project here
 TODO: add FPS feature -DONE
 TODO: add a main menu of my aim trainer game -DONE
 */

int lastMillis = 0;
double fps= 0;

void setup() {
  size(700, 700);
}

void draw() {
  background(0, 0, 0);
  trackFrames();

  fill(255, 255, 255);
  textAlign(CENTER);
  textSize(50);
  text("Adam's Aim Trainer", 350, 100);

  textSize(30);
  text("SELECT A MODE", 350, 170);

  textSize(20);

  fill(50, 180, 80);
  rect(200, 220, 300, 50);
  fill(255, 255, 255);
  text("Noob", 350, 252);

  fill(220, 160, 40);
  rect(200, 290, 300, 50);
  fill(255, 255, 255);
  text("Normal", 350, 322);

  fill(50, 150, 220);
  rect(200, 360, 300, 50);
  fill(255, 255, 255);
  text("Above Average", 350, 392);

  fill(160, 80, 220);
  rect(200, 430, 300, 50);
  fill(255, 255, 255);
  text("Pro", 350, 462);

  fill(220, 60, 60);
  rect(200, 500, 300, 50);
  fill(255, 255, 255);
  text("HACKER", 350, 532);

  textAlign(LEFT);
}

void trackFrames() {
  double SMOOTHNESS = 0.9;

  int currentMillis = millis();
  int millisElapsed = max(currentMillis - lastMillis, 1);
  lastMillis = currentMillis;

  int currentFps =(int)1000 / millisElapsed;
  fps = (SMOOTHNESS*fps) + ((1-SMOOTHNESS)*currentFps);

  fill(255, 255, 255);
  text("FPS: " + (int)fps, 10, 30);
  textSize(20);
}
