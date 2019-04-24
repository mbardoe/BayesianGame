class MyMap extends Map {

  //float[][][] myMap;
  //int myWidth, myHeight;
  //int gridsize=12;
  //int offx, offy;


  MyMap(int offsetx, int offsety, int areawidth, int areaheight) {
    super(offsetx, offsety, areawidth, areaheight);
  }


  void update(int myx, int myy, float value) {
    /* update takes in an x coordinate,  a y coordinate, and a value that  
     is either 0.0 or 1.0. Your job is to update the map array. The array 
     contains a triple array of boxes that represent square 12x12 regions of 
     the field. E.g. map[3][2][1] is the probability that there IS SOMETHING THERE 
     (because the third coordinate is 1) in the region defined by x coordinates
     between 36 and 48 (because the first coordinate is 3) and y coordinates 
     between 24 and 36 (because the second coordinate is 2).
     
     */

    int newX, newY;

    newX=myx/gridsize;
    newY=myy/gridsize;
    // If value=0 then 1-0 is 1, and 100 percent. 
    myMap[newX][newY][0]=(int)(1-value);
    myMap[newX][newY][1]=(int)(value);
  }
}
