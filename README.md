# BayesianGame
Processing sketches to simulate creating maps from noisy information channels.

In this Processing sketch, we create a Field that has a number randomly 
positioned boxes that may overlap. Then there is a Sensor object that 
looks at random positions in the field and reports that it findings. The
sensor is prone to error with the following issues:

| Error type | Error strength|
|------------|---------------|
|Error on positive sighting| 20% of the time falsely reports nothing|
|Error on negative sighting| 10% of the time falsely reports something|
|Error on coordinates| Coordinates are wrong in both the x and y directions by a random error with standard deviation 5|

Using this information the challenge is to build an ```update``` function within the ```MyMap``` class. The function currently there is the one that 
takes the information raw and sets the corresponding part of the map to the 
information from the sensor. The code for that is given by:

```
 void update(int myx, int myy, float value) {
    
    /* THIS IS WHERE YOU PUT CODE.
    
    update takes in an x coordinate,  a y coordinate, and a value that  
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
  ```
  After three minutes of this code your map may look something like this.

  [three minute raw](link here)

  The goal is to use Bayesian updating to create a more faithful representation. For instance, one code that implemented a bayesian approach
  was able to get these results after 3 minutes.

  [three minute bayes](Threeminutebayesian.jpeg)
