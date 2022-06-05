import java.io.*;
import java.util.*;
Character FireBoy;
Character WaterGirl;
int PIXEL_WIDTH;
int PIXEL_LENGTH;

//for continuye button
int contX, contY;
int contWid = 150;
int contHgt = 40;
color contColor;
boolean contOver = false;

Maze m1;
Level l1;
ArrayList<Level> levels;
int currLevelIndex;
ArrayList<Maze> mazes;

boolean[] keys = new boolean[6];
PFont myFont;

void setup() {
  size(800, 600);
  Maze m1 = new Maze("Level1Edited.txt", 30, 40);
  Level l1 = new Level(1, m1, "Level1_Items.txt");
  PIXEL_WIDTH = height/m1.width();
  PIXEL_LENGTH = (int)width/m1.height();
  currLevelIndex = 0;
  levels = new ArrayList<Level>();
  mazes = new ArrayList<Maze>();
  
  //add all levels (as needed)
  levels.add(l1);
  mazes.add(m1);
  
  try {
    for (int i = 0; i < levels.size(); i++){
      mazes.get(i).readFileAndConstruct();
      levels.get(i).createLevel();
    } 
  }
  catch(FileNotFoundException e) {
    System.out.println("Invalid filename");
  }
  
  //positions for testing door
  //FireBoy = new Character(color(255, 0, 0), 350, 57);
  //WaterGirl = new Character(color(0, 0, 255), 350, 57 );
  FireBoy = new Character(color(255, 0, 0), 70, 520);
  WaterGirl = new Character(color(0, 0, 255), 70, 450 );
  
  FireBoy.levelAccess(levels.get(currLevelIndex));
  WaterGirl.levelAccess(levels.get(currLevelIndex));
  //System.out.print(FireBoy.checkXRange(70, 100, 585));
  //background(51); 
  PFont myFont = createFont("Georgia", 32);
  textFont(myFont);
  //textAlign(CENTER, CENTER);
  //fill(218,165,32);
  //text("FireBoy & WaterGirl",100, 200);
  
}

void mousePressed() {
  if (rectOver) {
    if (currLevelIndex + 1 < levels.size()){
      FireBoy.changeC(false);
      WaterGirl.changeC(false);
      currLevelIndex += 1;
    } else {
      fill(218,165,32);
      text("Sorry :( No more Levels Available", 10,200);
    }
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

void draw() {
  //cgeck if borth are alive, else, backgroun(0), game over

  if (FireBoy.survival() && WaterGirl.survival() && (!FireBoy.complete() || !WaterGirl.complete())) {
    levels.get(currLevelIndex).play();

    FireBoy.display();
    WaterGirl.display();
    FireBoy.run();
    WaterGirl.run();
    if (keys[1] && !keys[2] && keys[0]) {
      WaterGirl.move(new PVector(-1, 1));
    } else if (!keys[1] && keys[2] && keys[0]) {
      WaterGirl.move(new PVector(1, 1));
    } else if (keys[1] && !keys[2]) {
      WaterGirl.move(new PVector(-1, 0));
    } else if (keys[2] && !keys[1]) {
      WaterGirl.move(new PVector(1, 0));
    } else if (keys[0]) {
      WaterGirl.move(new PVector(0, 1));
    }
    if (keys[4] && !keys[5] && keys[3]) {
      FireBoy.move(new PVector(-1, 1));
    } else if (keys[5] && !keys[4] && keys[3]) {
      FireBoy.move(new PVector(1, 1));
    } else if (keys[4] && !keys[5]) {
      FireBoy.move(new PVector(-1, 0));
    } else if (keys[5] && !keys[4]) {
      FireBoy.move(new PVector(1, 0));
    } else if (keys[3]) {
      FireBoy.move(new PVector(0, 1));
    }
    
  } 
  if ( !FireBoy.survival() || !WaterGirl.survival()){
      textSize(128);
      fill(255);
      text("U Done", 150, 200);
  }
  if(FireBoy.complete() && WaterGirl.complete()){
    levels.get(currLevelIndex).setCompleted(true);
    levels.get(currLevelIndex).completeLevel();
    background(130, 127, 129);
    
  }
}
