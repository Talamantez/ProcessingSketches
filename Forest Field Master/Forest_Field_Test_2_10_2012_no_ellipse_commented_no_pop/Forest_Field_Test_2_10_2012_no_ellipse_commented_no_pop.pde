import pitaru.sonia_v2_9.*;
import processing.serial.*;
Serial port;  // Create object from Serial class



int val;    // Data received from the serial port

int[] readings = new int[10]; //array of integer rssi readings
int index = 0; //index of array;
int total = 0; //sum of elements in readings[]
int average = 0; //average of elements in reading[]
int audio = 0;

float theta;  //angle for fractal
float vol_satisfied; //volume for "satisfied" clip
float vol_will_i_break; //volume for "will i break" clip
float a;
float c;//random element in the bifuraction state of the fractal
float s;

float magnitude;//
float mag_will_i_break;


float r;//red value for fractal
float g;//green value for fractal
float b;//blue value for fractal

int pos;

Sample satisfied;
Sample will_i_break;

void setup() {
   
  size(1100, 768); //size of window
  
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


void draw(){
  //boxcar filter
  total = total - readings[index]; //sum of all readings subtract oldest reading
  readings[index] = val; //put serial value into array readings
  total = total + readings[index]; //add newest reading to sum
  index = index + 1; //increment index
 
 if (index >=10 )
     index = 0;

//  index = mod(index + 1, 10);  //this is an easier way to increment the index, same as above
 
  average = total / 10; //average readings
  //average= val;
  audio = average; //use average for audio
  //println (average);
  average = (1 + (average-25)*(1350-1)/(90-25)); //use average for fractal
  // where do these numbers come from?!?  
  //average = (1 + (average-25)*1349/(maxrssi - minrssi)); // define maxrssi and minrssi above
 
  if (average<=0)
     average=0;
  
  //println (average);
  // println (val);
  //println (average);
  
  // what are these values?
  magnitude = (1.1-  (.1 +    ((audio-36) *  (1-.1)/ (70-36)))  );
//  magnitude = ((minvol + maxvol) - (minvol + (audio - minaudio) * (maxvol-minvol)/(maxaudio-minaudio)));
//  define maxaudio, minaudio, minvol, maxvol above
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
 
 //if (val<=36)
   //  a=0;
 //else if (val>36)
     a =  (average/ (float) width) * 40f;
 //if (val > 60)
   //  a = (average/ (float) width) * 80f;
  // Convert it to radians
  
  
  
  theta = radians(a);
// if (val<=36)
     //ellipseMode(CENTER);
 //if (val<=36)
   //   noFill();
   noFill();
// if (val<=50)     
//     // polygon(500,
//   
//    ellipse(550,500,(random(35,100)),(height/4));
//     
//  else if (val>50)
  // Start the tree from the bottom of the screen
//  translate(width/2,height);


  translate(550,700);// Draw a line 120 pixels
 strokeWeight(20); 
  
  line(0,0,0,-100);
  // Move to the end of that line
  translate(0,-100);
  // Start the recursive branching!
  branch(300);

}

void branch(float h) {
c=random(.6,.62); // Each branch will be .6 to .62 * the size of the previous one
float sw= map(h,2,100,1,5);//make the fractal branches get thinner as they progress from trunk to twig
strokeWeight(sw);

if (val<=36)
h *= c;    

  // All recursive functions must have an exit condition!
  // Here, ours is when the length of the branch is 2 pixels or less

  if (h > 2) {
    pushMatrix();    // Save the current state of transformation
    rotate(theta);   // Rotate by theta
    line(0, 0, 0, -h);  // Draw the branch
    translate(0, -h); // Move to the end of the branch
    branch(h);       // draw two new branches
    popMatrix();     // restore the previous matrix state
    
 strokeWeight(sw);
    // Repeat the same thing, only branch off to the "left" this time
    pushMatrix();
    rotate(-theta);
    line(0, 0, 0, -h);
    translate(0, -h);
    branch(h);
    popMatrix();
  }

}



