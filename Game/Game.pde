import java.io.*;
import java.util.*;
Character FireBoy;
Character WaterGirl;
int PIXEL_WIDTH;
int PIXEL_LENGTH;
Maze m1 = new Maze("Level1Edited.txt", 30, 40);
Level l1 = new Level(1, m1, "Level1_Items.txt");

boolean[] keys = new boolean[6];

void setup() {
  size(800, 600);
  PIXEL_WIDTH = height/m1.width();
  PIXEL_LENGTH = (int)width/m1.height();
  try {
    m1.readFileAndConstruct();
    l1.createLevel();
  }
  catch(FileNotFoundException e) {
    System.out.println("Invalid filename");
  }

  FireBoy = new Character(color(255, 0, 0), 70, 120);
  WaterGirl = new Character(color(0, 0, 255), 70, 150 );

  FireBoy.levelAccess(l1);
  WaterGirl.levelAccess(l1);
  System.out.print(FireBoy.checkXRange(70, 100, 585));
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

  if (FireBoy.survival() && WaterGirl.survival() && !FireBoy.complete() && !WaterGirl.complete()) {
    l1.play();

    FireBoy.display();
    WaterGirl.display();
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
    FireBoy.run();
    WaterGirl.run();
  } 
  if ( !FireBoy.survival() || !WaterGirl.survival()){
   textSize(128);
      fill(255);
      text("U Done", 150, 200);
  }
  if(FireBoy.complete() && WaterGirl.complete()){
  l1.setCompleted(true);
  l1.completeLevel();}
}
