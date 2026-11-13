/* //<>//
 Adam
 Final processing project
 TODO: add brief description of final project here
 TODO: add FPS feature -DONE
 TODO: inlcude a map selection after choosing a gamemode -DONE
 TODO: start making the actual game
 TODO: add backgrounds and decoration
 */

int lastMillis = 0;
double fps = 0;

int screen = 0;
int gamemode = 0;

void setup() {
  size(1200, 700);
}

void draw() {
  background(0, 0, 0);
  trackFrames();

  if (screen == 0) {
    textSize(40);
    fill(255, 255, 255);
    text("Adam's Grand Prix game", 410, 220);

    fill(50, 180, 80);
    rect(450, 310, 300, 60);
    fill(255, 255, 255);
    textSize(30);
    text("PLAY", 567, 350);
  }

  if (screen == 1) {
    textSize(40);
    fill(255, 255, 255);
    text("Select a map", 480, 150);

    fill(50, 180, 80);
    rect(200, 220, 300, 60);
    fill(255, 255, 255);
    textSize(20);
    text("Adam's neighborhood", 265, 257);

    fill(220, 160, 40);
    rect(200, 310, 300, 60);
    fill(255, 255, 255);
    text("Utah salt flats", 290, 347);

    fill(50, 100, 220);
    rect(200, 400, 300, 60);
    fill(255, 255, 255);
    text("Garbage disposal", 275, 437);

    fill(150, 50, 200);
    rect(700, 220, 300, 60);
    fill(255, 255, 255);
    text("Sushi resturant", 790, 257);

    fill(30, 150, 150);
    rect(700, 310, 300, 60);
    fill(255, 255, 255);
    text("Pluto's orbit", 800, 347);

    fill(200, 100, 100);
    rect(700, 400, 300, 60);
    fill(255, 255, 255);
    text("Super steep ski hill", 765, 437);

    fill(220, 3, 2);
    rect(450, 520, 300, 60);
    fill(255, 255, 255);
    text("Back", 575, 557);
  }

  if (screen == 2) {
    background(0, 0, 0);
  }

  if (screen == 3) {
    background(0, 0, 0);
  }

  if (screen == 4) {
    background(0, 0, 0);
  }

  if (screen == 5) {
    background(0, 0, 0);
  }

  if (screen == 6) {
    background(0, 0, 0);
  }

  if (screen == 7) {
    background(0, 0, 0);
  }
}

void mousePressed() {
  if (screen == 0) {
    if (mouseX > 450 && mouseX < 750 && mouseY > 310 && mouseY < 370) {
      gamemode = 1;
      screen = 1;
    }
  } else if (screen == 1) {
    if (mouseX > 200 && mouseX < 500 && mouseY > 220 && mouseY < 280) {
      screen = 2;
    }

    if (mouseX > 200 && mouseX < 500 && mouseY > 310 && mouseY < 370) {
      screen = 3;
    }

    if (mouseX > 200 && mouseX < 500 && mouseY > 400 && mouseY < 460) {
      screen = 4;
    }

    if (mouseX > 700 && mouseX < 1000 && mouseY > 220 && mouseY < 280) {
      screen = 5;
    }

    if (mouseX > 700 && mouseX < 1000 && mouseY > 310 && mouseY < 370) {
      screen = 6;
    }

    if (mouseX > 700 && mouseX < 1000 && mouseY > 400 && mouseY < 460) {
      screen = 7;
    }

    if (mouseX > 450 && mouseX < 750 && mouseY > 520 && mouseY < 580) {
      screen = 0;
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
