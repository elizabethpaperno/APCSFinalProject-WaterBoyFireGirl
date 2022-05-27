public class Character {
  color a; 
  //top left corner of rectangle 
  int x;
  int y; 
  float velX;
  float velY;
  float acceleration;
  boolean living;
  int gemsCollected;
  float leftS;
  float rightS;
  float bottom;
  float top;

  //(x,y) = top left???? yeah that makes sense 
  //constructor
  public Character(color cool, int x, int y) {
    leftS = x; 
    rightS = x+10;
    top = y;
    bottom = y-20;
    this.x= x;
    this.y = y;
    a = cool;
    gemsCollected =  0;
  }

  //displaying characters
  void display() {
    fill(a);
    noStroke();
    rect(x, y, 10, 20);
    stroke(1);
    if (checkYRange(x, x+10, y-20)== true) {
      y +=.15;
    }
  }

  void run() {
    vel.y -= acceleration //gravity
    vel.add(accel);

    pos.add(vel);
    if (pos.x >= width || pos.x <= 0) {
      vel.set(0, vel.y);
    }
    if (pos.y >= height || pos.y <= 0) {
      vel.set(vel.x, 0);
    }

    accel.setMag(0);
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
    if (checkXRange(pos.x, pos.x +10, pos.y) == false) {
      vel.y *= -1;
    }
    if (checkXRange(pos.x, pos.x +10, pos.y-20) == false) {
      vel.y += .15;
    }
    if (dir == <1, 1>) {
      jump(right);
    }
    if (dir == <-1, 1>) {
      jump(left);
    }
    if (dir == <1, 0>) {
      pos.x += Velocity.x;
    }
    if (dir == <-1, 0>) {
      pos.x -= Velocity.x;
    }
  }
  public void jump(int dir) {
    pos.x += vel.x * dir;
    pos.y +=vel.y;
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
