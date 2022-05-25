public class Item{
 private int x; 
 private int y; 
 
 //height and width in terms of number of indexes taken up in 2d array not number of pixels
 private int hgt; 
 private int wdth;
 
 public Item(int x_, int y_, int h, int w){
   x = x_; 
   y = y_;
   hgt = h; 
   wdth = w; 
 }
 
 void placeInLevel(Level l){
 }
 
 int getX(){
   return x;
 }
 
 int getY(){
   return y;
 }
 
 int getWidth(){
   return width;
 }
}
 
 
 
