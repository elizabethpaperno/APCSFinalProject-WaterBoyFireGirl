public class Character {
  color a; 
  //top left corner of rectangle 
  PVector Location;
  boolean living;
  int gemsCollected;
  PVector Velocity = new PVector(10, 10);
  final int right = 1;
  final int left = -1;
  final int up = 1;
  final int down =  -1; 
  //(x,y) = top left???? yeah that makes sense 
  //constructor
  public Character(color cool, int x, int y) {
    Location= new PVector(x, y);
    a = cool;
    gemsCollected =  0;
    rect(Location.x, Location.y, Location.x+10, Location.y-20);
  }

  //displaying characters
  void display() {
    fill(a);
    noStroke();
    rect(Location.x, Location.y, Location.x+10, Location.y+20);
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
  public void run(int xD, int yD) {
    if (Level.isEmpty(Location.x, Location.y)== true && Level.isEmpty(Location.x, Location.y) == false) {
    }
  }
  public void moveH(int direction) {
    if (Level.isEmpty(Location.x, Location.y) == true && Level.isEmpty(Location.x +11, Location.y-20) == true) {
      Location.x += direction * Velocity.x;
    }
  }
  //jump straight up(con gravity)/ or fall down (gravity), as long as there is nothing blocking it 
  public void jumpUP() {
    if (Level.isEmpty(Location.x, Location.y) == false) {
      Velocity.y *= -1;
    } else {  
      Location.y += Velocity.y;
      Velocity.y += 1;
    }
  }
  public void dropDown() {
  }
  //jump with x, as long as nothing is blockng it 
  public void jump(int Hdirection, int Vdirection) {
    if (Level.isEmpty(Location.x, Location.y) == false && Level.isEmpty(Location.x, Location.y - 20) == true) {
      Velocity.y *= -1; 
    }
  }

  //Obstacle methods
}
