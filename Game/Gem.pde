public class Gem extends Item {
  /* Interactions with Character (for Katherine): 
    - if character is within range of a gem that is the same color as it (use getColor()) --> setCollected(true) --> hide()
    - add +1 to gemsCOllected for the character
  */
  private color col;
  private boolean isCollected = false; 
  public Gem(int x_, int y_, color c, Level a) {
    super(x_, y_, 1, 1,a);
    col = c;
  }

  void display() {
    if (getColor() == color(255,0,0)){
      image(redGem,getX() * PIXEL_WIDTH,getY() * PIXEL_LENGTH);
    } else if (getColor() == color(0,0,255)){
      image(blueGem,getX() * PIXEL_WIDTH,getY() * PIXEL_LENGTH);
    } else if (isCollected){
      rect(getX() * PIXEL_WIDTH, getY() * PIXEL_LENGTH, getWidth() * PIXEL_WIDTH, getHeight() * PIXEL_LENGTH);
    }
  }

  void hide() {
    if (isCollected){
      col = color(51, 51, 0);
    }
  }

  void setCollected(boolean coll) {
    isCollected = coll;
  }

  color getColor() {
    return col;
  }
}
