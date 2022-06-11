public class Platform extends Item{

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
    fill(255,98,253);
    noStroke();
    rect(getX() *PIXEL_WIDTH, getY() *PIXEL_LENGTH , getWidth() * PIXEL_WIDTH, getHeight()*PIXEL_LENGTH);
  }
  
  void move() {
    // ONLY CALLL IF IT IS MOVEABLE AND THE OBJECT IT IS LINKED TO IS PULLED
    //animation of moving up and down --> katherine
  }
}
