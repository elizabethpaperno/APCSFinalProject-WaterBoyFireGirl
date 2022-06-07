public class Lever extends Item{
  boolean isPulled;
  Platform linkedPlat;
  public Lever(int x_, int y_, int h, int w, Platform link){
    super(x_, y_, h, w);
    linkedPlat = link;
  }
  
  
  void pullLever(){
    isPulled = true; 
  }
  
  void unPullLever(){
    isPulled = false;
  }
  
  boolean isPuller(){
    return isPulled;
  }
  
  void display(){
    //katherine fill in 
  }
}
