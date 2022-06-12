public class Item {
  /* Interactions with Character (for Katherine): 
   - find range of pixels that Item takes up using getPixelX(), getPixelY() (TOP LEFT CORNER) and getPixelWidth() and getPixelHeight()
   - use setY() and setX() to modifiy the psoitons of the Item --> needs to take in row/col (aka PixeLocation/pixelSize)
   */
  private int x; 
  private int y; 
  final float GRAVITY;
  final float MOVE_MAG;
  final float MAX_XVEL;
  final float JUMP_MAG;
  final float FRICTION;
  final float MAX_YVEL;
  //height and width in terms of number of indexes taken up in 2d array not number of pixels
  private int hgt; 
  private int wdth;
  private PVector place;
  private PVector 
  public Item(int x_, int y_, int h, int w) {
    x = x_; 
    y = y_;
    hgt = h; 
    wdth = w;
    GRAVITY =0.27;
    MOVE_MAG = 0.5;
    MAX_XVEL = 3;
    JUMP_MAG = -6.5;
    MAX_YVEL = 10;
    FRICTION = 0.5;
    place = new PVector(x,y);
  }

  int getX() {
    return x;
  }

  int getY() {
    return y;
  }

  void setX(int newX) {
    x = newX;
  }

  void setY(int newY) {
    y = newY;
  }
  int getWidth() {
    return wdth;
  }

  int getHeight() {
    return hgt;
  }

  void display() {
    fill(153);
    rect(getX() * PIXEL_WIDTH, getY() * PIXEL_LENGTH, getWidth() * PIXEL_WIDTH, getHeight() * PIXEL_LENGTH);
  }
  void move() {
    vel.add(new PVector(0, GRAVITY));
    if (MAX_YVEL < vel.y) {
      vel.y = MAX_YVEL;
    }
    if (checkYRange(int(pos.x), int(pos.x + playerWidth), int(pos.y))) { //detects ceiling collision
      vel.set( vel.x, 0);
      pos.set(pos.x, pos.y + 5);
    } 
    if (checkYRange(int(pos.x), int(pos.x+playerWidth), int(pos.y+playerHeight))) { //detects floor collision
      jumped = false;
      pos.set(pos.x, 10 * (int(pos.y / 10)));
      vel.set(vel.x, 0);
    } 
    if (checkXRange(int(pos.y), int (pos.y+playerHeight-2), int(pos.x)-2)) {//detects left collision
      vel.set(-vel.x, vel.y);
    } 
    if (checkXRange(int(pos.y), int(pos.y+playerHeight-2), int(pos.x +playerWidth))) {//detect right collisiion
      vel.set(-vel.x, vel.y);
    } 
    place.add(vel);
  }
  //TOP LEFT CORNER
  int getPixelX() {
    return getX() * PIXEL_WIDTH;
  }

  int getPixelY() {
    return getY() * PIXEL_LENGTH;
  }

  int getPixelWidth() {
    return  getWidth() * PIXEL_WIDTH;
  }

  int getPixelHeight() {
    return getHeight() * PIXEL_LENGTH;
  }
}
