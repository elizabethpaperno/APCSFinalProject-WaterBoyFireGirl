public class Lever extends Item{
  boolean isPulled;
  Platform linkedPlat;
  public Lever(int x_, int y_, Platform link){
    super(x_, y_, 1, 1);
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
