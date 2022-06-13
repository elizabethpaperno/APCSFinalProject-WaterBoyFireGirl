public class Button extends Item {
  PImage a; 
  boolean isPushed;
  Platform linkedPlat;
  color cool;
  public Button (int x_, int y_, Platform link, Level a,color c) {
    super(x_, y_, 1, 2, a);
    linkedPlat = link;
    cool = c;
  }

  void setPushed(boolean p) {
    isPushed = p;
  }

  boolean isPushed() {
    return isPushed;
  }
  Platform plat() {
    return linkedPlat;
  }

  void display() {
    //katherine fill in 
    
    //stroke(249, 255, 298);
    fill(255,255,0);
    rect(getX()*PIXEL_WIDTH, getY()* PIXEL_LENGTH + (PIXEL_LENGTH * 0.5), PIXEL_WIDTH* getWidth(), PIXEL_LENGTH *0.5* getHeight());
    if (!isPushed()){
      fill(cool);
      rect(getX()*PIXEL_WIDTH + 10, getY()* PIXEL_LENGTH + (PIXEL_LENGTH * 0.5) - PIXEL_LENGTH *0.5* getHeight()/2 , PIXEL_WIDTH* getWidth()/2, PIXEL_LENGTH *0.5* getHeight()/2);
    }
    
  }
}
