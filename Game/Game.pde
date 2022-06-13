import java.io.*;
import java.util.*;

//for game setup
Character FireBoy;
Character WaterGirl;
int PIXEL_WIDTH;
int PIXEL_LENGTH;
ArrayList<Level> levels;
int currLevelIndex;
ArrayList<Maze> mazes;
boolean[] keys = new boolean[6];

//for continue button
int contX, contY;
int contWid = 300;
int contHgt = 70;
color contColor = color(130, 127, 129);
boolean contOver = false;

//for switching between screens
boolean PAUSE_SCREEN = false;
boolean INTRO_SCREEN = true;
boolean GAMEOVER_SCREEN = false;
boolean CONTINUE_SCREEN = false;
boolean NOMORE_SCREEN = false;

//for text and colors
PFont basicFont;
PFont introFont;
PImage introText;
PImage introBg;
color goldColor = color(218, 165, 32);
color lightGrey = color(117, 112, 111);
color darkGrey = color(71, 74, 77);
color fireRed = color(222, 67, 35);
color waterBlue = color(108, 172, 231);

//for gems display
PImage redGem;
PImage blueGem;
PImage fireboy;
PImage watergirl;

void setup() {
  size(800, 600);
  Maze m1 = new Maze("Level1Edited.txt", 30, 40);
  Level l1 = new Level(1, m1, "Level1_Items.txt", 70, 520, 70, 450);
  Maze m2 = new Maze("Level2.txt", 30, 40);
  Level l2 = new Level(2, m2, "Level2_Items.txt", 20 * 3, 20 * 3, 20 * 36, 20 * 3);
  Maze m3 = new Maze("Level3.txt", 30, 40);
  Level l3 = new Level(1, m3, "Level3_Items.txt", 40, 40, 80, 40);
  PIXEL_WIDTH = height/m2.width();
  PIXEL_LENGTH = (int)width/m2.height();
  currLevelIndex = 0;
  levels = new ArrayList<Level>();
  mazes = new ArrayList<Maze>();

  //add all levels (as needed)

  levels.add(l1);
  mazes.add(m1);
  levels.add(l2);
  mazes.add(m2);
  levels.add(l3);
  mazes.add(m3);

  try {
    for (int i = 0; i < levels.size(); i++) {
      mazes.get(i).readFileAndConstruct();
      levels.get(i).createLevel();
      levels.get(i).kmsSet();
    }
  }
  catch(FileNotFoundException e) {
    System.out.println("Invalid filename");
  }

  basicFont = createFont("Didot", 32);
  introFont = createFont("MarkerFelt-Thin", 70);

  introText = loadImage("GameNameElements.png");
  introBg = loadImage("TempleHallForest.jpg");
  blueGem = loadImage("blueGem.png");
  redGem = loadImage("redGem.png");
  fireboy = loadImage("Fireboy.png");
  watergirl = loadImage("Watergirl.png");

  contX = width/2 - contWid/2;
  contY = height/2 - contHgt/2;
}

void draw() {
  //check if both are alive, else, background(0), game over
  if (INTRO_SCREEN) {
    drawIntroScreen();
  } else {
    FireBoy = levels.get(currLevelIndex).FireBoy();
    WaterGirl = levels.get(currLevelIndex).WaterGirl();
    if (NOMORE_SCREEN) {
      //PAUSE_SCREEN = false;
      drawOutOfLevelScreen();
    } else if (PAUSE_SCREEN) {
      drawPauseScreen();
    } else {
      if (FireBoy.survival() && WaterGirl.survival() && (!FireBoy.complete() || !WaterGirl.complete())) {
        levels.get(currLevelIndex).play();
      }
      if ( (!FireBoy.survival() || !WaterGirl.survival()) && !levels.get(currLevelIndex).isCompleted()) {
        background(lightGrey);
        if (!FireBoy.survival() || !WaterGirl.survival()) {
          GAMEOVER_SCREEN = true;
          drawGameOverScreen();
        }
      }
      if (FireBoy.complete() && WaterGirl.complete() && FireBoy.survival() && WaterGirl.survival()) {
        CONTINUE_SCREEN = true;
        levels.get(currLevelIndex).setCompleted(true);
        levels.get(currLevelIndex).completeLevel();
      }
      if (overRect()) {
        contColor = color(lightGrey);
      } else {
        contColor = color(darkGrey);
      }
    }
  }
}

void mousePressed() {
  if (CONTINUE_SCREEN && !INTRO_SCREEN && overRect()) {
    if (currLevelIndex + 1 < levels.size()) {
      currLevelIndex += 1;
      FireBoy.changeC(false);
      WaterGirl.changeC(false);
    } else {
      NOMORE_SCREEN = true;
      FireBoy.changeC(false);
      WaterGirl.changeC(false);
    }
    CONTINUE_SCREEN = false;
  }
}

