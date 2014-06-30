import pitaru.sonia_v2_9.*;
import processing.serial.*;
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Serial port;  // Create object from Serial class
int rssi;    // Data received from the serial port
int window_size=10;
int[] readings = new int[window_size];
int index = 0;
int total = 0;
float average = 0;
float audio = 0;
PFont f;
int speed=5;
AudioOutput out;
SineWave sine;
Minim minim;
float theta;  
float vol_satisfied;
float vol_will_i_break;
float a;
float c;
float s;
float magnitude;
float mag_will_i_break;
float r, g, b;
//low and high rssi values
int low_rssi = 36;
int high_rssi = 80;
//thresholds for color flashing (randomizing)
int low=5;
int high=250;
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

//**SECTION HEAD**//
//**This section created a serial event. The serial port reads the rssi strength up to the
//size of of the window array "readings". This will then be averaged later as the
//functional RSSI(the control value for all dynamics in the project)
  println(Serial.list());
  String arduinoPort = Serial.list()[0];
  port = new Serial(this, arduinoPort, 9600);
  for (int thisReading = 0; thisReading < window_size; thisReading++)
    readings[thisReading]=0;
//**SECTION FOOTER**//


//**SECTION HEAD**//
//**This section creates a sine wave audio synthesizer**//
  minim = new Minim(this);
  // get a line out from Minim, default bufferSize is 1024, default sample rate is 44100, bit depth is 16
  out = minim.getLineOut(Minim.STEREO);
  // create a sine wave Oscillator, set to 440 Hz, at 0.5 amplitude, sample rate from line out
  sine = new SineWave(0, 0.5, out.sampleRate());
  // set the portamento speed on the oscillator to 200 milliseconds
  sine.portamento(200);
 // add the oscillator to the line out
  out.addSignal(sine); 
//**SECTION FOOTER**//

  f = loadFont( "Aharoni-Bold-360.vlw" );
  textFont(f);
}

void serialEvent (Serial myPort) {
  // get the byte:
  rssi = myPort.read();
}
// 1 + (rssi-30)*(640-1)/(70-30)
void draw()
{
  smooth();


  //println(rssi);
  total = total - readings[index];
  readings[index] = rssi;
  total = total + readings[index];
  index = index + 1;

  if (index == window_size)
    index = 0;

  average = (total / window_size);
  //average= rssi;

  audio = average;//set the audio average to the average of the rssi readings
  //println (average);
  //1st level average

    //average = (1 + (average-25)*(1350-1)/(80-25)); 
  average= map(average, low_rssi, high_rssi, 1, width);  //1 is min screen width
  if (average<=0)
    average=0;
  println(average);
  //println (average);
  // println (rssi);
  //println (average);
  magnitude = (1.1-  (.1 +    ((audio-36) *  (1-.1)/ (80-36)))  ); //"magnitude" is the audio control - it is based on a mapping of average to a range that makes sense for volume control (.1-1)
  //println (magnitude);

  if (magnitude > 1)
    satisfied.setVolume (0);//if 'magnitude' (audio control) is >1, 
                            //then the volume of the "satisfied" track is set to 0
  if (magnitude > 0)  
    satisfied.setVolume ((magnitude)*2);//if 'magnitude' (audio control) is >1, 
                                       //then the volume of the "satisfied" track is set to 0

  will_i_break.setVolume(1.001-magnitude);

  background(0);
  frameRate(30);


//**SECTION HEAD**\\
//**This section randomizes color when the performers are very far away. The rgb values of the projected fractal and 
//background randomize after reaching a high rssi number. 
  if (rssi>=70) { //if rssi value is > or = to 70, 
    r=random(0, 255); //randomize red
    while (r>low && r<high)//if color is not high enough contrast
    {
      r=random(0, 255);//randomize again
    }
    println (r);//print the red value

    g=random(0, 255);//randomize green
    while (g>low && g<high)//if color is not high contrast
    {
      g=random(0, 255);//randomize again
    }
    println (g);//print the green value    

    b=random(0, 255);//randomize blue
    while (b>low && b<high)//if the color is not high contrast
    {
      b=random(0, 255);//randomize again
    }
    println (b);//print the blue value
  }
  
  //**SECTION FOOTER ----HIGH CONTRAST COLOR RANDOMIZER-----**\\
  
  
//**SECTION HEADER ---TREE FRACTAL-----**\\
//The following code controls the drawing of the projected tree fractal and background 
  // Let's pick an angle 0 to 90 degrees based on the value of the rssi
     //**SUB SECTION HEADER---COLOR OF BACKGROUND AND FRACTAL---**\\
  background(255-r, 255-g, 255-b); //set background to the inverse of the 
                                  //randomized r,g,b values. This makes the color of the
                                  //background always the complement to the color of the
                                  //fractal
  stroke(r, g, b); //set the line color to the randomized r,g,b colors
     //**SUB SECTION FOOTER ---COLOR OF BACKGROUND AND FRACTAL----**\\
  
     //**SUB SECTION HEADER ---BRANCHING ANGLE CONTROL---**\\
     //Here, we relate the rssi to the branching angle:
     //the closer the dancers are, the smaller the branching angle.
  if (rssi<=36) { //if the rssi is at its minimum (dancers are close)
         a=0;    //the branching angle is Zero (this results in a projected vertical line)
               }
               
  else {         //if the rssi is not at minimum
        a =  ((average)/width) * 135f;//the branching angle = the rssi average/width *135f 
       }                              //I don't remember what f is? 
       
  theta = radians(a);//convert angle to radians
      //** SUB SECTION FOOTER ---BRANCHING ANGLE CONTROL---**\\
      
      //** SUB SECTION HEADER ---DRAW THE FRACTAL---**\\
  translate(550, 700);// Draw a line 120 pixels
  strokeWeight(20); //set the stroke weight to 20
  line(0, 0, 0, -100);//draw the first line
  // Move to the end of that line
  translate(0, -100);
  // Start the recursive branching
  branch(300);
  stroke(255);
  int h=2*height/3;
     //**SUB SECTION FOOTER ---DRAW THE FRACTAL---**\\
}



  //**SECTION HEADER----BRANCH FUNCTION---**\\
  //**the Branch function is drawn in halves**\\
void branch(float h) {
  // Each branch will be 2/3rds the size of the previous one
  float sw= map(h, 2, 100, 1, 5);//taper the branches- this makes the trunk thick and the 
                                 //twigs at the end of the branches very thin
  strokeWeight(sw); //set the strokeWeight to sw
  
  // If the pixel size is smaller than 2, stop the recursive branching
  if (h > 2) {
    pushMatrix();    // Save the current state of transformation 
    rotate(theta);   // Rotate the screen reference by theta
    line(0, 0, 0, -h);  // Draw the branch
    translate(0, -h); // Move to the end of the branch
    branch(h);       // Call the branch function to draw the next recursive branch
    popMatrix();     // Return to the orgiginal screen reference point
    //Repeat the recursive branching on the left side of the screen
    pushMatrix();
    rotate(-theta);
    line(0, 0, 0, -h);
    translate(0, -h);
    branch(h);
    popMatrix();
  }
}

  //**SECTION FOOTER ----BRANCH FUNCTION---**\\





