public class Door extends Item{
  private color col;
  private boolean isOpen = false; 
  public Door(int x_, int y_, color c){
    super(x_,y_,3,2);
    col = c; 
  }
  
  void display(){
    fill(getColor());
    rect(getY() * PIXEL_WIDTH, getX() * PIXEL_LENGTH, getWidth() * PIXEL_WIDTH, getHeight() * PIXEL_LENGTH);
  }
  
  color getColor(){
    return col;
  }
  
  void openDoor(){
    if (isOpen){
      fill(51, 51, 0); //color of empty space 
      rect(getY() * PIXEL_WIDTH, getX() * PIXEL_LENGTH, PIXEL_WIDTH, PIXEL_LENGTH);
    }
  }
}
