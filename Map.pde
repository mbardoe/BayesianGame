abstract class Map {
  float[][][] myMap;
  int myWidth, myHeight;
  int gridsize=12;
  int offx, offy;
  

  Map(int offsetx, int offsety, int areawidth, int areaheight) {
    offx=offsetx;
    offy=offsety;
    myWidth=areawidth/gridsize+1;
    myHeight=areaheight/gridsize+1;
    //print(myWidth);
    //print(myHeight);
    myMap=new float[myWidth][myHeight][2];
    for (int i=0; i<myWidth; i++) {
      for (int j=0; j<myHeight; j++) {
        myMap[i][j][0]=.8;
        myMap[i][j][1]=.2;
      }
    }
  }
  void show() {
    for (int i=0; i<myWidth; i++) {
      for (int j=0; j<myHeight; j++) {
        fill(0, 0, 255, (int)(255*myMap[i][j][1]));
        rectMode(CORNER);
        rect(i*gridsize+offx, j*gridsize+offy, gridsize, gridsize);
      }
    }
  }

  abstract void update(int myx, int myy, float value);


}
