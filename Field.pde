class Field{
  
int my_width, my_height;
ArrayList<Obstacle> obstacles;


  Field(int w, int h){
    
    my_width=w;
    my_height=h;
    obstacles=new ArrayList<Obstacle>();
  }
  
  void addObstacle(){
    int x=floor(random(40, my_width-40));
    int y=floor(random(40, my_height-40));
    int w=floor(random(10,85));
    int h=floor(random(10,85));
    obstacles.add(new Quad(x,y,w,h));
  }
  
  void show(){
    //draw the outside lines
    fill(255);
    strokeWeight(8);
    stroke(255);
    line(0,0,my_width,0);
    line(my_width,0, my_width, my_height);
    line(my_width, my_height, 0, my_height);
    line(0, my_height, 0,0);
    strokeWeight(0);
    for (Obstacle thing:obstacles){
      thing.show();
    }
    
  }
}
    
  
  
  
  
