public class Gem extends Item{
  private color col;
  public Gem(int x_, int y_, color c){
    super(x_,y_,1,1);
    col = c; 
  }
  void display(){
    fill(getColor());
    rect(getY() * PIXEL_WIDTH, getX() * PIXEL_LENGTH, PIXEL_WIDTH, PIXEL_LENGTH);
  }
  
  color getColor(){
    return col;
  }
}
