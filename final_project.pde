/*
 Adam
 Final processing project
 My game is a two player racing game where you press d or l as fast as you can to win
 TODO: inlcude a map selection after choosing a gamemode -DONE
 TODO: start making the actual game -DONE
 TODO: add a timer that shows how fast you raced -DONE
 TODO: add a restart button -DONE
 TODO: add backgrounds and decoration -DONE
 */

import processing.sound.*;

PImage player_1_car;
PImage player_2_car;

PImage neighborhoodMap;
PImage garbageMap;
PImage sushiMap;
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

  neighborhoodMap = loadImage("adam neighborhood.png");
  garbageMap = loadImage("garbage disposal.png");
  sushiMap = loadImage("sushi resturaunt.png");

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

    textSize(20);

    fill(50, 180, 80);
    rect(50, 300, 350, 60);
    fill(255, 255, 255);
    text("Adam's neighborhood", 150, 338);

    fill(50, 100, 220);
    rect(425, 300, 350, 60);
    fill(255, 255, 255);
    text("Garbage disposal", 520, 338);

    fill(150, 50, 200);
    rect(800, 300, 350, 60);
    fill(255, 255, 255);
    text("Sushi restaurant", 895, 338);

    fill(220, 3, 2);
    rect(450, 450, 300, 60);
    fill(255, 255, 255);
    text("Back", 567, 488);
  }

  if (screen == 2 || screen == 4 || screen == 5) {

    if (screen == 2) {
      image(neighborhoodMap, 0, 0, 1200, 700);
    }

    if (screen == 4) {
      image(garbageMap, 0, 0, 1200, 700);
    }

    if (screen == 5) {
      image(sushiMap, 0, 0, 1200, 700);
    }

    image(player_1_car, car1X, 380, 100, 50);
    image(player_2_car, car2X, 450, 100, 50);

    if (countdownActive) {
      int countdown = 3 - (millis() - countdownStart) / 1000;

      textSize(100);
      fill(0, 0, 0);

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
      fill(0, 0, 0);
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
      fill(0, 0, 0);
      text("PLAYER 1 WINS!", 400, 150);
      textSize(30);
      text("Time: " + raceTime + " seconds", 460, 180);
      text("Press r to restart", 460, 220);
    }

    if (winner == 2) {
      textSize(50);
      fill(0, 0, 0);
      text("PLAYER 2 WINS!", 400, 150);
      textSize(30);
      text("Time: " + raceTime + " seconds", 460, 180);
      text("Press r to restart", 460, 220);
    }

    if (tie == true) {
      textSize(50);
      fill(0, 0, 0);
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
    if (mouseX > 50 && mouseX < 400 && mouseY > 300 && mouseY < 360) {
      screen = 2;
      countdownStart = millis();
      countdownActive = true;
    }

    if (mouseX > 425 && mouseX < 775 && mouseY > 300 && mouseY < 360) {
      screen = 4;
      countdownStart = millis();
      countdownActive = true;
    }

    if (mouseX > 800 && mouseX < 1150 && mouseY > 300 && mouseY < 360) {
      screen = 5;
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
        car1X = car1X + 10;
      }
      dReleased = false;
    }

    if ((key == 'l' || key == 'L') && lReleased) {
      if (car2X < 1000) {
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
