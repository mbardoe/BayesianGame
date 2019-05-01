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
BayesMap bayesmap;

void setup(){
  size(1200,600);
  field=new Field(width/3, height);
  for (int i=0; i<num_obs; i++){
    field.addObstacle();
  }
  mymap = new MyMap(width/3, 0, width/3, height);
  bayesmap = new BayesMap(2*width/3, 0, width/3, height);
  sensor = new Sensor(width/3, height, mymap);
}

void draw(){
  background(0);
  field.show();
  mymap.show();
  sensor.sense();
  //delay(500);

}
