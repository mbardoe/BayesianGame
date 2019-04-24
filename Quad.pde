class Quad extends Obstacle{
  int x,y,w,h;
  
  Quad(int _x, int _y, int _w, int _h){
    
    x=_x;
    y=_y;
    w=_w;
    h=_h;
  }
  
  void show(){
    fill(255);
    rectMode(CENTER);
    rect(x,y,w,h);
  }
}
