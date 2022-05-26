public class Level { 
  private int difficulty;
  Item[] items; 
  Maze board; 
  String fname;
  
  public class Level(int diff, Maze linkedBoard, String filename){
    difficulty = diff;
    board = linkedBoard;
    fname = filename;
  }
  
  
}
