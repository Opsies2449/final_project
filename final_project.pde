/*
 Adam
 Final processing project
 TODO: add brief description of final project here
 TODO: restart since its not too late -DONE
 TODO: make it two player racing game
 TODO: add FPS feature -DONE
 TODO: make it so when you select a mode, you can choose a map that then changes the background
 */

int lastMillis = 0;
double fps = 0;

int screen = 0;
int gamemode = 0;
int map = 0;

void setup() {
  size(700, 700);
}

void draw() {
  background(0, 0, 0);
  trackFrames();

  if (screen == 0) {
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

  if (screen == 1) {
    textSize(40);
    fill(255, 255, 255);
    text("Select a map", 230, 220);

    fill(50, 180, 80);
    rect(200, 280, 300, 60);
    fill(255, 255, 255);
    textSize(20);
    text("Adam's neighborhood", 270, 317);

    fill(220, 160, 40);
    rect(200, 360, 300, 60);
    fill(255, 255, 255);
    text("Deli around the corner", 270, 397);

    fill(50, 100, 220);
    rect(200, 440, 300, 60);
    fill(255, 255, 255);
    text("Garbage disposal", 270, 477);
  }
}

void mousePressed() {
  if (screen == 0) {
    if (mouseX > 200 && mouseX < 500 && mouseY > 310 && mouseY < 370) {
      gamemode = 1;
      screen = 1;
    }

    if (mouseX > 200 && mouseX < 500 && mouseY > 390 && mouseY < 450) {
      gamemode = 2;
      screen = 1;
    }
  } else if (screen == 1) {
    if (mouseX > 200 && mouseX < 500 && mouseY > 280 && mouseY < 340) {
      map = 1;
    }

    if (mouseX > 200 && mouseX < 500 && mouseY > 360 && mouseY < 420) {
      map = 2;
    }

    if (mouseX > 200 && mouseX < 500 && mouseY > 440 && mouseY < 500) {
      map = 3;
    }
  }
}

void trackFrames() {
  double SMOOTHNESS = 0.9;

  int currentMillis = millis();
  int millisElapsed = max(currentMillis - lastMillis, 1);
  lastMillis = currentMillis;

  int currentFps = (int)1000 / millisElapsed;
  fps = (SMOOTHNESS * fps) + ((1-SMOOTHNESS) * currentFps);

  fill(255, 255, 255);
  text("FPS: " + (int)fps, 10, 30);
  textSize(20);
}
