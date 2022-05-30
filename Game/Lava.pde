public class Lava extends Item{
  private color col;
  public Lava(int x_, int y_, color c){
    super(x_,y_,1,3);
    col = c; 
  }
  void display(){
    fill(getColor());
    rect(getY() * PIXEL_WIDTH, getX() * PIXEL_LENGTH, getWidth() * PIXEL_WIDTH, getHeight() * PIXEL_LENGTH);
  }
  
  color getColor(){
    return col;
  }
}