void keyPressed() {
  if (key == 'w') {
    keys[0] = true;
  }
  if (key == 'a') {
    keys[1] = true;
  }
  if (key == 'd') {
    keys[2] = true;
  }
  if (keyCode == UP) {
    keys[3] = true;
  }
  if (keyCode == LEFT) {
    //println("LEFT");
    keys[4] = true;
  }
  if (keyCode == RIGHT) {
    //println("RIGHT");
    keys[5] = true;
  }

  if (key == 'p' && !PAUSE_SCREEN && !INTRO_SCREEN) {
    //print("p is pressed");
    PAUSE_SCREEN = true;
  }

  if (key == ' ' && PAUSE_SCREEN) {
    PAUSE_SCREEN = false;
  }

  if (key == 's' && PAUSE_SCREEN ) {
    PAUSE_SCREEN = false;
    if (currLevelIndex + 1 < levels.size()) {
      currLevelIndex += 1;
      FireBoy.changeC(false);
      WaterGirl.changeC(false);
    } else {
      NOMORE_SCREEN = true;
      FireBoy.changeC(false);
      WaterGirl.changeC(false);
    }
  }

  if (NOMORE_SCREEN && key == ' '){
    NOMORE_SCREEN = false;
    currLevelIndex = 0;
    INTRO_SCREEN = true;
  }

  if (key == 'r' && (PAUSE_SCREEN || GAMEOVER_SCREEN)) {
    PAUSE_SCREEN = false;
    try {
      mazes.get(currLevelIndex).readFileAndConstruct();
      levels.get(currLevelIndex).createLevel();
      //FireBoy = levels.get(currLevelIndex).FireBoy();
      //WaterGirl = levels.get(currLevelIndex).WaterGirl();
      FireBoy = levels.get(currLevelIndex).FireBoy();
      WaterGirl = levels.get(currLevelIndex).WaterGirl();
      levels.get(currLevelIndex).resetChars();
    }
    catch(FileNotFoundException e) {
      System.out.println("Invalid filename");
    }
  }
}
void keyReleased() {
  if (key == 'w') {
    keys[0] = false;
  }
  if (key == 'a') {
    keys[1] = false;
  }
  if (key == 'd') {
    keys[2] = false;
  }
  if (keyCode == UP) {
    keys[3] = false;
  }
  if (keyCode == LEFT) {
    keys[4] = false;
  }
  if (keyCode == RIGHT) {
    keys[5] = false;
  }
}

void mouseClicked() {
  if (INTRO_SCREEN) {
    INTRO_SCREEN = false;
  }
}

boolean overRect() {
  return (mouseX >= contX && mouseX <= contX + contWid && mouseY >= contY && mouseY <= contY + contHgt);
}

void drawBoarder(int borderW) {
  rect(0, 0, width, borderW);
  rect(width-borderW, 0, borderW, height);
  rect(0, height-borderW, width, borderW);
  rect(0, 0, borderW, height);
}

void drawIntroScreen() {
  background(introBg);
  image(introText, width/2 - 200, height/4 - 30);
  textFont(basicFont);
  fill(goldColor);
  textAlign(CENTER, CENTER);
  text("IN", width/2, height/3);
  textAlign(CENTER, CENTER);
  text("THE FOREST TEMPLE", width/2, height/2.5);
  fill(darkGrey);
  rectMode(CENTER);
  rect(width/2, height/2 + 100, 400, 200);
  textAlign(CENTER, TOP);
  textSize(20);
  fill(goldColor);
  text("INSTRUCTIONS", width/2, height/2 + 10);
  textAlign(CENTER, CENTER);
  textSize(12);
  text("There are two characters, Fireboy and Watergirl.", width/2, height/2 + 40);
  text("Fireboy can walk in lava but cannot walk in water or green goo.", width/2, height/2 + 60);
  text("Watergirl can walk in water but cannot walk in lava or green goo.", width/2, height/2 + 80);
  text("Use the arrows to control Fireboy and A, W, S, D to control WaterGirl.", width/2, height/2 + 100);
  text("Click anywhere on the screen to play, and press P to pause.", width/2, height/2 + 120);
  rectMode(CORNER);
}

void drawPauseScreen() {
  background(lightGrey);
  noStroke();
  fill(darkGrey);
  drawBoarder(40);
  fill(goldColor);
  textFont(basicFont);
  textSize(60);
  textAlign(CENTER, CENTER);
  text("PAUSED", width/2, height/4);
  textSize(20);
  text("Click R to retry, Click Space-Bar to resume, Click S to Skip Level", width/2, height/2);
}
void drawGameOverScreen() {
  noStroke();
  fill(darkGrey);
  drawBoarder(40);
  textFont(basicFont);
  fill(goldColor);
  textSize(70);
  textAlign(CENTER, CENTER);
  text("GAME OVER", width/2, height/4);
  textAlign(CENTER, CENTER);
  textSize(20);
  text("Retry by clicking R", width/2, height/2);
}

void drawOutOfLevelScreen() {
  noStroke();
  background(lightGrey);
  fill(darkGrey);
  drawBoarder(40);
  textFont(basicFont);
  fill(goldColor);
  textSize(30);
  textAlign(CENTER, CENTER);
  text("Sorry :( No more Levels Available", width/2, height/4);
  text("Click Space to return to Home", width/2, height/2);
}
