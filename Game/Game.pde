import java.io.*;
import java.util.*;
Character FireBoy;
Character WaterGirl;
int PIXEL_WIDTH;
int PIXEL_LENGTH;
Maze m1 = new Maze("Level1.txt", 30, 40);
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

  FireBoy = new Character(color(255, 0, 17), 70, 550);
  WaterGirl = new Character(color(0, 27, 255), 100, 550 );

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
    println("UP");
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

  l1.play();

  FireBoy.display();
  WaterGirl.display();
  if (keys[1] && !keys[2]) {
    FireBoy.move(new PVector(-1, 0));
  } else if (keys[2] && !keys[1]) {
    FireBoy.move(new PVector(1, 0));
  }
  if (keys[0]) {
    FireBoy.move(new PVector(0, 1));
  }

  if (keys[4] && !keys[5]) {
    WaterGirl.move(new PVector(-1, 0));
  } else if (keys[5] && !keys[4]) {
    WaterGirl.move(new PVector(1, 0));
  }
  if (keys[3]) {
    WaterGirl.move(new PVector(1, 0));
  }
  FireBoy.run();
  WaterGirl.run();
}
