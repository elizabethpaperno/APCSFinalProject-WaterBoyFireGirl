import java.io.*;
import java.util.*;
Character FireBoy;
Character WaterGirl;
int PIXEL_WIDTH;
int PIXEL_LENGTH;
Maze m1 = new Maze("Level1.txt", 30, 40);
Level l1 = new Level(1, m1, "needToTest.txt");

void setup() {
  size(800, 600);
  PIXEL_WIDTH = height/m1.width();
  PIXEL_LENGTH = (int)width/m1.height();
  try {
    m1.readFileAndConstruct();
  }
  catch(FileNotFoundException e) {
    System.out.println("Invalid filename");
  }
  FireBoy = new Character(color(255,0,17), 70, 550);
  WaterGirl = new Character(color(0,27,255),100, 550 );
  FireBoy.levelAccess(l1);
  WaterGirl.levelAccess(l1);
}

void keyPressed() {
//  if (key == UP && key==RIGHT) {
//    FireBoy.changeRight(true);
//    FireBoy.changeUp(true);
//  } else if (key == UP && key == LEFT) {
//    FireBoy.changeLeft(true);
//    FireBoy.changeUp(true);
//  } else if (key == UP) {
//    FireBoy.changeUp(true);
//  } else if (key == RIGHT) {
//    FireBoy.changeRight(true);
//  } else if (key == LEFT) {
//    FireBoy.changeLeft(true);
//    //} else if (keyCode == 87 && ke ) {
//    //}
//  }

FireBoy.move(new PVector(1,0));
}
//void keyReleased() {

//}
void draw() {
  l1.play();
  FireBoy.run();
  FireBoy.display();
  WaterGirl.display();
  System.out.println((FireBoy.place()).x);
  System.out.println((FireBoy.place()).y);
}
