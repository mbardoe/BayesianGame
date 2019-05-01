class BayesMap extends Map {

  //float[][][] myMap;
  //int myWidth, myHeight;
  //int gridsize=12;
  //int offx, offy;


  BayesMap(int offsetx, int offsety, int areawidth, int areaheight) {
    super(offsetx, offsety, areawidth, areaheight);
  }


  void update(int myx, int myy, float value) {
    /* update takes in an x coordinate,  a y coordinate, and a value that  
     is either 0.0 or 1.0. Your job is to update the map array. The array 
     contains a triple array of boxes that represent square 12x12 regions of 
     the field. E.g. map[3][2][1] is the probability that there IS NOT (because 
     the third coordinate is 1) something in the region defined by x coordinates
     between 36 and 48 (because the first coordinate is 3) and y coordinates 
     between 24 and 36 (because the second coordinate is 2).
     
     */

    int newX, newY;

    newX=myx/gridsize;
    newY=myy/gridsize;
    //print(myWidth);
    //println(myHeight);
    //print("myX:");
    //println(myx);
    //print("newX:");
    //println(newX);
    //print("newY:");
    //println(newY);
    float newThere, newEmpty;
    if (value>.5) {
      //I think that there is something
      //println("I think that there is something");
      newEmpty=myMap[newX][newY][0]*.1;
      newThere=myMap[newX][newY][1]*.8;
      myMap[newX][newY][0]=newEmpty/(newEmpty+newThere);
      myMap[newX][newY][1]=newThere/(newEmpty+newThere);
      ;
    } else
    {
      //I think that there is nothing there
      //println("I think that there is nothing there");
      newEmpty=myMap[newX][newY][0]*.9;
      newThere=myMap[newX][newY][1]*.2;
      myMap[newX][newY][0]=newEmpty/(newEmpty+newThere);
      myMap[newX][newY][1]=newThere/(newEmpty+newThere);
    }
  }
}
