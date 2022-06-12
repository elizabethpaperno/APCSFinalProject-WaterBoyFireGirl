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
  final float MAX_YVEL;
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
  Maze z;
  //(x,y) = top left???? yeah that makes sense 
  //constructor
  public Character(color cool, int x, int y) {
    top = y;
    bottom = y-20;
    pos = new PVector(x, y);
    vel = new PVector(0, 0);
    a = cool;
    gemsCollected =  0;
    GRAVITY =0.27;
    MOVE_MAG = 0.5;
    MAX_XVEL = 3;
    JUMP_MAG = -6.5;
    FRICTION = 0.5;
    playerWidth = 30;
    playerHeight = 40;
    living =  true;
    horizontalPressed = false;
    completed = false;
    MAX_YVEL = 10;
  }
  void display() {
    fill(a);
    noStroke();
    rect(pos.x, pos.y, playerWidth, playerHeight);
    stroke(1);
  }
  void check() {
    ArrayList<Gem> gem = b.getGems();
    for (int i = 0; i < gem.size(); i++) {
      Gem a = gem.get(i); 
      if (range(pos.x, pos.x+playerWidth, pos.y, pos.y +playerHeight, a.getPixelX()+5, a.getPixelY()+5) &&  gem.get(i).getColor() == getColor()) {
        gem.get(i).setCollected(true);
        a.hide();
        addGem();
      }
    }
    ArrayList<Lava> l = b.getLava();
    for (int i = 0; i < l.size(); i++) {
      Lava d = l.get(i);
      if (range(d.getPixelX(), d.getPixelX() + d.getPixelWidth(), d.getPixelY(), d.getPixelY() +d.getPixelHeight(), pos.x+5, pos.y +playerHeight) && d.getColor() != getColor())
      {
        justice(false);
      }
    }
    ArrayList<Door> d = b.getDoors();
    for (int i = 0; i< d.size(); i++) {
      Door a = d.get(i);
      if (a.getOgColor() == getColor()) {
        if ( (pos.x >= a.getPixelX() -5 && pos.x + playerWidth <= a.getPixelX() +5 +  a.getPixelWidth()) && (pos.y >= a.getPixelY() -5  && pos.y + playerHeight <= a.getPixelY() + 5 + a.getPixelHeight())) {
          a.setOpen(true);
          changeC(true);
        } else {
          a.setOpen(false);
          changeC(false);
        }
      }
    }
    ArrayList<Button> butt = b.getButtons();
    for (int i = 0; i<butt.size(); i++) {
      Button a = butt.get(i);
      b.kmsEdit((int)(a.plat().getX()), (int)(a.plat().getY()), (int)(a.plat().getX() + a.plat().getWidth()), (int)a.plat().getY() + a.plat().getHeight(), 1);
      if (range(a.getPixelX(), a.getPixelX() + a.getPixelWidth(), a.getPixelY(), a.getPixelY() + a.getPixelHeight(), pos.x, pos.y +  playerHeight)) {
        a.plat().move();
      }
      if (!range(a.getPixelX(), a.getPixelX() + a.getPixelWidth(), a.getPixelY(), a.getPixelY() + a.getPixelHeight(), pos.x, pos.y +  playerHeight)
    }
    //ArrayList<Item> block = b.getBlocks();
    //for (int i = 0; i<block.size(); i++) {
    //  Item a = block.get(i);
    //  b.kmsEdit((int)(a.getX()), (int)(a.getY()), (int)(a.getX() + a.getWidth()), (int)a.getY() + a.getHeight(), 1);
    //  if (range(a.getPixelX() - a.getPixelWidth(), a.getPixelX(), a.getPixelY(), a.getPixelY()+a.getPixelHeight(), pos.x,pos.y)) {
    //    a.run();
    //    a.move(new PVector(1,0));
     
    //  } else if (range(a.getPixelX() + a.getPixelWidth(), a.getPixelX() + 2* a.getPixelWidth(), a.getPixelY(), a.getPixelY() + a.getPixelHeight(), pos.x, pos.y)) {
    //    a.run();
    //    a.move(new PVector(-1,0));
        
    //  }
    //} //<>//
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
      vel.add(new PVector(0, GRAVITY));
      if (MAX_YVEL < vel.y) {
        vel.y = MAX_YVEL;
      }
      if (checkYRange(int(pos.x), int(pos.x + playerWidth), int(pos.y))) { //detects ceiling collision
        vel.set( vel.x, 0);
        pos.set(pos.x, pos.y + 5);
      } 
      if (checkYRange(int(pos.x), int(pos.x+playerWidth), int(pos.y+playerHeight))) { //detects floor collision //<>//
        jumped = false;
        pos.set(pos.x, 10 * (int(pos.y / 10)));
        vel.set(vel.x, 0);
      } 
      if (checkXRange(int(pos.y), int (pos.y+playerHeight-2), int(pos.x)-2)) {//detects left collision
        vel.set(-vel.x, vel.y);
      } 
      if (checkXRange(int(pos.y), int(pos.y+playerHeight-2), int(pos.x +playerWidth))) {//detect right collisiion
        vel.set(-vel.x, vel.y);
      } 
      pos.add(vel);
      horizontalPressed = false;
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
  public void mazeAccess(Maze b ) {
    z = b;
  }
  public PVector place() {
    return pos;
  }
  public void changeC(boolean a) {
    completed = a;
  }
  //collision check 
  //returns true if there is somethinng blocking it 
  public boolean checkYRange(int xBegin, int xEnd, int yCor) {
    fill(0, 0, 0, 100);
    //rect(xBegin, yCor, xEnd-xBegin, 5);
    for (int i = xBegin; i <= xEnd; i++) {

      if (b.hitGround(i, yCor) == true) return true;
    }
    return false;
  }
  // returns empty or not- not on ground, returns true  if vertically it isnt empty return false (something blocking it)
  public boolean checkXRange(int yBegin, int yEnd, int xCor) {
    fill(0, 0, 0, 100);
    //rect(xCor, yBegin, 5,yEnd- yBegin);
    for (int i = yBegin; i <=yEnd; i ++) {

      if (b.hitGround(xCor, i) == true) return true;
    } 
    return false;
  }
  //Movement Methods
  public void move(PVector dir) {

    if (dir.y == 1&& !jumped) { 
      pos.set(new PVector(pos.x, pos.y-1));
      vel.add(new PVector(0, JUMP_MAG));
      //vel.set(vel.x, -JUMP_MAG);
      //pos.set(new PVector(pos.x, pos.y-1));
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
  //
  //public void moveWithBlock(Item b, int velocity) {
  //  if (b.getX == pos.x && b.getY == pos.y ) {
  //    b.setX();
  //    b.setY();
  //  }
  //}
}
