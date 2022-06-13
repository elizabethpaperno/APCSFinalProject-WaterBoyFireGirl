public class Lever extends Item{
  boolean isPulled;
  Platform linkedPlat;
  color cool;
  public Lever(int x_, int y_, Platform link, Level a, color d){
    super(x_, y_, 2, 1,a);
    linkedPlat = link;
    cool = d;
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
    fill(255,162,39);
    circle(getPixelX()  + getPixelWidth()/4, getPixelY() + getPixelHeight()/8,getPixelWidth()/2+2);
    fill(cool);
    rect(getX() *PIXEL_WIDTH, getY() *PIXEL_LENGTH + (PIXEL_LENGTH * 0.5) , getWidth() * PIXEL_WIDTH * 0.5, getHeight()*PIXEL_LENGTH * 0.75);
  }
}
