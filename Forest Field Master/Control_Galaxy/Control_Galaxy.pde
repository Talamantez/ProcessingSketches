import pitaru.sonia_v2_9.*;
import processing.serial.*;
Serial port;  // Create object from Serial class



int val;    // Data received from the serial port

int[] readings = new int[10];
int index = 0;
int total = 0;
int average = 0;
int audio = 0;

float vol_satisfied;
float vol_will_i_break;
float a;
float c;
float s;

float xoff=0.0;

float magnitude;
float mag_will_i_break;

float theta;
float r;
float g;
float b;

int pos;

Sample satisfied;
Sample will_i_break;

void setup() {
  
   size(1100, 768);
  
  // enter fullscreen mode
 
  Sonia.start(this); 
  satisfied = new Sample("satisfied.wav");
  satisfied.play();
  
  
  will_i_break = new Sample("will i break_.wav");
  will_i_break.play();
  
  vol_satisfied = satisfied.getVolume();
  satisfied.setVolume(.1) ;
  satisfied.repeat(); 
  
  vol_will_i_break = will_i_break.getVolume();
  will_i_break.setVolume(.4) ;
  will_i_break.repeat(); 
  
  
  
  
  

  
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


void draw()

{total = total - readings[index];
  readings[index] = val;
  total = total + readings[index];
  index = index + 1;
 
 if (index >=10 )
     index = 0;
 
average = total / 10;
//average= val;
 audio = average;
 //println (average);
 average = (1 + (average-25)*(1350-1)/(90-25));
 
 if (average<=0)
     average=0;

 //println (average);
// println (val);
//println (average);

magnitude = (1.1-  (.1 +    ((audio-36) *  (1-.1)/ (70-36)))  );
println (magnitude);

if (magnitude > 1)
   satisfied.setVolume (0);
  
 if (magnitude > 0)  
  satisfied.setVolume ((magnitude)*2.2);
  
 //if (magnitude >=.55)
     //will_i_break.setVolume (0);
  //  if (magnitude <.77)    
    // will_i_break.setVolume (0);
   
  //  if (magnitude >.7)    
 // if (magnitude>=.2)
    //  will_i_break.setVolume(0);
//else if (magnitude <.2)
     will_i_break.setVolume(1-magnitude);
  
   
     
// if (magnitude <=.7)    
   //  will_i_break.setVolume (1-magnitude);
     
     
  // if (magnitude <=.8)    
     //will_i_break.setVolume (1-magnitude);   
// if (magnitude > 1)
    // will_i_break.setVolume (2);    
// else if (magnitude > 0) 
//     will_i_break.setVolume (1-magnitude);

 
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
 
// if (val<=36)
//     a=0;
// else if (val>36)
  //   a = theta;   



  
  xoff=xoff+.001;
  background(0);
  frameRate(30);
  stroke(255);
  // Let's pick an angle 0 to 90 degrees based on the mouse position
  a = (average / (float) width) * 90f;
  
 // (average/ (float) width) * 40f;
  // Convert it to radians
  theta = radians(a*xoff);
  // Start the tree from the bottom of the screen
  //translate(width/2,height);
  // Draw a line 120 pixels
//  ellipse(width/2,height/2,30,-30);
//  // Move to the end of that line
//  translate(0,-30);
  // Start the recursive branching!
  branch(120);

}

void branch(float h) {
  // Each branch will be 2/3rds the size of the previous one
  h *= 0.66;
//  xoff=xoff+50;
 // translate (width/2, height/2);
  // All recursive functions must have an exit condition!!!!
  // Here, ours is when the length of the branch is 2 pixels or less
  if (h > 2) {
    pushMatrix();    // Save the current state of transformation (i.e. where are we now)
    rotate(theta);   // Rotate by theta
    ellipse(height/2, width/2, -h, -h);  // Draw the branch
    translate(0, -h); // Move to the end of the branch
    branch(h);       // Ok, now call myself to draw two new branches!!
    popMatrix();     // Whenever we get back here, we "pop" in order to restore the previous matrix state
    
    // Repeat the same thing, only branch off to the "left" this time!
    pushMatrix();
    rotate(-theta*sqrt (xoff));
    ellipse(h, xoff, -h, -h);
    translate(0, -h);
    branch(h);
    popMatrix();
  }
}
