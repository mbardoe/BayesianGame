# CarDemo
Processing sketches to simulate a robotic car.

## API for the Car object

Car has the following methods that may be useful:

```Car(int x, int y, float theta)```

This constructor method allows you to place a car on the canvas pointing in the direction of ```angle```. The directions work 
with 0 as directly up and move in in a clockwise manner.

```void setLeftSpeed(int s)``` 

Set the speed of the left motor to an integer from 0 to 255. 

```void setRightSpeed(int s)``` 

Set the speed of the left motor to an integer from 0 to 255. 

```void LEDSense()```

Have the readings of the left and right sensors loaded into ```sensorValueRight``` and ```sensorValueLeft```.

```void show()``` 

Draw the car on the canvas.

```void move()```

Compute the new position of the car based on the motor settings.

## DriveSystem

DriveSystem is basically an abstract class that needs to be subclassed to create a strategy for how the car is to move. 
This set up is to emulate an autonomous car.

There is one main method, ```void drive()```. Below is a sample ```drive``` method. In this case we want to have the car move 
forward and then turn to the right, and then repeat those actions.

```
void drive() {
    //override me.
    if (noSense==0) {
      if (approach==0) {
        myCar.setLeftSpeed(30);
        myCar.setRightSpeed(30);
        approach=1;
        setNoSense(40);        
      } 
      else if (approach==1) {
        myCar.setLeftSpeed(5);
        myCar.setRightSpeed(-5);
        setNoSense(30);
        approach=0;
      }
    }
    noSense--;
  }
```

```approach``` is a class variable that allows you to indicate which settings you would like to employ. 

```setNoSense``` is a way to create a delay before the drive function determines another action. Basically actions are only 
taken when noSense is equal to 0.

In general you should use this template for your drive 

```
class MyDrive extends DriveSystem{
  
  MyDrive(Car mCar) {
    super(mCar);
  }
  
  void drive() {
    //override me.
    if (noSense==0) {
      if (approach==0) {
        // Put some stuff here for what to do first.
        
        // setNoSense to make it so that state continues for some period of time
        setNoSense(40);        
      } 
      else if (approach==1) {
        // Put some stuff here for what to do at another time indicated by approach 0.
        
        // setNoSense to make it so that state continues for some period of time
        setNoSense(30);
        
      }
    }
    noSense--;
  }
}
```
