public class Door extends Item {
  /* Interactions with Character (for Katherine): 
    - if character is within range of the door that is the same color as it (use getColor()) --> setOpen(true) -->)
    - if character moves away from door --> setOpen(false)
    - also checking if both r open at same time to complete level --> refer to level
  */
  private color col;
  private boolean isOpen = false; 
  private color ogCol;
  public Door(int x_, int y_, color c, Level a) {
    super(x_, y_, 3, 2, a);
    col = c;
    ogCol = c;
  }

  void display() {
    if (isOpen){
      col = color(51, 51, 0);
    }else{
      col = ogCol;
    }
    fill(col);
    rect(getX() * PIXEL_WIDTH, getY() * PIXEL_LENGTH, getWidth() * PIXEL_WIDTH, getHeight() * PIXEL_LENGTH);
    noFill();
  }

  color getOgColor() {
    return ogCol;
  }
  
  void setOpen(boolean open){
    isOpen = open;
    //println("door set:" + open);
  }
}
