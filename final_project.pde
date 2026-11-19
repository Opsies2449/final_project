/*
 Adam
 Final processing project
 TODO: add brief description of final project here
 TODO: inlcude a map selection after choosing a gamemode -DONE
 TODO: start making the actual game -DONE
 TODO: add a timer that shows how fast you raced -DONE
 TODO: add a restart button -DONE
 TODO: add backgrounds and decoration
 */

int raceTime = 0;

int screen = 0;
int gamemode = 0;

int car1X = 50;
int car2X = 50;

int winner = 0;

boolean dReleased = true;
boolean lReleased = true;

boolean raceStarted = false;

int countdownStart = 0;
boolean countdownActive = true;
int raceTimer = 0;

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
    text("Pluto", 827, 347);

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

    stroke(255);
    strokeWeight(5);
    line(1100, 0, 1100, 700);
    noStroke();

    fill(255, 0, 0);
    rect(car1X, 250, 80, 40);

    fill(255, 0, 0);
    rect(car2X, 420, 80, 40);

    if (countdownActive) {
      int countdown = 3 - (millis() - countdownStart) / 1000;

      textSize(100);
      fill(255, 255, 255);

      if (countdown > 0) {
        text(countdown, 570, 350);
      } else {
        countdownActive = false;

        if (raceStarted == false) {
          raceTimer = millis();
          raceStarted = true;
        }
      }
    }

    if (winner == 0 && raceStarted) {
      raceTime = (millis() - raceTimer) / 1000;

      textSize(25);
      fill(255);
      text("Time: " + raceTime + " seconds", 50, 50);

      if (car1X + 80 >= 1100) {
        winner = 1;
      }

      if (car2X + 80 >= 1100) {
        winner = 2;
      }
    }

    if (winner == 1) {
      textSize(50);
      fill(255, 255, 255);
      text("PLAYER 1 WINS!", 400, 150);
      textSize(30);
      text("Time: " + raceTime + " seconds", 460, 180);
      text("Press r to restart", 460, 220);
    }

    if (winner == 2) {
      textSize(50);
      fill(255, 255, 255);
      text("PLAYER 2 WINS!", 400, 150);
      textSize(30);
      text("Time: " + raceTime + " seconds", 460, 180);
      text("Press r to restart", 460, 220);
    }
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
      countdownStart = millis();
      countdownActive = true;
    }

    if (mouseX > 200 && mouseX < 500 && mouseY > 310 && mouseY < 370) {
      screen = 3;
      countdownStart = millis();
      countdownActive = true;
    }

    if (mouseX > 200 && mouseX < 500 && mouseY > 400 && mouseY < 460) {
      screen = 4;
      countdownStart = millis();
      countdownActive = true;
    }

    if (mouseX > 700 && mouseX < 1000 && mouseY > 220 && mouseY < 280) {
      screen = 5;
      countdownStart = millis();
      countdownActive = true;
    }

    if (mouseX > 700 && mouseX < 1000 && mouseY > 310 && mouseY < 370) {
      screen = 6;
      countdownStart = millis();
      countdownActive = true;
    }

    if (mouseX > 700 && mouseX < 1000 && mouseY > 400 && mouseY < 460) {
      screen = 7;
      countdownStart = millis();
      countdownActive = true;
    }

    if (mouseX > 450 && mouseX < 750 && mouseY > 520 && mouseY < 580) {
      screen = 0;
    }
  }
}

void keyPressed() {
  if (key == 'r' || key == 'R') {
    car1X = 50;
    car2X = 50;
    winner = 0;
    raceStarted = false;
    raceTime = 0;
    countdownStart = millis();
    countdownActive = true;
  }

  if (winner == 0 && !countdownActive) {
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
}

void keyReleased() {
  if (key == 'd' || key == 'D') {
    dReleased = true;
  }

  if (key == 'l' || key == 'L') {
    lReleased = true;
  }
}
