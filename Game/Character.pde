public class Character {  //<>// //<>//
  color a;
  //top left corner of rectangle
  PVector pos;
  PVector vel;
  final float GRAVITY;
  final float MOVE_MAG;
  final float MAX_XVEL;
  final float JUMP_MAG;
  final float FRICTION;
  final float MAX_YVEL;
  boolean living;
  boolean jumped;
  boolean completed;
  boolean horizontalPressed;
  int gemsCollected;
  int playerWidth;
  int playerHeight;
  Level b;
  Maze z;
  Character other;
  //(x,y) = top left???? yeah that makes sense
  //constructor
  public Character(color cool, int x, int y) {
    pos = new PVector(x, y);
    vel = new PVector(0, 0);
    a = cool;
    gemsCollected =  0;
    GRAVITY =0.27;
    MOVE_MAG = 0.27;
    MAX_XVEL = 3;
    JUMP_MAG = -6.5;
    FRICTION = 0.5;
    playerWidth = 30;
    playerHeight = 40;
    living =  true;
    horizontalPressed = false;
    completed = false;
    MAX_YVEL = 10;
  }
  void characterC(Character c) {
    other = c;
  }
  void display() {
    //fill(a);
    //noStroke();
    if (a == color(255,0,0)){
      image(fireboy, pos.x,pos.y,playerWidth, playerHeight);
    } else if (a == color(0,0,255)){
      image(watergirl,pos.x,pos.y,playerWidth, playerHeight);
    }
   // rect(pos.x, pos.y, playerWidth, playerHeight);
    stroke(1);
  }
  void check() {
    ArrayList<Gem> gem = b.getGems();
    for (int i = 0; i < gem.size(); i++) {
      Gem a = gem.get(i);
      if (range(pos.x, pos.x+playerWidth, pos.y, pos.y +playerHeight, a.getPixelX()+5, a.getPixelY()+5) &&  gem.get(i).getColor() == getColor()) {
        gem.get(i).setCollected(true);
        a.hide();
        addGem();
      }
    }
    ArrayList<Lava> l = b.getLava();
    for (int i = 0; i < l.size(); i++) {
      Lava d = l.get(i);
      if (range(d.getPixelX(), d.getPixelX() + d.getPixelWidth(), d.getPixelY(), d.getPixelY() +d.getPixelHeight(), pos.x+5, pos.y +playerHeight) && d.getColor() != getColor())
      {
        justice(false);
      }
    }
    ArrayList<Door> d = b.getDoors();
    for (int i = 0; i< d.size(); i++) {
      Door a = d.get(i);
      if (a.getOgColor() == getColor()) {
        if ( (pos.x >= a.getPixelX() -5 && pos.x + playerWidth <= a.getPixelX() +5 +  a.getPixelWidth()) && (pos.y >= a.getPixelY() -5  && pos.y + playerHeight <= a.getPixelY() + 5 + a.getPixelHeight())) {
          a.setOpen(true);
          changeC(true);
        } else {
          a.setOpen(false);
          changeC(false);
        }
      }
    }
    ArrayList<Button> butt = b.getButtons();
    for (int i = 0; i<butt.size(); i++) {
      Button a = butt.get(i);
      //b.kmsEdit((int)(a.plat().getX()), (int)(a.plat().getY()), (int)(a.plat().getX() + a.plat().getWidth()), (int)a.plat().getY() + a.plat().getHeight(), 1);
        
      if (range(a.getPixelX(), a.getPixelX() + a.getPixelWidth(), a.getPixelY(), a.getPixelY() + a.getPixelHeight(), pos.x, pos.y +  playerHeight) ||range(a.getPixelX(), a.getPixelX() + a.getPixelWidth(), a.getPixelY(), a.getPixelY() + a.getPixelHeight(), other.pos.x, other.pos.y +  other.playerHeight)) {
        a.plat().move();
        a.setPushed(true);
      } else if (!buttonRange(a, pos.x, pos.y+playerHeight) && !buttonRange(a, other.pos.x, other.pos.y +other.playerHeight)&& !buttonRange(a.plat().returnOther(a), pos.x, pos.y+playerHeight) && !buttonRange(a.plat().returnOther(a), other.pos.x, other.pos.y +other.playerHeight)) {
        a.plat().moveBack();
        a.setPushed(false);
        if (range(a.plat().getPixelX(), a.plat().getPixelX() +a.plat().getPixelWidth(), a.plat().getPixelY()-2, a.plat().getPixelY() +a.plat().getPixelHeight(), pos.x, pos.y+playerHeight)) {
          pos.set(pos.x, a.plat().getPixelY() - playerHeight);
        }
        if (range(a.plat().getPixelX(), a.plat().getPixelX() +a.plat().getPixelWidth(), a.plat().getPixelY()-2, a.plat().getPixelY() +a.plat().getPixelHeight(), other.pos.x, other.pos.y+other.playerHeight)) {
          other.pos.set(other.pos.x, a.plat().getPixelY() -other.playerHeight);
        }
      }
    }

    ArrayList<Item> block = b.getBlocks();
    for (int i = 0; i<block.size(); i++) {
      Item a = block.get(i);
      if (range(a.getPixelX() - playerWidth-2, a.getPixelX(), a.getPixelY()-2, a.getPixelY()+a.getPixelHeight(), pos.x, pos.y)) {
        if(a.getX() != a.x2 || a.getY() !=a.y2 && !a.z){
        a.move(new PVector(a.getPixelX() +MOVE_MAG, pos.y));}
      } else if (range(a.getPixelX(), a.getPixelX() +  a.getPixelWidth() +4, a.getPixelY(), a.getPixelY() + a.getPixelHeight(), pos.x, pos.y+playerHeight)&& !a.z) {
        if(a.getX() != a.x2 || a.getY() !=a.y2){
        a.move(new PVector(a.getPixelX() -MOVE_MAG, pos.y));}
      }
    }
    ArrayList<Lever> pull = b.getLevers();
    for (int i = 0; i < pull.size(); i++) {
      Lever a = pull.get(i);
      b.kmsEdit(a.linkedPlat.getX(), a.linkedPlat.getY(), a.linkedPlat.getX() +a.linkedPlat.getWidth()-1, a.linkedPlat.getY() + a.linkedPlat.getHeight(), 1);
      if (range(pos.x, pos.x +playerWidth, pos.y, pos.y+playerHeight, a.getPixelX(), a.getPixelY())/*&& !a.isPuller()*/) {
        a.linkedPlat.move();
        a.pullLever();
      }
      //else if ((range(other.pos.x, other.pos.x +other.playerWidth, other.pos.y, other.pos.y+playerHeight, a.getPixelX(), a.getPixelY())) && a.isPuller()) {
      //  a.linkedPlat.moveBack();
      //  if (range(a.linkedPlat.getPixelX(), a.linkedPlat.getPixelX()+a.linkedPlat.getPixelWidth(), a.linkedPlat.getPixelY(), a.linkedPlat.getPixelY() + a.linkedPlat.getPixelHeight(), pos.x, pos.y+playerHeight)) {
      //    pos.set(pos.x, a.linkedPlat.getPixelY() - playerHeight);

      //  }
      //}
    }
  }
  boolean buttonRange(Button a, float x, float y) {
    return range(a.getPixelX(), a.getPixelX() +a.getPixelWidth(), a.getPixelY(), a.getPixelY() +a.getPixelHeight(), x, y);
  }
  boolean range(float x1, float x2, float y1, float y2, float oX, float oY) {
    return (oX >= x1 && oX <=x2 && oY >= y1 && oY <=y2);
  }
  void run() {
    check();
    if (survival()) {
      if (!horizontalPressed) {
        vel.set(vel.x * FRICTION, vel.y);
      }
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
      pos.add(vel);
      horizontalPressed = false;
    }
  }
  //Accessor Methods
  public color getColor() {
    return a;
  }
  public boolean survival() {
    return living;
  }
  public int gemsTotal() {
    return gemsCollected;
  }
  public boolean complete() {
    return completed;
  }


  //Mutator Methods
  public void justice(boolean change) {
    living = change;
  }
  public void addGem() {
    gemsCollected +=1;
  }
  public void changePos(PVector a) {
    pos = a;
  }

  public void changeV(float hor, float ver) {
    vel = new PVector(hor, ver);
  }

  public void levelAccess(Level a) {
    b = a;
  }
  public void mazeAccess(Maze b ) {
    z = b;
  }
  public PVector place() {
    return pos;
  }
  public void changeC(boolean a) {
    completed = a;
  }
  //collision check
  //returns true if there is somethinng blocking it
  public boolean checkYRange(int xBegin, int xEnd, int yCor) {
    fill(0, 0, 0, 100);
    //rect(xBegin, yCor, xEnd-xBegin, 5);
    for (int i = xBegin; i <= xEnd; i++) {

      if (b.hitGround(i, yCor) == true) return true;
    }
    return false;
  }
  // returns empty or not- not on ground, returns true  if vertically it isnt empty return false (something blocking it)
  public boolean checkXRange(int yBegin, int yEnd, int xCor) {
    fill(0, 0, 0, 100);
    //rect(xCor, yBegin, 5,yEnd- yBegin);
    for (int i = yBegin; i <=yEnd; i ++) {

      if (b.hitGround(xCor, i) == true) return true;
    }
    return false;
  }
  //Movement Methods
  public void move(PVector dir) {

    if (dir.y == 1&& !jumped) {
      pos.set(new PVector(pos.x, pos.y-1));
      vel.add(new PVector(0, JUMP_MAG));
      //vel.set(vel.x, -JUMP_MAG);
      //pos.set(new PVector(pos.x, pos.y-1));
      jumped = true;
    }
    if (abs(dir.x) == 1) { //if moving in either left or right dir
      vel.add(new PVector(dir.x * MOVE_MAG, 0));
      vel.set(vel.x > 0 ? min(MAX_XVEL, vel.x) : max(-MAX_XVEL, vel.x), vel.y);
      horizontalPressed = true;
    }
  }
}
