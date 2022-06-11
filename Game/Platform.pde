public class Platform extends Item {

  // position when the obstacle it is linked to is pulled
  int x2;
  int y2;
  boolean arrived;
  Level place;
  public Platform(int x_, int y_, int x2_, int y2_, int h, int w, Level a) {
    super(x_, y_, h, w);
    x2 = x2_;
    y2 = y2_;
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
    //katherine fill in 
    fill(255, 98, 253);
    noStroke();
    rect(getX() *PIXEL_WIDTH, getY() *PIXEL_LENGTH, getWidth() * PIXEL_WIDTH, getHeight()*PIXEL_LENGTH);
  }

  void move() {
    if (super.x!= x2 || super.y != y2) {
      if (!arrived) {
        if (frameCount % 12 ==0) {
          if (super.x == x2) {
            if (y2 > super.y) {
              super.y++;
              place.kmsEdit((int)(getX()), (int)(getY()), (int)(getX() + getWidth()), (int)getY() + getHeight(), 1);
              place.kmsEdit((int)(getX()), (int)(getY())-1, (int)(getX() + getWidth()), (int)getY() + getHeight()-1, 0);
            }
            if (super.y > y2) {
              super.y--;
              place.kmsEdit((int)(getX()), (int)(getY()), (int)(getX() + getWidth()), (int)getY() + getHeight(), 1);
              place.kmsEdit((int)(getX()), (int)(getY())+1, (int)(getX() + getWidth()), (int)getY() + getHeight()+1, 0);
            }
          }
          if (super.y == y2) {
            if (x2 > super.x) {
              super.x++;
              place.kmsEdit((int)(getX()), (int)(getY()), (int)(getX() + getWidth()), (int)getY() + getHeight(), 1);
              place.kmsEdit((int)(getX())-1, (int)(getY()), (int)(getX() + getWidth())-1, (int)getY() + getHeight(), 0);
            }
            if (super.x> x2) {
              super.x--;
              place.kmsEdit((int)(getX()), (int)(getY()), (int)(getX() + getWidth()), (int)getY() + getHeight(), 1);
              place.kmsEdit((int)(getX())+1, (int)(getY()), (int)(getX() + getWidth())+1, (int)getY() + getHeight(), 0);
            }
            place.kmsEdit((int)(getX()), (int)(getY())-1, (int)(getX() + getWidth()), (int)(getY() + getHeight())-1, 0);
          }
        }
      }
    } else {
      arrived = true;
    }
  }
}
