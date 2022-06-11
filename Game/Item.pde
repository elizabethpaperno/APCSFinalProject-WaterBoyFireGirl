public class Item {
  /* Interactions with Character (for Katherine): 
    - find range of pixels that Item takes up using getPixelX(), getPixelY() (TOP LEFT CORNER) and getPixelWidth() and getPixelHeight()
    - use setY() and setX() to modifiy the psoitons of the Item --> needs to take in row/col (aka PixeLocation/pixelSize)
  */
  private int x; 
  private int y; 

  //height and width in terms of number of indexes taken up in 2d array not number of pixels
  private int hgt; 
  private int wdth;

  public Item(int x_, int y_, int h, int w) {
    x = x_; 
    y = y_;
    hgt = h; 
    wdth = w;
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
  
  //TOP LEFT CORNER
  int getPixelX(){
    return getX() * PIXEL_WIDTH;
  }
  
  int getPixelY(){
    return getY() * PIXEL_LENGTH;
  }
  
  int getPixelWidth() {
    return  getWidth() * PIXEL_WIDTH;
  }

  int getPixelHeight() {
    return getHeight() * PIXEL_LENGTH;
  }
  
}
