/**
 * Recursive Tree
 * by Daniel Shiffman.  
 * 
 * Renders a simple tree-like structure via recursion. 
 * The branching angle is calculated as a function of 
 * the horizontal mouse location. Move the mouse left
 * and right to change the angle.
 */
import pitaru.sonia_v2_9.*;
import processing.serial.*;
Serial port;  // Create object from Serial class
Sample mySample;

int val;    // Data received from the serial port

int[] readings = new int[10];
int index = 0;
int total = 0;
int average = 0;
 
float theta;  
float vol;

float b;

void setup() {
  Sonia.start(this); 
  mySample = new Sample("satisfied.wav");
  mySample.play();
  vol = mySample.getVolume();
  mySample.setVolume(.2) ;
  mySample.repeat(); 
  
  size(1350, 1100);
  
//  println(Serial.list());
  String arduinoPort = Serial.list()[3];
  port = new Serial(this, arduinoPort, 9600);
  for (int thisReading = 0; thisReading < 10; thisReading++)
      readings[thisReading] = 0;  
  smooth();
 
}

void serialEvent (Serial myPort) {
  // get the byte:
  val = myPort.read(); 
}
// 1 + (val-30)*(640-1)/(70-30)


void draw() {total = total - readings[index];
  readings[index] = val;
  total = total + readings[index];
  index = index + 1;
 
 if (index >=10 )
     index = 0;
 
 average = total / 10;
 average = (1 + (average-25)*(1350-1)/(90-25));
 if (average<0)
     average=0;
  
 

 println (average);
 
 mySample.setVolume (.1 + (average-40)*(1-.1)/(300-40));
  background(random(0,255),random(0,255),random(0,255));
  frameRate(30);
  stroke(255);
  if (average>600)
      stroke(random(0,255),random(0,255),random(0,255));
      else if (average<=600)
      stroke(255);

  // Let's pick an angle 0 to 90 degrees based on the mouse position
  float a =  (average/ (float) width) * 90f;
println (a);
     // Convert it to radians
  theta =  radians(a);
  ;  
  // Start the tree from the bottom of the screen
  translate(width/2,height);
  // Draw a line 120 pixels
  line(0,0,0,-400);
  // Move to the end of that line
  translate(0,-400);
  // Start the recursive branching!
  branch(300);
}

void branch(float h) {
  // Each branch will be 2/3rds the size of the previous one
  h *= random(0,1);
  

  
  
  // All recursive functions must have an exit condition!!!!
  // Here, ours is when the length of the branch is 2 pixels or less
  if (h > 2) {
    pushMatrix();    // Save the current state of transformation (i.e. where are we now)
    rotate(theta);   // Rotate by theta
    line(0, 0, 0, -h);  // Draw the branch
    translate(0, -h); // Move to the end of the branch
    branch(h);       // Ok, now call myself to draw two new branches!!
    popMatrix();     // Whenever we get back here, we "pop" in order 
                     //to restore the previous matrix state
    
    // Repeat the same thing, only branch off to the "left" this time!
    pushMatrix();
    rotate(-theta);
    line(0, 0, 0, -h);
    translate(0, -h);
    branch(h);
    popMatrix();
  }
     

}


