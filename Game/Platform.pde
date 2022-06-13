public class Platform extends Item {

  // position when the obstacle it is linked to is pulled
  int x2;
  int y2;
  int beginX;
  int beginY;
  boolean arrived;
  Button b1;
  Button b2;
  Lever l1;
  Level place;
  color cool;
  public Platform(int x_, int y_, int x2_, int y2_, int h, int w, Level a, color c) {
    super(x_, y_, h, w, a);
    x2 = x2_;
    y2 = y2_;
    beginX = x_;
    beginY = y_;
    arrived = false;
    place= a;
    cool = c;
  }
  public Platform(int x_, int y_, int x2_, int y2_, int h, int w, Level a, Button c, Button d, color e ) {
    super(x_, y_, h, w, a);
    x2 = x2_;
    y2 = y2_;
    beginX = x_;
    beginY = y_;
    arrived = false;
    place= a;
    b1= c;
    b2=d;
    cool = e;
  }
  void editL(Lever d) {
    l1 = d;
  }
  void editb1(Button a) {
    b1=a;
  }
  void editb2 (Button a) {
    b2=a;
  }
  Button returnOther(Button a) {
    if (a ==b1) return b2;
    else if (a==b2) return b1;
    return a;
  }
  boolean hasArrived() {
    return arrived;
  }
  void changeArrival(boolean a) {
    arrived = a;
  }
  void display() {
    fill(cool);
    noStroke();
    rect(getX() *PIXEL_WIDTH, getY() *PIXEL_LENGTH, getWidth() * PIXEL_WIDTH, getHeight()*PIXEL_LENGTH);
    place.kmsEdit((int)(getX()), (int)(getY()), (int)(getX() + getWidth())-1, (int)getY() + getHeight() , 1);
  }

  void move() {
    if ((super.x!= x2 || super.y != y2)) {
      if (frameCount % 10 ==0) {
        if (super.x == x2) {
          if (y2 > super.y) {
            place.kmsEdit((int)(getX()), (int)(getY()), (int)(getX() + getWidth())-1, (int)getY() + getHeight()+1, 0);
            super.y++;
            //place.kmsEdit((int)(getX()), (int)(getY())-1, (int)(getX() + getWidth()), (int)getY() + getHeight()-1, 0);
          }
          if (super.y > y2) {
             place.kmsEdit((int)(getX()), (int)(getY()), (int)(getX() + getWidth())-1, (int)getY() + getHeight()+1, 0);
            super.y--;
            //place.kmsEdit((int)(getX()), (int)(getY())+1, (int)(getX() + getWidth()), (int)getY() + getHeight()+1, 0);
          }
        }
        if (super.y == y2) {
          if (x2 > super.x) {
             place.kmsEdit((int)(getX()), (int)(getY()), (int)(getX() + getWidth())-1, (int)getY() + getHeight()+1, 0);
            super.x++;
            //place.kmsEdit((int)(getX())-1, (int)(getY()), (int)(getX() + getWidth())-1, (int)getY() + getHeight(), 0);
          }
          if (super.x> x2) {
            place.kmsEdit((int)(getX()), (int)(getY()), (int)(getX() + getWidth())-1, (int)getY() + getHeight()+1, 0);
            super.x--;
            //place.kmsEdit((int)(getX())+1, (int)(getY()), (int)(getX() + getWidth())+1, (int)getY() + getHeight(), 0);
          }
        }
      }
    }
    else if(l1 != null  && super.x == x2 && super.y == y2){l1.pullLever();}
  }
  void moveBack() {
    if (beginX != super.x ||  beginY !=super.y ) {
      if (frameCount % 10 ==0) {
        if (super.x == beginX) {
          if (beginY > super.y) {
            //super.y++;
            //place.kmsEdit((int)(getX()), (int)(getY()), (int)(getX() + getWidth()), (int)getY() + getHeight(), 1);
           place.kmsEdit((int)(getX()), (int)(getY()), (int)(getX() + getWidth())-1, (int)getY() + getHeight()+1, 0);
            super.y++;
          }
          if (super.y > beginY) {
            //super.y--;
            // place.kmsEdit((int)(getX()), (int)(getY()), (int)(getX() + getWidth()), (int)getY() + getHeight(), 1);
            place.kmsEdit((int)(getX()), (int)(getY()), (int)(getX() + getWidth())-1, (int)getY() + getHeight()+1, 0);
            super.y--;
          }
        }
        if (super.y == beginY) {
          if (beginX > super.x) {
            super.x++;
            //place.kmsEdit((int)(getX()), (int)(getY()), (int)(getX() + getWidth()), (int)getY() + getHeight(), 1);
           place.kmsEdit((int)(getX()), (int)(getY()), (int)(getX() + getWidth())-1, (int)getY() + getHeight()+1, 0);
          }
          if (super.x> beginX) {
            super.x--;
            // place.kmsEdit((int)(getX()), (int)(getY()), (int)(getX() + getWidth()), (int)getY() + getHeight(), 1);
          place.kmsEdit((int)(getX()), (int)(getY()), (int)(getX() + getWidth())-1, (int)getY() + getHeight()+1, 0);
          }
        }
      }
    }
  }
}
