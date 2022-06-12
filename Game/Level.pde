public class Level {
  private int difficulty;
  private ArrayList<Item> blocks = new ArrayList<Item>();
  private ArrayList<Lava> lavas = new ArrayList<Lava>();
  private ArrayList<Door> doors = new ArrayList<Door>();
  private ArrayList<Platform> platforms = new ArrayList<Platform>();
  private ArrayList<Button> buttons = new ArrayList<Button>();
  private ArrayList<Lever> levers = new ArrayList<Lever>();
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
  private int[][] kms;
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
    FireBoy.characterC(WaterGirl);
    WaterGirl.characterC(FireBoy);
    FireBoy.levelAccess(this);
    WaterGirl.levelAccess(this);
    FireBoy.mazeAccess(board);
    WaterGirl.mazeAccess(board);
  }
  void kmsSet() {
    kms = new int[board.getBoard().length][board.getBoard()[0].length];
    for (int i = 0; i < kms.length; i ++) {
      for (int d = 0; d < kms[i].length; d++) {
        kms[i][d] = board.getBoard()[i][d];
      }
    }
  }
  void kmsEdit(int x, int y, int x2, int y2, int type) {
    for (int i = x; i <=x2; i++) {
      for (int d = y; d <=y2; d++) {
        kms[d][i] = type;
      }
    }
  }
  void resetChars() {
    FireBoy = new Character(color(255, 0, 0), xPos1, yPos1);
    WaterGirl = new Character(color(0, 0, 255), xPos2, yPos2);
    FireBoy.characterC(WaterGirl);
    WaterGirl.characterC(FireBoy);
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
        Lava toBeAdded2 = new Lava(Integer.parseInt(rowStr[1]), Integer.parseInt(rowStr[2]), col2, this, Integer.parseInt(rowStr[6]));
        lavas.add(toBeAdded2);
      } else if (rowStr[0].equals("Door")) {
        color col3 = color(Integer.parseInt(rowStr[3]), Integer.parseInt(rowStr[4]), Integer.parseInt(rowStr[5]));
        Door toBeAdded3 = new Door(Integer.parseInt(rowStr[1]), Integer.parseInt(rowStr[2]), col3, this);
        doors.add(toBeAdded3);
      } else if (rowStr[0].equals("Gem")) {
        color col4 =  color(Integer.parseInt(rowStr[3]), Integer.parseInt(rowStr[4]), Integer.parseInt(rowStr[5]));
        Gem toBeAdded4 = new Gem(Integer.parseInt(rowStr[1]), Integer.parseInt(rowStr[2]), col4, this);
        gems.add(toBeAdded4);
      } else if (rowStr[0].equals("2Button")) {
        Platform linkedPlat =  new Platform(Integer.parseInt(rowStr[5]), Integer.parseInt(rowStr[6]), Integer.parseInt(rowStr[7]), Integer.parseInt(rowStr[8]), Integer.parseInt(rowStr[9]), Integer.parseInt(rowStr[10]), this);
        Button toBeAdded5 = new Button(Integer.parseInt(rowStr[1]), Integer.parseInt(rowStr[2]), linkedPlat, this);
        Button toBeAdded6 = new Button(Integer.parseInt(rowStr[3]), Integer.parseInt(rowStr[4]), linkedPlat, this);
        buttons.add(toBeAdded5);
        buttons.add(toBeAdded6);
        platforms.add(linkedPlat);
      } else if (rowStr[0].equals("Button")) {
        Platform linkedPlat =  new Platform(Integer.parseInt(rowStr[3]), Integer.parseInt(rowStr[4]), Integer.parseInt(rowStr[5]), Integer.parseInt(rowStr[6]), Integer.parseInt(rowStr[7]), Integer.parseInt(rowStr[8]), this);
        Button toBeAdded5 = new Button(Integer.parseInt(rowStr[1]), Integer.parseInt(rowStr[2]), linkedPlat, this);
        buttons.add(toBeAdded5);
        platforms.add(linkedPlat);
        //println("gem:" + rowStr[0] + Arrays.toString(rowStr));
      } else if (rowStr[0].equals("Block")) {
        Item toBeAdded1 = new Item(Integer.parseInt(rowStr[1]), Integer.parseInt(rowStr[2]), 2, 2, this);
        blocks.add(toBeAdded1);
      } else if (rowStr[0].equals("Lever")) {
        Platform linkedPlat =  new Platform(Integer.parseInt(rowStr[3]), Integer.parseInt(rowStr[4]), Integer.parseInt(rowStr[5]), Integer.parseInt(rowStr[6]), Integer.parseInt(rowStr[7]), Integer.parseInt(rowStr[8]), this);
        Lever toBeAdded5 = new Lever(Integer.parseInt(rowStr[1]), Integer.parseInt(rowStr[2]), linkedPlat, this);
        levers.add(toBeAdded5);
        platforms.add(linkedPlat);
      }
    }
  }


  int getDifficulty() {
    return difficulty;
  }

  //returns if the BOARD is empty in position (does not take Items into acct)
  boolean hitGround(int x, int y) {
    fill(0);
    try {
      return (kms[y/PIXEL_LENGTH][x/PIXEL_WIDTH] == 1);
    }
    catch(Exception e) {
      return false;
    }
  }
  ArrayList<Item> getBlocks() {
    return blocks;
  }
  ArrayList<Gem> getGems() {
    return gems;
  }
  int totalGems() {
    return gems.size();
  }
  ArrayList<Door> getDoors() {
    return doors;
  }
  ArrayList<Button> getButtons() {
    return buttons;
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
      for (int i = 0; i < levers.size(); i++) {
        levers.get(i).display();
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
