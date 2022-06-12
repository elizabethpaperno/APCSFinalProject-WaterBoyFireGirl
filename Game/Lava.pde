public class Lava extends Item {
  /* Interactions with Character (for Katherine): 
    - if character is within range of a lava that is NOT the same color as it (use getColor()) --> kill the character and modify run() so it only works when chracters are alive (otherwise dislay text saying game over)
  */
  private color col;
  public Lava(int x_, int y_, color c, Level a, int Width) {
    super(x_, y_, 1, Width, a);
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
}
