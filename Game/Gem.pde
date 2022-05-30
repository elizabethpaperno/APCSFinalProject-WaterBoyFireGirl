public class Gem extends Item {
  /* Interactions with Character (for Katherine): 
    - if character is within range of a gem that is the same color as it (use getColor()) --> setCollected(true) --> hide()
    - add +1 to gemsCOllected for the character
  */
  private color col;
  private boolean isCollected = false; 
  public Gem(int x_, int y_, color c) {
    super(x_, y_, 1, 1);
    col = c;
  }

  void display() {
    fill(getColor());
    rect(getX() * PIXEL_WIDTH, getY() * PIXEL_LENGTH, getWidth() * PIXEL_WIDTH, getHeight() * PIXEL_LENGTH);
    noFill();
  }

  void hide() {
    if (isCollected) {
      fill(51, 51, 0); //color of empty space 
      rect(getX() * PIXEL_WIDTH, getY() * PIXEL_LENGTH, getWidth() * PIXEL_WIDTH, getHeight() * PIXEL_LENGTH);
    }
  }

  void setCollected(boolean coll) {
    isCollected = coll;
  }

  color getColor() {
    return col;
  }
}
