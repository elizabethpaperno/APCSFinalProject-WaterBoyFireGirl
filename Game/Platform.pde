public class Platform extends Item{
  boolean isMoveable;
  
  // position when the obstacle it is linked to is pulled
  int x2;
  int y2;
  public Platform(int x_, int y_,int x2_, int y2_, int h, int w){
    super(x_, y_, h, w);
    x2 = x2_;
    y2 = y2_;
  }
  
  void display(){
    //katherine fill in 
  }
  
  void move() {
    // ONLY CALLL IF IT IS MOVEABLE AND THE OBJECT IT IS LINKED TO IS PULLED
    //animation of moving up and down --> katherine
  }
}
