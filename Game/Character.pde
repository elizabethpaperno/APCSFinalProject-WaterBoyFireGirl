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
  
  void run(){
    accel.add(new PVector(0, 2)); //gravity
    vel.add(accel);
    
    pos.add(vel);
    if(pos.x >= width || pos.x <= 0){
      vel.set(0, vel.y);
    }
    if(pos.y >= height || pos.y <= 0){
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
  
  public boolean checkCollision(PVector a){}

  //Mutator Methods
  public void justice(boolean change) {
    living = change;
  }
  public void addGem() {
    gemsCollected +=1;
  }
  public void changePos(PVector a){
    pos = a;
  }

  public void changeV(float hor, float ver) {
    vel = new PVector(hor, ver);
  }
  public void setLeft(float p){}
  //Movement Methods
  public void move(PVector dir) {
    vel.add(dir.mult(dirFactor));
  }
  //Obstacle methods
}
