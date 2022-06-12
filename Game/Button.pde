public class Button extends Item {
  PImage a; 
  boolean isPushed;
  Platform linkedPlat;
  public Button (int x_, int y_, Platform link, Level a) {
    super(x_, y_, 1, 2, a);
    linkedPlat = link;
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
    fill(255, 98, 253);
    stroke(249, 255, 298);
    rect(getX()*PIXEL_WIDTH, getY()* PIXEL_LENGTH + (PIXEL_LENGTH * 0.5), PIXEL_WIDTH* getWidth(), PIXEL_LENGTH *0.5* getHeight());
  }
}
