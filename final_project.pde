/*
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

int car1X = 50;
int car2X = 50;

boolean dReleased = true;
boolean lReleased = true;

void setup() {
  size(1200, 700);
}

void draw() {
  background(0, 0, 0);

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
    text("Pluto", 800, 347);

    fill(200, 100, 100);
    rect(700, 400, 300, 60);
    fill(255, 255, 255);
    text("Super steep ski hill", 765, 437);

    fill(220, 3, 2);
    rect(450, 520, 300, 60);
    fill(255, 255, 255);
    text("Back", 575, 557);
  }

  if (screen == 2 || screen == 3 || screen == 4 ||
    screen == 5 || screen == 6 || screen == 7) {

    noStroke();

    fill(255, 0, 0);
    rect(car1X, 250, 80, 40);

    fill(255, 0, 0);
    rect(car2X, 420, 80, 40);
  }

  trackFrames();
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

void keyPressed() {
  if ((key == 'd' || key == 'D') && dReleased) {
    if (car1X < 1070) {
      car1X = car1X + 10;
    }
    dReleased = false;
  }

  if ((key == 'l' || key == 'L') && lReleased) {
    if (car2X < 1070) {
      car2X = car2X + 10;
    }
    lReleased = false;
  }
}

void keyReleased() {
  if (key == 'd' || key == 'D') {
    dReleased = true;
  }

  if (key == 'l' || key == 'L') {
    lReleased = true;
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