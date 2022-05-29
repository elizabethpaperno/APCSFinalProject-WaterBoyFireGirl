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
  PIXEL_WIDTH = width/m1.width();
  PIXEL_LENGTH = (int)height/m1.height();
  FireBoy = new Character(3, 2, color(0));
  WaterGirl = new Character(3, 2, color(0));
}

void keyPressed() {
  if (key == UP && key==RIGHT) {
    FireBoy.changeRight(true);
    FireBoy.changeUp(true);
  } else if (key == UP && key == LEFT) {
    FireBoy.changeLeft(true);
    FireBoy.changeUp(true);
  } else if (key == UP) {
     FireBoy.changeUp(true);
  } else if (key == RIGHT) {
     FireBoy.changeRight(true);
  } else if (key == LEFT) {
     FireBoy.changeLeft(true);
  //} else if (keyCode == 87 && ke ) {
  //}
}}
//void keyReleased() {

//}
void draw() {
  l1.play();
  FireBoy.display();
  FireBoy.run();
  WaterGirl.display();
  WaterGirl.run();

}
