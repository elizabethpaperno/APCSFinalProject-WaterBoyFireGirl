public class Character {
  color a; 
  //top left corner of rectangle 

  boolean living;
  int gemsCollected;
  int dirFactor = 15;
  PVector accel;
  PVector vel;
  PVector pos;
  float leftS;
  float rightS;
  float bottom;
  float top;
  final int right = 1;
  final int left = -1;
  final int up = 1;
  final int down =  -1; 
  final float acceleration = -0.5; 
  final int width = 15;
  final int height = 3f  0;

  //(x,y) = top left???? yeah that makes sense 
  //constructor
  public Character(color cool, int x, int y) {
    leftS = x; 
    rightS = x+10;
    top = y;
    bottom = y-20;
    pos= new PVector(x, y);
    vel = new PVector(0, 0);
    a = cool;
    gemsCollected =  0;
  }

  //displaying characters
  void display() {
    fill(a);
    noStroke();
    rect(pos.x, pos.y, 10, 20);
    stroke(1);
  }

  void run() {
    accel.add(new PVector(0, 2)); //gravity
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
      Velocity.y *= -1;
    }
    if (checkXRange(pos.x, pos.x +10, pos.y-20) == false) {
      Velocity.y += .15;
    }
    if (checkYRange(pos.y, pos.y -20) != false) {
    }//if 
    if (checkYRange(pos.y, pos.y -20) != false && Velocity <=0) {
    }
    //vel.add(dir.mult(dirFactor));
    if (dir == <1, 1>) {
      jump(right);
    }
    if (dir == <-1, 1>) {
      jump(left);
    }
    if (dir == <1, 0>) {
      pos.x += Velocty.x;
    }
    if (dir == <-1, 0>) {
      pos.x -= Velocty.x;
    }
  }
  public void jump(int dir) {
    pos.x += Velocity.x * dir;
    pos.y +=Velocity.y;
  }
  //Obstacle methods
}
