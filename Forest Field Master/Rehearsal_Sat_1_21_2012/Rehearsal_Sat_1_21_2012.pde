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
int audio = 0;

 
float theta;  
float vol;
float a;
float c;
float s;

float magnitude;

float r;
float g;
float b;

int pos;

void setup() {
 
  
  // enter fullscreen mode
 
  Sonia.start(this); 
  mySample = new Sample("satisfied.wav");
   mySample.play();
  vol = mySample.getVolume();
  mySample.setVolume(.2) ;
  mySample.repeat(); 
  
  size(1050, 768);
  
  println(Serial.list());
  String arduinoPort = Serial.list()[0];
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
 audio = average;
 //println (average);
 average = (1 + (average-25)*(1350-1)/(90-25));
 
 if (average<=0)
     average=0;

 //println (average);
// println (val);
//println (average);

magnitude = (.1 +    ((audio-36) *  (1-.1)/ (70-36)))  ;
println (magnitude);

if (magnitude <= 0)
   mySample.setVolume (0);
else if (magnitude > 0)  
  mySample.setVolume (magnitude);
 
// println (vol);
// vol= (1.1 - vol);
// println (vol);
// 
  background(0);
  frameRate(30);
    if (val<=36)
       r= random(0,255);
    if (val<=36)
       g= random(0,255);
    if (val<=36)
       b= random(0,255);
    if (val>=70)
       r= random(0,255);
    if (val>=70)
       g= random(0,255);
    if (val>=70)
       b= random(150,200);
  stroke(r,g,b);
  // Let's pick an angle 0 to 90 degrees based on the mouse position
 
 if (val<=36)
     a=0;
 else if (val>36)
     a =  (average/ (float) width) * 40f;
 if (val > 60)
     a = (average/ (float) width) * 80f;
  // Convert it to radians
  
  
  
  theta = radians(a);
// if (val<=36)
     //ellipseMode(CENTER);
 //if (val<=36)
   //   noFill();
   noFill();
 if (val<=36)     
     // polygon(500,
   
   ellipse(500,500,(random(35,100)),(height/4));
     
  else if (val>36)
  // Start the tree from the bottom of the screen
//  translate(width/2,height);
  translate(500,700);// Draw a line 120 pixels
  line(0,0,0,-100);
  // Move to the end of that line
  translate(0,-100);
  // Start the recursive branching!
  branch(300);

}

void branch(float h) {
  // Each branch will be 2/3rds the size of the previous one

if (val<=36)
    c= random(.59,.68);    
    h*= c;
  
  // All recursive functions must have an exit condition!!!!
  // Here, ours is when the length of the branch is 2 pixels or less
  if (h > 2) {
    pushMatrix();    // Save the current state of transformation (i.e. where are we now)
    rotate(theta);   // Rotate by theta
    line(0, 0, 0, -h);  // Draw the branch
    translate(0, -h); // Move to the end of the branch
    branch(h);       // Ok, now call myself to draw two new branches!!
    popMatrix();     // Whenever we get back here, we "pop" in order to restore the previous matrix state
    
    // Repeat the same thing, only branch off to the "left" this time!
    pushMatrix();
    rotate(-theta);
    line(0, 0, 0, -h);
    translate(0, -h);
    branch(h);
    popMatrix();
  }

}



