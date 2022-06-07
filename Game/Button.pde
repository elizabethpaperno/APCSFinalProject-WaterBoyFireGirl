public class Button extends Item{
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
  }
}
