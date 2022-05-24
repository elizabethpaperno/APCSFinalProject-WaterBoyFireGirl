public class Character {
  color a; 
  PVector Location;
  boolean living;
  int gemsCollected;
  PVector Velocityy(15,15);
  final int right = 1;
  final int left = -1;
  final int up = 1;
  final int down =  -1; 
  //(x,y) = top left???? yeah that makes sense 
  //constructor
  public Character(color cool, int x, int y) {
    Location= new PVector(x,y);
    a = cool;
    gemsCollected =  0;
    rect(x, y, x-10, y-20);
  }

  //displaying characters
  void display() {
    fill(a);
    noStroke();
    rect(x, y, x+10, y+20);
    stroke(1);
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

  //Movement Methods
  public void run(int xD, int yD){}
  public void moveH(int direction) {
    x += direction * xVelocity;
  }
  //jump straight up(con gravity)/ or fall down (gravity), as long as there is nothing blocking it 
  public void jumpV(int direction) {
    if (Level.isEmpty(x,y) == false) {
      yVelocity *= -1;
    }
    else{
    y += yVelocity;
    yVelocity += 1;}
  }
  //jump with x, as long as nothing is blockng it 
  public void jump(int Hdirection, int Vdirection) {
    if (Level.isEmpty(x,y) == false){}
  }

  //Obstacle methods
}
