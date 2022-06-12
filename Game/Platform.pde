public class Platform extends Item {

  // position when the obstacle it is linked to is pulled
  int x2;
  int y2;
  int beginX;
  int beginY;
  boolean arrived;
  Level place;
  public Platform(int x_, int y_, int x2_, int y2_, int h, int w, Level a) {
    super(x_, y_, h, w, a);
    x2 = x2_;
    y2 = y2_;
    beginX = x_;
    beginY = y_;
    arrived = false;
    place= a;
  }
  boolean hasArrived() {
    return arrived;
  }
  void changeArrival(boolean a) {
    arrived = a;
  }
  void display() {
    fill(255, 98, 253);
    noStroke();
    rect(getX() *PIXEL_WIDTH, getY() *PIXEL_LENGTH, getWidth() * PIXEL_WIDTH, getHeight()*PIXEL_LENGTH);
  }

  void move() {
    if ((super.x!= x2 || super.y != y2)) {
      if (frameCount % 10 ==0) {
        if (super.x == x2) {
          if (y2 > super.y) {
            super.y++;
            place.kmsEdit((int)(getX()), (int)(getY())-1, (int)(getX() + getWidth()), (int)getY() + getHeight()-1, 0);
          }
          if (super.y > y2) {
            super.y--;
            place.kmsEdit((int)(getX()), (int)(getY())+1, (int)(getX() + getWidth()), (int)getY() + getHeight()+1, 0);
          }
        }
        if (super.y == y2) {
          if (x2 > super.x) {
            super.x++;
            place.kmsEdit((int)(getX())-1, (int)(getY()), (int)(getX() + getWidth())-1, (int)getY() + getHeight(), 0);
          }
          if (super.x> x2) {
            super.x--;
            place.kmsEdit((int)(getX())+1, (int)(getY()), (int)(getX() + getWidth())+1, (int)getY() + getHeight(), 0);
          }
        }
      }
    }
    //else{arrived=true;}
  }
  void moveBack() {
    if (beginX != super.x ||  beginY !=super.y ) {
      if (frameCount % 10 ==0) {
        if (super.x == beginX) {
          if (beginY > super.y) {
            super.y++;
            //place.kmsEdit((int)(getX()), (int)(getY()), (int)(getX() + getWidth()), (int)getY() + getHeight(), 1);
            place.kmsEdit((int)(getX()), (int)(getY())-1, (int)(getX() + getWidth()), (int)getY() + getHeight()-1, 0);
          }
          if (super.y > beginY) {
            super.y--;
            // place.kmsEdit((int)(getX()), (int)(getY()), (int)(getX() + getWidth()), (int)getY() + getHeight(), 1);
            place.kmsEdit((int)(getX()), (int)(getY())+1, (int)(getX() + getWidth()), (int)getY() + getHeight()+1, 0);
          }
        }
        if (super.y == beginY) {
          if (beginX > super.x) {
            super.x++;
            //place.kmsEdit((int)(getX()), (int)(getY()), (int)(getX() + getWidth()), (int)getY() + getHeight(), 1);
            place.kmsEdit((int)(getX())-1, (int)(getY()), (int)(getX() + getWidth())-1, (int)getY() + getHeight(), 0);
          }
          if (super.x> beginX) {
            super.x--;
            // place.kmsEdit((int)(getX()), (int)(getY()), (int)(getX() + getWidth()), (int)getY() + getHeight(), 1);
            place.kmsEdit((int)(getX())+1, (int)(getY()), (int)(getX() + getWidth())+1, (int)getY() + getHeight(), 0);
          }
        }
      }
    }
  }
}
