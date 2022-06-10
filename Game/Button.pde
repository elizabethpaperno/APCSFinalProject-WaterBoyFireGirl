public class Button extends Item{
  PImage a; 
  boolean isPushed;
  Platform linkedPlat;
  
  public Button (int x_, int y_, Platform link){
    super(x_, y_, 1, 1);
    linkedPlat = link;
  }
  
  void setPushed(boolean p){
    isPushed = p;
  }
  
  boolean isPushed(){
    return isPushed;
  }
  
  void display(){
    //katherine fill in 
    fill(255,98,253);
    rect(getX(), getY(), 15,7);
  }
}
