void setup() {
  size(800, 800);
}
void draw() {
  final int a = 0;
  color c  = color(255, 204, 0);
  Character red = new Character(c, a, 2);

import java.io.*;
import java.util.*;
void setup() {
  size(800, 800);
  Maze m1 = new Maze("testingMaze1.txt", 4, 5); 
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

void draw() {
  final int a = 0;
  color c = color(255, 204, 0);
  //Character red = new Character(c, a, 2);
}
