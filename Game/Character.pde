public class Character {
  color a; 
  int x;
  int y;
  boolean living;
  int gemsCollected;
  final float velocity = 15;
  final int right = 1;
  final int left = -1;
  final int up = 2;
  final int down =  -2; 
  //constructor
  public Character(color cool, int x, int y) {
    this.x = x;
    this.y =y;
    a = cool;
    gemsCollected =  0;
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
  public void moveH(int direction) {
  }
  public void moveV(int direction) {
  }
  public void jump(int Hdirection, int Vdirection) {
  }
}
