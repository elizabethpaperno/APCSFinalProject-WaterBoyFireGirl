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
  boolean horizontalPressed;
  boolean jumped;
  int gemsCollected;
  int playerWidth;
  int playerHeight;
  float bottom;
  float top;

  //(x,y) = top left???? yeah that makes sense 
  //constructor
  public Character(color cool, int x, int y) {
    top = y;
    bottom = y-20;
    pos = new PVector(x, y);
    vel = new PVector(0, 0);
    a = cool;
    gemsCollected =  0;
    GRAVITY = 0.1;
    MOVE_MAG = 0.3;
    MAX_XVEL = 3;
    JUMP_MAG = 3;
    FRICTION = 0.5;
    playerWidth = 10;
    playerHeight = 20;
    
  }

  //displaying characters
  void display() {
    fill(a);
    noStroke();
    rect(pos.x, pos.y, playerWidth, playerHeight);
    stroke(1);
    
  }

  void run() {
    
    if (!checkXRange(int(pos.x), int(pos.x + playerWidth), int(pos.y))) { //detects ceiling collision
      vel.set(vel.x, 0);
    } else if (checkYRange(int(pos.x), int(pos.x+playerWidth), int(pos.y-playerHeight))) { //detects floor collision
      jumped = false;
      vel.set(vel.x, 0);
    } else {
      vel.add(new PVector(0, GRAVITY));
    }
    
    if (pos.x >= width - playerWidth || pos.x <= playerWidth) {
      vel.set(0, vel.y);
    }
    if (pos.y >= height - playerHeight || pos.y <= playerHeight) {
      vel.set(vel.x, 0);
    }
    
    pos.add(vel);
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

  //collision check 
  //returns if there is somethinng blocking it 
  public boolean checkXRange(int xBegin, int xEnd, int yCor) {
    for (int i = xBegin; i <= xEnd; i++) {
      if (Level.isEmptySpace(i, yCor) == false) return false;
    }
    return true;
  }
  // returns empty or not- not on ground, returns true  if vertically it isnt empty return false (something blocking it)
  public boolean checkYRange(int yBegin, int yEnd, int xCor) {
    for (int i = yBegin; i <=yEnd; i ++) {
      if (Level.isEmptySpace(xCor, i) == false) return false;
    } 
    return true;
  }
  //Movement Methods
  public void move(PVector dir) {
    if(dir.y == 1 && !jumped){
      jump();
    }
    if (abs(dir.x) == 1) {
      horizontalPressed = true;
      vel.add(dir.mult(MOVE_MAG * dir.x));
      vel.set(vel.x > 0 ? min(MAX_XVEL, vel.x) : max(MAX_XVEL, vel.x), vel.y);
    }
  }
  public void jump() {
    vel.add(new PVector(0, JUMP_MAG));
    jumped = true;
  }
  //Obstacle methods
  public void moveWithPlatform(int vel) {
    pos.x += vel;
  }
  public void moveWithBlock(Item b, int velocity) {
    if (b.getX == pos.x && b.getY == pos.y ) {
      b.setX();
      b.setY();
    }
  }
  public void gemCollects(PVector collect) {
    if (collect.equals(pos)){addGem();}
  }
  
}
