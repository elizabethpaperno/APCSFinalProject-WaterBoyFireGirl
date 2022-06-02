public class Character {
  color a; 
  //top left corner of rectangle 
  PVector pos;
  PVector vel;
  final float GRAVITY;
  final float MOVE_MAG;
  final float MAX_XVEL;
  final float JUMP_MAG;
  final float FRICTION;
  boolean living;
  boolean jumped;
  boolean completed; 
  boolean horizontalPressed;
  int gemsCollected;
  int playerWidth;
  int playerHeight;
  float bottom;
  float top;
  Level b;

  //(x,y) = top left???? yeah that makes sense 
  //constructor
  public Character(color cool, int x, int y) {
    top = y;
    bottom = y-20;
    pos = new PVector(x, y);
    vel = new PVector(0, 0);
    a = cool;
    gemsCollected =  0;
    GRAVITY = 0.2;
    MOVE_MAG = 0.3;
    MAX_XVEL = 3;
    JUMP_MAG = 3;
    FRICTION = 0.5;
    playerWidth = 30;
    playerHeight = 40;
    living =  true;
    horizontalPressed = false;
    completed = false;
  }

  //displaying characters
  void display() {
    fill(a);
    noStroke();
    //System.out.print(pos.x);
    //System.out.print(pos.y);
    rect(pos.x, pos.y, playerWidth, playerHeight);
    stroke(1);
  }
  void check() {
    /*
    if (pos.x > 600 && pos.x< width && pos.y <= 100) {
      changeC(true);
    }
    */
    ArrayList<Gem> gem = b.getGems();
    for (int i = 0; i < gem.size(); i++) {
      Gem a = gem.get(i); 
      if (range(pos.x, pos.x+playerWidth, pos.y, pos.y +playerHeight, a.getPixelX(), a.getPixelY()) &&  gem.get(i).getColor() == getColor()) {
        System.out.print(pos.y);
        System.out.print(a.getPixelY());
        gem.get(i).setCollected(true);
        a.hide();
        addGem();
      }
    }
    ArrayList<Lava> l = b.getLava();
    for (int i = 0; i < l.size(); i++) {
      Lava d = l.get(i);
      if (range(d.getPixelX(), d.getPixelX() + d.getPixelWidth(), d.getPixelY(), d.getPixelY() +d.getPixelHeight(), pos.x, pos.y +playerHeight) && d.getColor() != getColor())
      {
        justice(false);
      }
    }
    ArrayList<Door> d = b.getDoors();
    for (int i = 0; i< d.size(); i++) {
      Door a = d.get(i);
      if (a.getColor() == getColor()){
        if ( (pos.x >= a.getPixelX() -5 && pos.x + playerWidth <= a.getPixelX() +5 +  a.getPixelWidth()) && (pos.y >= a.getPixelY() -5  && pos.y + playerHeight <= a.getPixelY() + 5 + a.getPixelHeight())) {
          a.setOpen(true);
          changeC(true);
          //System.out.println("door Opened");
        } else {
          a.setOpen(false);
          changeC(false);
        }
      }
    }
  }
  boolean range(float x1, float x2, float y1, float y2, float oX, float oY) {
    return (oX >= x1 && oX <=x2 && oY >= y1 && oY <=y2);
  }
  void run() {
    check();
    if (survival()) {
      if (!horizontalPressed) {
        vel.set(vel.x * FRICTION, vel.y);
      }
      if (checkXRange(int(pos.x), int(pos.x + playerWidth), int(pos.y))) { //detects ceiling collision
        vel.set( vel.x, 0);
        vel.add(new PVector(0, GRAVITY));
      } else if (checkXRange(int(pos.x), int(pos.x+playerWidth), int(pos.y+playerHeight))) { //detects floor collision
        jumped = false;
        vel.set(vel.x, 0);
      } else if (checkYRange(int(pos.y), int (pos.y+playerHeight), int(pos.x))) {
        vel.set(-vel.x, 0);
        vel.add(new PVector(0, GRAVITY));
      } else if (checkYRange(int(pos.y), int(pos.y+playerHeight), int(pos.x +playerWidth))) {
        vel.set(-vel.x, 0);
        vel.add(new PVector(0, GRAVITY));
      } else {
        vel.add(new PVector(0, GRAVITY));
      }

      if (pos.x >= width - playerWidth-20 || pos.x <= playerWidth-20) {
        vel.set(-vel.x, vel.y);
      }
      if (pos.y >= height - playerHeight || pos.y <= playerHeight) {
        vel.set(vel.x, 0);
      }

      pos.add(vel);
      horizontalPressed = false;
      ////index through all f the arraylist
    }
  }
  //Accessor Methods
  public color getColor() {
    return a;
  }
  public boolean survival() {
    return living;
  }
  public int gemsTotal() {
    return gemsCollected;
  }
  public boolean complete() {
    return completed;
  }


  //Mutator Methods
  public void justice(boolean change) {
    living = change;
  }
  public void addGem() {
    gemsCollected +=1;
  }
  public void changePos(PVector a) {
    pos = a;
  }

  public void changeV(float hor, float ver) {
    vel = new PVector(hor, ver);
  }

  public void levelAccess(Level a) {
    b = a;
  }
  public PVector place() {
    return pos;
  }
  public void changeC(boolean a) {
    completed = a;
  }
  //collision check 
  //returns true if there is somethinng blocking it 
  public boolean checkXRange(int xBegin, int xEnd, int yCor) {
    for (int i = xBegin; i <= xEnd; i++) {
      //rect(i,yCor,10,10);
      if (b.hitGround(i, yCor) == true) return true;
    }
    return false;
  }
  // returns empty or not- not on ground, returns true  if vertically it isnt empty return false (something blocking it)
  public boolean checkYRange(int yBegin, int yEnd, int xCor) {
    for (int i = yBegin; i <=yEnd; i ++) {
      //rect(xCor,i,10,10);
      if (b.hitGround(xCor, i) == true) return true;
    } 
    return false;
  }
  //Movement Methods
  public void move(PVector dir) {

    if (dir.y == 1&& !jumped) { 
      vel.add(0, -JUMP_MAG);
      pos.set(new PVector(pos.x+10, pos.y-35));
      jumped = true;
    }
    if (abs(dir.x) == 1) { //if moving in either left or right dir
      vel.add(new PVector(dir.x * MOVE_MAG, 0));
      vel.set(vel.x > 0 ? min(MAX_XVEL, vel.x) : max(-MAX_XVEL, vel.x), vel.y);
      horizontalPressed = true;
    }
  }

  //Obstacle methods
  //public void moveWithPlatform(int vel) {
  //  pos.x += vel;
  //}
  //public void moveWithBlock(Item b, int velocity) {
  //  if (b.getX == pos.x && b.getY == pos.y ) {
  //    b.setX();
  //    b.setY();
  //  }
  //}
  //public void gemCollects(PVector collect) {
  //  if (collect.equals(pos)){addGem();}
  //}

  //keyboard stuff
}
