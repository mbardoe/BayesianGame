class Sensor {
  float objectErrorRate = 0.2;
  float emptyErrorRate = 0.1;
  float avgPositionError=5.0;
  int myWidth, myHeight;
  Map[] myMapMs;

  Sensor(int myW, int myH, Map[] maps) {

    myWidth=myW;
    myHeight=myH;
    myMapMs=maps;
  }

  void sense() {
    int newX, newY;
    float returnValue=0.0;
    // choose a random point in the field
    newX=(int)random(myWidth);
    newY=(int)random(myHeight);

    // determine the color of the that pixel
    loadPixels();
    float value=red(pixels[newY*width+newX])/255.0;
    //println(value);

    // jiggle to create error in the readings
    // use the errorRates that are posted as class variables
    if (value>.5) {
      // we have something
      if (random(1)<objectErrorRate) {
        //Give false reading
        //println("False Reading 0");
        returnValue=0.0;
      } else
      {
        //Give true reading
        //println("True Reading 1");
        returnValue=1.0;
      }
    } else
    {
      // There is nothing there
      if (random(1)<emptyErrorRate) {
        //Give false reading
        //println("False Reading 1");
        returnValue=1.0;
      } else
      {
        //give true reading
        //println("True Reading 0");
        returnValue=0.0;
      }
    }


    // jiggle the chosen x and y values by the avgPositionError
    newX+=(int)min(max((randomGaussian()*avgPositionError), myWidth-12), 0);
    newY+=(int)min(max((randomGaussian()*avgPositionError), myHeight-12), 0);
    // report the jiggled information the mapMaker

    //newX=constrain(newX,0,myWidth-myMapM.gridsize/2);
    //newY=constrain(newY,0,myHeight-myMapM.gridsize/2);
    //print(newX);
    //print(" ");
    //print(newY);
    //print("  ");
    //println(returnValue);
    //if (returnValue>.5)
    //{
    //  fill(0, 0, 255);
    //} else
    //{
    //  fill(255, 0, 0);
    //}
    //ellipse(newX, newY, 10, 10);
    for (Map m:myMapMs) {

      m.update(newX, newY, returnValue);
    }
  }
}
