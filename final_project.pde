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

import processing.sound.*;

PImage player_1_car;
PImage player_2_car;
// images made by chatgpt

SoundFile backgroundSound;

int screen = 0;
int gamemode = 0;

int car1X = 50;
int car2X = 50;

int winner = 0;
boolean tie = false;

boolean dReleased = true;
boolean lReleased = true;

boolean raceStarted = false;
int raceTime = 0;

int countdownStart = 0;
boolean countdownActive = true;
int raceTimer = 0;

boolean soundPlayed = false;

void setup() {
  size(1200, 700);

  player_1_car = loadImage("player_1_car.png");
  player_2_car = loadImage("player_2_car.png");
  
  backgroundSound = new SoundFile(this, "freesound_community-woohoo-1-92954.mp3");
  // sound is from https://pixabay.com/sound-effects/people-woohoo-1-92954/
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

    fill(50, 100, 220);
    rect(700, 220, 300, 60);
    fill(255, 255, 255);
    text("Garbage disposal", 775, 257);

    fill(150, 50, 200);
    rect(200, 310, 300, 60);
    fill(255, 255, 255);
    text("Sushi resturant", 285, 347);

    fill(200, 100, 100);
    rect(700, 310, 300, 60);
    fill(255, 255, 255);
    text("Super steep ski hill", 765, 347);

    fill(220, 3, 2);
    rect(450, 450, 300, 60);
    fill(255, 255, 255);
    text("Back", 575, 487);
  }

  if (screen == 2 || screen == 3 || screen == 4 ||
    screen == 5 || screen == 6 || screen == 7) {

    stroke(255);
    strokeWeight(5);
    line(1100, 0, 1100, 700);
    noStroke();

    image(player_1_car, car1X, 250, 100, 50);
    image(player_2_car, car2X, 420, 100, 50);

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

    if (winner == 0 && tie == false && raceStarted) {
      raceTime = (millis() - raceTimer) / 1000;

      textSize(25);
      fill(255);
      text("Time: " + raceTime + " seconds", 50, 50);

      if (car1X + 100 >= 1100 && car2X + 100 >= 1100) {
        tie = true;
      } else if (car1X + 100 >= 1100) {
        winner = 1;
      } else if (car2X + 100 >= 1100) {
        winner = 2;
      }
    }

    if (winner != 0 && soundPlayed == false) {
      backgroundSound.play();
      soundPlayed = true;
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

    if (tie == true) {
      textSize(50);
      fill(255, 255, 255);
      text("TIED!", 450, 150);
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

    if (mouseX > 700 && mouseX < 1000 && mouseY > 220 && mouseY < 280) {
      screen = 4;
      countdownStart = millis();
      countdownActive = true;
    }

    if (mouseX > 200 && mouseX < 500 && mouseY > 310 && mouseY < 370) {
      screen = 5;
      countdownStart = millis();
      countdownActive = true;
    }

    if (mouseX > 700 && mouseX < 1000 && mouseY > 310 && mouseY < 370) {
      screen = 7;
      countdownStart = millis();
      countdownActive = true;
    }

    if (mouseX > 450 && mouseX < 750 && mouseY > 450 && mouseY < 510) {
      screen = 0;
    }
  }
}

void keyPressed() {
  if (key == 'r' || key == 'R') {
    car1X = 50;
    car2X = 50;
    winner = 0;
    tie = false;
    raceStarted = false;
    raceTime = 0;
    soundPlayed = false;
    countdownStart = millis();
    countdownActive = true;
  }

  if (winner == 0 && !countdownActive) {
    if ((key == 'd' || key == 'D') && dReleased) {
      if (car1X < 1000) {
        car1X = car1X + 100;
      }
      dReleased = false;
    }

    if ((key == 'l' || key == 'L') && lReleased) {
      if (car2X < 1000) {
        car2X = car2X + 100;
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