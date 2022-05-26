public class Level { 
  private int difficulty;
  ArrayList<Item> items; 
  Maze board; 
  //file should be CSV in format --> Item Sub class,x,y,h,w
  String fname;
  
  public Level(int diff, Maze linkedBoard, String filename){
    difficulty = diff;
    board = linkedBoard;
    fname = filename;
  }
  
  //returns if the BOARD is empty in position (does not take Itams into acct)
  boolean isEmpty(int x, int y){
  }
  
  //1. read in file initalize all Items and add them to ArrayList items
  //2. then place them into a 2D array of Items and return that
  Item[][] createLevel(){
    
  }
  
  
  int getDifficulty{
    return difficulty;
  }
  
  
  
  void play(){
    //needs to be written much later on
  }
  
  void completeLevel(){
    //needs to be figured out later
  }
}
