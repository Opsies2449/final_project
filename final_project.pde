/*
 Adam
 Final processing project
 TODO: add brief description of final project here
 TODO: restart since its not too late -DONE
 TODO: make it two player racing game
 TODO: add FPS feature -DONE
 TODO: add the background and the images for the game
 TODO: make it so when you select a mode, you can choose a map that then changes the background
 */

int lastMillis = 0;
double fps= 0;

void setup() {
  size(1200, 700);
}

void draw() {
  background(0, 0, 0);
  trackFrames();

  textSize(40);
  fill(255, 255, 255);
  text("Adam's Grand Prix game", 140, 220);

  textSize(30);
  text("Select a gamemode", 205, 270);

  fill(50, 180, 80);
  rect(200, 310, 300, 60);
  fill(255, 255, 255);
  textSize(20);
  text("Grand Prix", 300, 347);

  fill(220, 160, 40);
  rect(200, 390, 300, 60);
  fill(255, 255, 255);
  text("Endless", 310, 427);
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
