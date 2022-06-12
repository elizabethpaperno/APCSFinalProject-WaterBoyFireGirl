import java.io.*;
import java.util.*;
Character FireBoy;
Character WaterGirl;
int PIXEL_WIDTH;
int PIXEL_LENGTH;

//for continue button
int contX, contY;
int contWid = 300;
int contHgt = 70;
color contColor = color(130, 127, 129);
boolean contOver = false;

//for introscreen
boolean INTRO_SCREEN = true;
color goldColor = color(218, 165, 32);

Maze m1;
Level l1;
ArrayList<Level> levels;
int currLevelIndex;
ArrayList<Maze> mazes;

boolean[] keys = new boolean[6];
PFont myFont;

boolean PAUSE_SCREEN = false;

PImage intro;
void setup() {
  size(800, 600);

  //Maze m1 = new Maze("Level1Edited.txt", 30, 40);
  //Level l1 = new Level(1, m1, "Level1_Items.txt", 70, 520, 70, 420);
  Maze m2 = new Maze("Level2.txt", 30, 40);
  //Level l2 = new Level(2, m2, "Level2_Items.txt", 20 * 3, 20 * 3, 20 * 36, 20 * 3);
  PIXEL_WIDTH = height/m2.width();
  PIXEL_LENGTH = (int)width/m2.height();

  Maze m1 = new Maze("Level1Edited.txt", 30, 40);
  Level l1 = new Level(1, m1, "Level1_Items.txt", 70, 120, 70, 120);
  PIXEL_WIDTH = height/m1.width();
  PIXEL_LENGTH = (int)width/m1.height();

  currLevelIndex = 0;
  levels = new ArrayList<Level>();
  mazes = new ArrayList<Maze>();

  //add all levels (as needed)
  levels.add(l1);
  mazes.add(m1);
  //levels.add(l2);
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

  PFont myFont = createFont("Georgia", 32);
  textFont(myFont);
  //textAlign(CENTER, CENTER);
  //fill(218,165,32);
  //text("FireBoy & WaterGirl",100, 200);

  contX = width/2 - contWid/2;
  contY = height/2 - contHgt/2;
  intro = loadImage("introScreenResized.jpg");
}
void mousePressed() {
  if (overRect()) {
    if (currLevelIndex + 1 < levels.size()) {
      currLevelIndex += 1;
      FireBoy.changeC(false);
      WaterGirl.changeC(false);
    } else {
      FireBoy.justice(false);
      WaterGirl.justice(false);
      background(contColor);
      fill(218, 165, 32);
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
  //cgeck if borth are alive, else, backgroun(0), game over

  if (INTRO_SCREEN){
    textSize(30);
    text("INTRO - FIX LATER",50,50);
  } else {
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

  FireBoy = levels.get(currLevelIndex).FireBoy();
  WaterGirl = levels.get(currLevelIndex).WaterGirl();
  if (FireBoy.survival() && WaterGirl.survival() && (!FireBoy.complete() || !WaterGirl.complete())) {
    levels.get(currLevelIndex).play();
    //added code from here to play() in level
  }
  if ( (!FireBoy.survival() || !WaterGirl.survival()) && !levels.get(currLevelIndex).isCompleted()) {
    levels.get(currLevelIndex).gameOver();
  }
  if (FireBoy.complete() && WaterGirl.complete() && FireBoy.survival() && WaterGirl.survival()) {
    levels.get(currLevelIndex).setCompleted(true);
    levels.get(currLevelIndex).completeLevel();
  }
  if (overRect()) {
    contColor = color(53);
  } else {
    contColor = color(130, 127, 129);
//>>>>>>> 0663ece72a4e7d02e174fafdda6c9395d7ae49f9
  }}
}
