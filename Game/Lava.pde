public class Lava extends Item {
  private color col;
  public Lava(int x_, int y_, color c) {
    super(x_, y_, 1, 5);
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
