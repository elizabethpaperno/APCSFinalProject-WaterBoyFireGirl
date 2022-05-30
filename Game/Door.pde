public class Door extends Item {
  /* Interactions with Character (for Katherine): 
    - if character is within range of the door that is the same color as it (use getColor()) --> setOpen(true) --> openDoor()
    - if character moves away from door --> setOpen(false) --> display()
  */
  private color col;
  private boolean isOpen = false; 
  public Door(int x_, int y_, color c) {
    super(x_, y_, 3, 2);
    col = c;
  }

  void display() {
    fill(getColor());
    rect(getX() * PIXEL_WIDTH, getY() * PIXEL_LENGTH, getWidth() * PIXEL_WIDTH, getHeight() * PIXEL_LENGTH);
    noFill();
  }

  color getColor() {
    return col;
  }

  void openDoor() {
    if (isOpen) {
      fill(51, 51, 0); //color of empty space 
      rect(getY() * PIXEL_WIDTH, getX() * PIXEL_LENGTH, PIXEL_WIDTH, PIXEL_LENGTH);
    }
  }
  
  void setOpen(boolean open){
    isOpen = open;
  }
}
