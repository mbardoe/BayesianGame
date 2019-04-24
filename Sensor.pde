class Sensor{
  float objectErrorRate = 0.4;
  float emptyErrorRate = 0.2;
  float avgPositionError=8;
  int myWidth, myHeight;
  Map myMapM;
  
 Sensor(int myW, int myH, Map map){
   
   myWidth=myW;
   myHeight=myH;
   myMapM=map;
 }
 
 void sense(){
   int newX, newY;
   float returnValue=0.0;
   // choose a random point in the field
   newX=(int)random(myWidth);
   newY=(int)random(myHeight);
   
   // determine the color of the that pixel
   loadPixels();
   float value=red(pixels[newY*width+newX])/255.0;
   
   
   // jiggle to create error in the readings
   // use the errorRates that are posted as class variables
   if (value>.5){
     // we have something
     if (random(1)<objectErrorRate){
       //Give false reading
       returnValue=0.0;
     }
     else
     {
       //Give true reading
       returnValue=1.0;
     }
   }
   else
   {
     if (random(1)<emptyErrorRate){
       //Give false reading
       returnValue=1.0;
     }
     else
     {
       //give true reading
       returnValue=0.0;
     }
   }
   
   
   // jiggle the chosen x and y values by the avgPositionError
   newX+=(int)(randomGaussian()*avgPositionError);
   newY+=(int)(randomGaussian()*avgPositionError);
   // report the jiggled information the mapMaker
   newX=constrain(newX,0,myWidth-myMapM.gridsize/2);
   newY=constrain(newY,0,myHeight-myMapM.gridsize/2);
   myMapM.update(newX, newY, returnValue);  
 }
}
