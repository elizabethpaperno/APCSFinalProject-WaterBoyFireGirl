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
  private PVector velocity;
  private Level lane;
  private boolean horizontalPressed;
  public Item(int x_, int y_, int h, int w, Level a) {
    x = x_; 
    y = y_;
    hgt = h; 
    wdth = w;
    GRAVITY =0.27;
    MOVE_MAG = 0.3;
    MAX_XVEL = 3;
    JUMP_MAG = -6.5;
    MAX_YVEL = 10;
    FRICTION = 0.5;
    place = new PVector(x * PIXEL_WIDTH, y* PIXEL_LENGTH);
    velocity = new PVector(0, 0);
    lane=a;
    horizontalPressed = false;
  }
  Level getPlace() {
    return lane;
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
    rect(place.x, place.y, getWidth() * PIXEL_WIDTH, getHeight() * PIXEL_LENGTH);
  }
  void run() {
    velocity.add(new PVector(0, GRAVITY));
    if (MAX_YVEL < velocity.y) {
      velocity.y = MAX_YVEL;
    }
    
    if (!horizontalPressed) {
        velocity.set(velocity.x * FRICTION, velocity.y);
      } 
    if (checkYRange(int(place.x), int(place.x+getPixelWidth()), int(place.y+getPixelHeight()))) { //detects floor collision
      place.set(place.x, 10 * (int(place.y / 10)));
      velocity.set(velocity.x, 0);
    } 
    if (checkXRange(int(place.y), int (place.y+getPixelHeight()-2), int(place.x)-2)) {//detects left collision
      velocity.set(-velocity.x, velocity.y);
    } 
    if (checkXRange(int(place.y), int(place.y+getPixelHeight()-2), int(place.x +getPixelWidth()))) {//detect right collisiion
      velocity.set(-velocity.x, velocity.y);
    } 
    place.add(velocity);
    horizontalPressed = false;
  }
  public void move( PVector dir) {
    lane.kmsEdit((int)(getX()), (int)(getY()), (int)(getX() + getWidth()), (int)getY() + getHeight(), 0);
    place.add( dir.x * MOVE_MAG, 0);
    horizontalPressed = true;
  }
  public boolean checkYRange(int xBegin, int xEnd, int yCor) {
    fill(0, 0, 0, 100);
    //rect(xBegin, yCor, xEnd-xBegin, 5);
    for (int i = xBegin; i <= xEnd; i++) {

      if (lane.hitGround(i, yCor) == true) return true;
    }
    return false;
  }
  // returns empty or not- not on ground, returns true  if vertically it isnt empty return false (something blocking it)
  public boolean checkXRange(int yBegin, int yEnd, int xCor) {
    fill(0, 0, 0, 100);
    //rect(xCor, yBegin, 5,yEnd- yBegin);
    for (int i = yBegin; i <=yEnd; i ++) {

      if (lane.hitGround(xCor, i) == true) return true;
    } 
    return false;
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
