public class Lever extends Item{
  boolean isPulled;
  Platform linkedPlat;
  public Lever(int x_, int y_, Platform link, Level a){
    super(x_, y_, 2, 1,a);
    linkedPlat = link;
  }
  
  
  void pullLever(){
    isPulled = true; 
  }
  
  void unPullLever(){
    isPulled = false;
  }
  
  boolean isPuller(){
    return isPulled;
  }
  
  void display(){
    fill(246,255,3);
    rect(getX() *PIXEL_WIDTH, getY() *PIXEL_LENGTH + (PIXEL_LENGTH * 0.5) , getWidth() * PIXEL_WIDTH * 0.5, getHeight()*PIXEL_LENGTH * 0.75);
  }
}
