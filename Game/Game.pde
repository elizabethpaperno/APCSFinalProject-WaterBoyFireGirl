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

//for text and colors
PFont basicFont;
PFont introFont;
PImage introText;
PImage introBg;
color goldColor = color(218, 165, 32);
color lightGrey = color(117,112,111);
color darkGrey = color(71,74,77);
color fireRed = color(222,67,35);
color waterBlue = color(108,172,231);

void setup() {
  size(800, 600);
  Maze m1 = new Maze("Level1Edited.txt", 30, 40);
  Level l1 = new Level(1, m1, "Level1_Items.txt", 70, 520, 70, 420);
  Maze m2 = new Maze("Level2.txt", 30, 40);
  Level l2 = new Level(2, m2, "Level2_Items.txt", 20 * 3, 20 * 3, 20 * 36, 20 * 3);
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

  //positions for testing door
  //FireBoy = new Character(color(255, 0, 0), 350, 57);
  //WaterGirl = new Character(color(0, 0, 255), 350, 57 );
  //positions for level 1
  //FireBoy = new Character(color(255, 0, 0), 70, 520);
  //WaterGirl = new Character(color(0, 0, 255), 70, 450 );

  basicFont = createFont("Didot", 32);
  introFont = createFont("MarkerFelt-Thin",70);
  introText = loadImage("GameNameElements.png");
  introBg = loadImage("TempleHallForest.jpg");
  contX = width/2 - contWid/2;
  contY = height/2 - contHgt/2;
}

void mousePressed() {
  if (!INTRO_SCREEN && overRect()) {
    if (currLevelIndex + 1 < levels.size()) {
      currLevelIndex += 1;
      FireBoy.changeC(false);
      WaterGirl.changeC(false);
    } else {
      FireBoy.justice(false);
      WaterGirl.justice(false);
      background(contColor);
      fill(lightGrey);
      textSize(30);
      text("Sorry :( No more Levels Available", 170, 200);
      //background(contColor);
    }
  }
}

boolean overRect() {
  return (mouseX >= contX && mouseX <= contX + contWid && mouseY >= contY && mouseY <= contY + contHgt);
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

  if (key == 'p' && !PAUSE_SCREEN) {
    print("p is pressed");
    PAUSE_SCREEN = true;
  }

  if (key == ' ' && PAUSE_SCREEN) {
    PAUSE_SCREEN = false;
  }

  if (key == 'r' && PAUSE_SCREEN) {
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

void mouseClicked(){
  if (INTRO_SCREEN){
    INTRO_SCREEN = false;
  }
}

void draw() {
  //check if borth are alive, else, backgroun(0), game over
  if (INTRO_SCREEN){
    background(introBg);
    image(introText,width/2 - 200, height/4 - 30);
    textFont(basicFont);
    fill(goldColor);
    textAlign(CENTER, CENTER);
    text("IN",width/2, height/3);
    textAlign(CENTER, CENTER);
    text("THE FOREST TEMPLE",width/2, height/2.5);
    fill(darkGrey);
    rectMode(CENTER);
    rect(width/2,height/2 + 100,400,200);
    textAlign(CENTER, TOP);
    textSize(20);
    fill(goldColor);
    text("INSTRUCTIONS",width/2, height/2 + 10);
    textAlign(CENTER, CENTER);
    textSize(12);
    text("There are two characters, Fireboy and Watergirl.",width/2,height/2 + 40);
    text("Fireboy can walk in lava but cannot walk in water or green goo.",width/2,height/2 + 60);
    text("Watergirl can walk in water but cannot walk in lava or green goo.",width/2,height/2 + 80);
    text("Use the arrows to control Fireboy and A, W, S, D to control WaterGirl.",width/2,height/2 + 100);
    text("Click anywhere on the screen to play.",width/2,height/2 + 120);
    rectMode(CORNER);
  } else {
    //background(51);
    FireBoy = levels.get(currLevelIndex).FireBoy();
    WaterGirl = levels.get(currLevelIndex).WaterGirl();
    if (FireBoy.survival() && WaterGirl.survival() && (!FireBoy.complete() || !WaterGirl.complete())) {
      levels.get(currLevelIndex).play();
      //added code from here to play() in level
    }
    if ( (!FireBoy.survival() || !WaterGirl.survival()) && !levels.get(currLevelIndex).isCompleted()) {
      textSize(128);
      background(255);
      fill(0);
      if (!FireBoy.survival()) {
        text("Oh No!", 150, 200);
      }
      if (!WaterGirl.survival()) {
        text("Oh No!", 150, 200);
      }
    }
    if (FireBoy.complete() && WaterGirl.complete() && FireBoy.survival() && WaterGirl.survival()) {
      levels.get(currLevelIndex).setCompleted(true);
      levels.get(currLevelIndex).completeLevel();
    }
    if (overRect()) {
      contColor = color(53);
    } else {
      contColor = color(130, 127, 129);
    }
  }
}
