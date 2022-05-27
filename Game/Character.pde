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
    velX= 10;
    velY= 10;
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
    velY -= acceleration; //gravity
    if (x >= width || x <= 0) {
      velX = 0;
    }
    if (y >= height || y <= 0) {
      velY = 0;;
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
      if (Level.isEmptySpace(i, y) == false) return false;
    }
    return true;
  }
  // returns empty or not- not on ground, returns true  if vertically it isnt empty return false (something blocking it)
  public boolean checkYRange(int yBegin, int yEnd, int xCor) {
    for (int i = yBegin; i <=yEnd; i ++) {
      if (Level.isEmptySpace(x, i) == false) return false;
    } 
    return true;
  }
  //Movement Methods
  public void move(int xdir, int ydir) {
    if (checkXRange(x, x +10,y) == false) {
      velY *= -1;
    }
    if (xdir == 1 && ydir == 1) {
      jump(1);
    }
    if (xdir == -1 && ydir== 1) {
      jump(-1);
    }
    if (xdir == 1 && ydir == 0) {
      x += velX;
    }
    if (xdir ==-1 && ydir == 0) {
     x -= velX;
    }
  }
  public void jump(int dir) {
    x += velX * dir;
    y +=velY;
  }
  //Obstacle methods
  public void moveWithPlatform(int vel) {
    x += vel;
  }
  public void moveWithBlock(Item b, int velocity) {
    if (b.getX == x && b.getY == y ) {
      b.setX();
      b.setY();
    }
  }
  public void gemCollects(PVector collect) {
    if (collect.equals(pos)){addGem();}
  }
  
}
