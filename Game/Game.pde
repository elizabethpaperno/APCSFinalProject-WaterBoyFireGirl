import java.io.*;
import java.util.*;
Character FireBoy; 
Character WaterGirl;
void setup() {
  size(800, 800);
  Maze m1 = new Maze("testingMaze1.txt", 4, 5);
  FireBoy = new Character(3, 2, color(0));
  WaterGirl = new Character(3, 2, color(0));
  try {
    m1.readFileAndConstruct();
    int[][] board = m1.getBoard();
    for (int[] row : board) {
      System.out.println(Arrays.toString(row));
    }
  }
  catch(FileNotFoundException e) {
    System.out.println("Invalid filename");
  }
}
void keyPressed() {
  if (key == UP && key==RIGHT) {
    FireBoy.move(new PVector(1, 1));
  } else if (key == UP && key == LEFT) {
    FireBoy.move(new PVector(-1, 1));
  } else if (key == UP) {
    FireBoy.move(new PVector(0, 1));
  } else if (key==LEFT) {
    FireBoy.move(new PVector(-1, 0));
  } else if (key == RIGHT) {
    FireBoy.move(new PVector(1, 0));
  } else if (keyCode == 65 && keyCode == 87) {
    WaterGirl.move(new PVector(-1, 1));
  } else if (keyCode == 68 && keyCode == 87) {
    WaterGirl.move(new PVector(1, 1));
  } else if (keyCode == 65) {
    WaterGirl.move(new PVector(-1, 0));
  } else if (keyCode == 68) {
    WaterGirl.move(new PVector (1, 0));
  }
}
void keyReleased() {
}
void draw() {

  FireBoy.display();
  WaterGirl.display();
}
