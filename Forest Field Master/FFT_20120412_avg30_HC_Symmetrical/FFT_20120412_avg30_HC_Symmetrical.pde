import pitaru.sonia_v2_9.*;
import processing.serial.*;
Serial port;  // Create object from Serial class
int val;    // Data received from the serial port
int[] readings = new int[20];
int index = 0;
int total = 0;
int average = 0;
int audio = 0;

float theta;  
float vol_satisfied;
float vol_will_i_break;
float a;
float c;
float s;
float magnitude;
float mag_will_i_break;
float r,g,b;

int low;
int high;

int pos;

Sample satisfied;
Sample will_i_break;

void setup() {

  size(1100, 768);
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
  for (int thisReading = 0; thisReading < 20; thisReading++)
    readings[thisReading]=0;  
  smooth();
}

void serialEvent (Serial myPort) {
  // get the byte:
  val = myPort.read();
}
// 1 + (val-30)*(640-1)/(70-30)
void draw()
{
  
  
  low=5;
  high=250;
//println(val);
  total = total - readings[index];
  readings[index] = val;
  total = total + readings[index];
  index = index + 1;

  if (index >=20 )
    index = 0;

  average = total / 20;
  //average= val;
  
  audio = average;//set the audio average to the average of the val readings
  //println (average);
  //1st level average
  average = (1 + (average-25)*(1350-1)/(80-25)); 
   // average= map(average,25,80,1,1350);  //try to map average DOES NOT WORK- "cannot convert from float to int"
  if (average<=0)
    average=0;
println(average);
  //println (average);
  // println (val);
  //println (average);
  magnitude = (1.1-  (.1 +    ((audio-36) *  (1-.1)/ (80-36)))  ); //"magnitude" is the audio control - it is based on a mapping of average to a range that makes sense for volume control (.1-1)
  //println (magnitude);
  
  if (magnitude > 1)
    satisfied.setVolume (0);//if 'magnitude' (audio control) is >1, then the volume of the "satisfied" track is set to 0
  if (magnitude > 0)  
    satisfied.setVolume ((magnitude)*2.2);//if 'magnitude' (audio control) is >1, then the volume of the "satisfied" track is set to 0
    
  will_i_break.setVolume(1-magnitude);
  
  background(0);
  frameRate(30);
  if (val>=70){ r=random(0,255); 
       while (r>low && r<high)
       {
           r=random(0,255);
         }
  println (r);
  
  g=random(0,255);
       while (g>low && g<high)
           {g=random(0,255);}
  println (g);         
           
  b=random(0,255);
       while (b>low && b<high)
           {b=random(0,255);}
  println (b);

    
  }
  // Let's pick an angle 0 to 90 degrees based on the mouse position
  background(255-r, 255-g, 255-b); 
  if (val<=36){
    a=0;
   }
   stroke(r,g,b);
 //okkijk float d= map(average, 0, 1100, 36,80);
//else if (val>36)
    a =  (average/ (float) width) * 135f;
  //if (val > 60)
  //  a = (average/ (float) width) * 80f;
  // Convert it to radians
  theta = radians(a);
  //noFill();
  fill(255-r, 255-g, 255-b);
  translate(550, 700);// Draw a line 120 pixels
  strokeWeight(20); 
  line(0, 0, 0, -100);
  // Move to the end of that line
  translate(0, -100);
  // Start the recursive branching!
  branch(300);
}

void branch(float h) {
  // Each branch will be 2/3rds the size of the previous one
  float sw= map(h, 2, 100, 1, 5);
  strokeWeight(sw);

  if (val<=36)

    c=random(.6, .62);
  //c= random(.59,.68);    
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
    strokeWeight(sw);
    // Repeat the same thing, only branch off to the "left" this time!
    pushMatrix();
    rotate(-theta);
    line(0, 0, 0, -h);
    translate(0, -h);
    branch(h);
    popMatrix();
  }
}


