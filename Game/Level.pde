public class Level {
  /* Interactions with Character (for Katherine):
    - use ArrayLists of diff types of Items to index through whne checking for collisions
    - if both characters are in front of Door (at the SAME TIME) --> setCompleted(true) --> completeLevel() --> stop running (shld be done for the level using if statement in play but stops charccters also)
  */
  private int difficulty;
  private ArrayList<Item> blocks = new ArrayList<Item>();
  private ArrayList<Lava> lavas = new ArrayList<Lava>();
  private ArrayList<Door> doors = new ArrayList<Door>();
  //ArrayList<Lever> levers;
  //ArrayList<Platform> platforms;
  private ArrayList<Gem> gems =new ArrayList<Gem>();
  private Maze board;
  //file should be CSV in format --> Item Sub class,x,y,h,w, additional features
  String fname;
  boolean isCompleted;

  public Level(int diff, Maze linkedBoard, String filename) {
    difficulty = diff;
    board = linkedBoard;
    fname = filename;
  }


  //1. read in file initalize all Items and add them to ArrayList items
  //
  void createLevel() throws FileNotFoundException {
    String[] lines = loadStrings(fname);
    println(Arrays.toString(lines));
    for (int i = 0; i < lines.length; i++) {
      String[] rowStr = lines[i].split(",");
      println(Arrays.toString(rowStr));
      if (rowStr[0].equals("Lava")) {
        color col2 = color(Integer.parseInt(rowStr[3]), Integer.parseInt(rowStr[4]), Integer.parseInt(rowStr[5]));
        Lava toBeAdded2 = new Lava(Integer.parseInt(rowStr[1]), Integer.parseInt(rowStr[2]), col2);
        lavas.add(toBeAdded2);
        println("lava:" + rowStr[0] + Arrays.toString(rowStr));
      } else if (rowStr[0].equals("Door")) {
        color col3 = color(Integer.parseInt(rowStr[3]), Integer.parseInt(rowStr[4]), Integer.parseInt(rowStr[5]));
        Door toBeAdded3 = new Door(Integer.parseInt(rowStr[1]), Integer.parseInt(rowStr[2]), col3);
        doors.add(toBeAdded3);
        println("door:" + rowStr[0] + Arrays.toString(rowStr));
      } else if (rowStr[0].equals("Gem")) {
        color col4 =  color(Integer.parseInt(rowStr[3]), Integer.parseInt(rowStr[4]), Integer.parseInt(rowStr[5]));
        Gem toBeAdded4 = new Gem(Integer.parseInt(rowStr[1]), Integer.parseInt(rowStr[2]), col4);
        gems.add(toBeAdded4);
        println("gem:" + rowStr[0] + Arrays.toString(rowStr));
      } 
      //else if (rowStr[0].equals("Block")) {
      //  Item toBeAdded1 = new Item(Integer.parseInt(rowStr[1]), Integer.parseInt(rowStr[2]), 2, 2);
      //  blocks.add(toBeAdded1);
      //}

      /*
      case "Block":
       Item toBeAdded1 = new Item(Integer.parseInt(rowStr[1]), Integer.parseInt(rowStr[2]), 2, 2);
       blocks.add(toBeAdded1);

       case "Lava":

       case "Door":
       color col3 = color(Integer.parseInt(rowStr[3]), Integer.parseInt(rowStr[4]), Integer.parseInt(rowStr[5]));
       Door toBeAdded3 = new Door(Integer.parseInt(rowStr[1]), Integer.parseInt(rowStr[2]), col3);
       doors.add(toBeAdded3);
       println("door:" + rowStr[0] + Arrays.toString(rowStr));
       case "Gem":
       color col4 =  color(Integer.parseInt(rowStr[3]), Integer.parseInt(rowStr[4]), Integer.parseInt(rowStr[5]));
       Gem toBeAdded4 = new Gem(Integer.parseInt(rowStr[1]), Integer.parseInt(rowStr[2]), col4);
       gems.add(toBeAdded4);
       println("gem:" + rowStr[0] + Arrays.toString(rowStr));
       default:
       println("default");
       }

       case "Lever":
       case "Platform":
       case "Button":
       */
    }
    //println(gems.size());
    //println(lavas.size());
    //println(doors.size());
  }


  int getDifficulty() {
    return difficulty;
  }

  //returns if the BOARD is empty in position (does not take Items into acct)
  boolean hitGround(int x, int y){
    int[][] mz = board.getBoard();
    fill(0);
    if (y > height)return false;
    if (x >width)return false;
    try{
    return (mz[y/PIXEL_LENGTH][x/PIXEL_WIDTH] == 1);}catch(Exception e){return false;}

  }

ArrayList<Gem> getGems(){return gems;}
  void play() {
    //needs to be written much later on
    if (!isCompleted){
      board.display();
      for (int i = 0; i < blocks.size(); i++) {
        blocks.get(i).display();
      }
      for (int i = 0; i < doors.size(); i++) {
        doors.get(i).display();
      }
      for (int i = 0; i < gems.size(); i++) {
        gems.get(i).display();
      }
      for (int i = 0; i < lavas.size(); i++) {
        lavas.get(i).display();
      }
    }else{
      background(51);
    }
  }
 ArrayList<Lava> getLava(){return lavas;}
  void setCompleted(boolean comp){
    isCompleted = comp;
  }

  void completeLevel() {
    //needs to be figured out later
    if (isCompleted) {
      textSize(128);
      fill(255);
      text("LEVEL COMPLETED", 100, 200);
    }
  }
}
