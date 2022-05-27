public class Level { 
  private int difficulty;
  ArrayList<Item> blocks; 
  ArrayList<Lava> lavas; 
  ArrayList<Door> doors; 
  ArrayList<Lever> levers; 
  ArrayList<Platform> platforms; 
  ArrayList<Gem> gems; 
  Maze board; 
  //file should be CSV in format --> Item Sub class,x,y,h,w, additional features
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
    String[] lines = loadStrings(fname);
    for (int i = 0; i < lines.length; i++){
      String[] rowStr = lines[i].split(","); 
      switch (rowStr[0]){
      //subclasses of item not yet written, but will be
      case "Block":
        Block toBeAdded = new Block(Integer.parseInt(rowStr[1]), Integer.parseInt(rowStr[2]), Integer.parseInt(rowStr[3]), Integer.parseInt(rowStr[4]));
        blocks.add(toBeAdded); 
      case "Lava":
        Lava toBeAdded = new Lava(Integer.parseInt(rowStr[1]), Integer.parseInt(rowStr[2]), Integer.parseInt(rowStr[3]), Integer.parseInt(rowStr[4]), Integer.parseInt(rowStr[5]));
        lavas.add(toBeAdded); 
        // index 5: color 
      case "Door":
        new col = color(Integer.parseInt(rowStr[5]), Integer.parseInt(rowStr[6]), Integer.parseInt(rowStr[7])); 
        Door toBeAdded = new Door(Integer.parseInt(rowStr[1]), Integer.parseInt(rowStr[2]), Integer.parseInt(rowStr[3]), Integer.parseInt(rowStr[4]), col, false);
        // index 5,6,7: color, Index 7: isOpen (false)
        doors.add(toBeAdded);
      /*
      case "Lever": 
      case "Platform":
      case "Button":
       */
      case "Gem":
        new col = color(Integer.parseInt(rowStr[5]), Integer.parseInt(rowStr[6]), Integer.parseInt(rowStr[7])); 
        Gem toBeAdded = new Gem(Integer.parseInt(rowStr[1]), Integer.parseInt(rowStr[2]), Integer.parseInt(rowStr[3]), Integer.parseInt(rowStr[4]), col, false);
        // index 5,6,7: color, Index 6: isCollected (false)
        gems.add(toBeAdded);
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
