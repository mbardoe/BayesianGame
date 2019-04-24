/*
Bayesian Game

by Matthew Bardoe

A programming challenge to help learn about Bayesian updating.
A image is drawn and then sampled. Information is passed to the MapMaker
that then has to use that infomation to infer the map. 


*/
Field field;
int num_obs=5;
MyMap mymap;
Sensor sensor;

void setup(){
  size(800,600);
  field=new Field(width/2, height);
  for (int i=0; i<num_obs; i++){
    field.addObstacle();
  }
  mymap = new MyMap(width/2, 0, width/2, height);
  sensor = new Sensor(width/2, height, mymap);
}

void draw(){
  background(0);
  field.show();
  mymap.show();
  sensor.sense();
  //delay(500);

}
