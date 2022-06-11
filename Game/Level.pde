public class Level {
  /* Interactions with Character (for Katherine):
   - use ArrayLists of diff types of Items to index through whne checking for collisions
   - if both characters are in front of Door (at the SAME TIME) --> setCompleted(true) --> completeLevel() --> stop running (shld be done for the level using if statement in play but stops charccters also)
   */
  private int difficulty;
  private ArrayList<Item> blocks = new ArrayList<Item>();
  private ArrayList<Lava> lavas = new ArrayList<Lava>();
  private ArrayList<Door> doors = new ArrayList<Door>();
  private ArrayList<Platform> platforms = new ArrayList<Platform>();
  private ArrayList<Button> buttons = new ArrayList<Button>();
  //ArrayList<Lever> levers;
  //ArrayList<Platform> platforms;
  private ArrayList<Gem> gems =new ArrayList<Gem>();
  private Maze board;
  //file should be CSV in format --> Item Sub class,x,y,h,w, additional features
  String fname;
  boolean isCompleted;
  private Character FireBoy;
  private Character WaterGirl;
  private int xPos1; 
  private int yPos1;
  private int xPos2; 
  private int yPos2;

  public Level(int diff, Maze linkedBoard, String filename, int x_Pos1, int y_Pos1, int x_Pos2, int y_Pos2) {
    difficulty = diff;
    board = linkedBoard;
    fname = filename;
    xPos1 = x_Pos1;
    yPos1 = y_Pos1;
    xPos2 = x_Pos2; 
    yPos2 = y_Pos2;
    FireBoy = new Character(color(255, 0, 0), xPos1, yPos1);
    WaterGirl = new Character(color(0, 0, 255), xPos2, yPos2);

    FireBoy.levelAccess(this);
    WaterGirl.levelAccess(this);
  }

  void resetChars() {
    FireBoy = new Character(color(255, 0, 0), xPos1, yPos1);
    WaterGirl = new Character(color(0, 0, 255), xPos2, yPos2);
    FireBoy.levelAccess(this);
    WaterGirl.levelAccess(this);
  }


  //1. read in file initalize all Items and add them to ArrayList items
  //
  void createLevel() throws FileNotFoundException {
    String[] lines = loadStrings(fname);
    //println(Arrays.toString(lines));
    for (int i = 0; i < lines.length; i++) {
      String[] rowStr = lines[i].split(",");
      //println(Arrays.toString(rowStr));
      if (rowStr[0].equals("Lava")) {
        color col2 = color(Integer.parseInt(rowStr[3]), Integer.parseInt(rowStr[4]), Integer.parseInt(rowStr[5]));
        Lava toBeAdded2 = new Lava(Integer.parseInt(rowStr[1]), Integer.parseInt(rowStr[2]), col2);
        lavas.add(toBeAdded2);
        //println("lava:" + rowStr[0] + Arrays.toString(rowStr));
      } else if (rowStr[0].equals("Door")) {
        color col3 = color(Integer.parseInt(rowStr[3]), Integer.parseInt(rowStr[4]), Integer.parseInt(rowStr[5]));
        Door toBeAdded3 = new Door(Integer.parseInt(rowStr[1]), Integer.parseInt(rowStr[2]), col3);
        doors.add(toBeAdded3);
        //println("door:" + rowStr[0] + Arrays.toString(rowStr));
      } else if (rowStr[0].equals("Gem")) {
        color col4 =  color(Integer.parseInt(rowStr[3]), Integer.parseInt(rowStr[4]), Integer.parseInt(rowStr[5]));
        Gem toBeAdded4 = new Gem(Integer.parseInt(rowStr[1]), Integer.parseInt(rowStr[2]), col4);
        gems.add(toBeAdded4);
        //println("gem:" + rowStr[0] + Arrays.toString(rowStr));
      } 
      //else if (rowStr[0].equals("Button")) {
      //  Platform linkedPlat =  new Platform(Integer.parseInt(rowStr[3]), Integer.parseInt(rowStr[4]), Integer.parseInt(rowStr[5]), Integer.parseInt(rowStr[6]), Integer.parseInt(rowStr[7]),Integer.parseInt(rowStr[7]));
      //  Button toBeAdded5 = new Button(Integer.parseInt(rowStr[1]), Integer.parseInt(rowStr[2]), linkedPlat);
      //  buttons.add(toBeAdded5);
      //  platforms.add(linkedPlat);
      //  //println("gem:" + rowStr[0] + Arrays.toString(rowStr));
      //} 
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
  boolean hitGround(int x, int y) {
    int[][] mz = board.getBoard();
    fill(0);

    try {
      return (mz[y/PIXEL_LENGTH][x/PIXEL_WIDTH] == 1);
    }
    catch(Exception e) {
      return false;
    }
  }

  ArrayList<Gem> getGems() {
    return gems;
  }
  ArrayList<Door> getDoors() {
    return doors;
  }
  void play() {
    //needs to be written much later on
    if (!isCompleted) {
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
      for (int i = 0; i < buttons.size(); i++) {
        buttons.get(i).display();
      }
      for (int i = 0; i < platforms.size(); i++) {
        platforms.get(i).display();
      }
      FireBoy.display();
      WaterGirl.display();
      FireBoy.run();
      WaterGirl.run();
      if (keys[1] && !keys[2] && keys[0]) {
        WaterGirl.move(new PVector(-1, 1));
      } else if (!keys[1] && keys[2] && keys[0]) {
        WaterGirl.move(new PVector(1, 1));
      } else if (keys[1] && !keys[2]) {
        WaterGirl.move(new PVector(-1, 0));
      } else if (keys[2] && !keys[1]) {
        WaterGirl.move(new PVector(1, 0));
      } else if (keys[0]) {
        WaterGirl.move(new PVector(0, 1));
      }
      if (keys[4] && !keys[5] && keys[3]) {
        FireBoy.move(new PVector(-1, 1));
      } else if (keys[5] && !keys[4] && keys[3]) {
        FireBoy.move(new PVector(1, 1));
      } else if (keys[4] && !keys[5]) {
        FireBoy.move(new PVector(-1, 0));
      } else if (keys[5] && !keys[4]) {
        FireBoy.move(new PVector(1, 0));
      } else if (keys[3]) {
        FireBoy.move(new PVector(0, 1));
      }
    }
  }
  ArrayList<Lava> getLava() {
    return lavas;
  }
  void setCompleted(boolean comp) {
    isCompleted = comp;
  }


  void completeLevel() {
    //needs to be figured out later
    if (isCompleted) {
      background(130, 127, 129);
      textSize(60);
      fill(goldColor);
      stroke(0);
      text("LEVEL COMPLETED", 130, 150);
      fill(contColor);
      rect(contX, contY, contWid, contHgt);
      fill(goldColor);
      text("Continue", contX + contWid/9, contY + 7 * contHgt/8);
      textSize(20);
    }
  }
  void gameOver() {    
    textSize(108);
    background(255);
    fill(0);

    text("GAME OVER", 150, 200);
  }
  boolean isCompleted() {
    return isCompleted;
  }

  Character FireBoy() {
    return FireBoy;
  }

  Character WaterGirl() {
    return WaterGirl;
  }
}
