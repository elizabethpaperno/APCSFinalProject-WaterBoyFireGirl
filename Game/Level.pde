public class Level { 
  private int difficulty;
  ArrayList<Item> items; 
  Maze board; 
  //file should be CSV in format --> Item Sub class,x,y,h,w, additional features
  String fname;
  Item[][] itemBoard; 
  
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
      Item toBeAdded;
      switch (rowStr[0]){
      //subclasses of item not yet written, but will be
      case "Block":
        toBeAdded = new Item(Integer.parseInt(rowStr[1]), Integer.parseInt(rowStr[2]), Integer.parseInt(rowStr[3]), Integer.parseInt(rowStr[4]));
        items.add(toBeAdded); 
      case "Lava":
        toBeAdded = new Lava(Integer.parseInt(rowStr[1]), Integer.parseInt(rowStr[2]), Integer.parseInt(rowStr[3]), Integer.parseInt(rowStr[4]), Integer.parseInt(rowStr[5]));
        items.add(toBeAdded); 
        // index 5: color 
      case "Door":
        toBeAdded = new Door(Integer.parseInt(rowStr[1]), Integer.parseInt(rowStr[2]), Integer.parseInt(rowStr[3]), Integer.parseInt(rowStr[4]), Integer.parseInt(rowStr[5]), false);
        // index 5: color, Index 6: isOpen (false)
        items.add(toBeAdded);
      case "Lever":
      
      case "Platform":
      case "Button":
      case "Gem":
  }
  
  Item[][] getItemBoard(){
    return 
  
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
