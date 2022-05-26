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
void press() {
}
void release() {
}
void draw() {
  
  FireBoy.display();
  WaterGirl.display();
}
