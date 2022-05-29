import java.io.*;
import java.util.*;
Character FireBoy; 
Character WaterGirl;
int PIXEL_WIDTH;
int PIXEL_LENGTH;
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
    FireBoy.pressed(new PVector (1, 1));
  } else if (key == UP && key == LEFT) {
    FireBoy.pressed(new PVector (-1, 1));
  } else if (key == UP) {
    FireBoy.pressed(new PVector(0, 1));
  } else if (key == RIGHT) {
    FireBoy.pressed(new PVector(1,0));
  } else if (key == LEFT) {
    FireBoy.pressed(new PVector(-1,0));
  }else if (keyCode == 87 && ke ){}
}
void keyReleased() {
}
void draw() {

  FireBoy.display();
  FireBoy.run()
    WaterGirl.display();
  WaterGirl.run();
}
