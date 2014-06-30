import pitaru.sonia_v2_9.*;
import processing.serial.*;
import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;
AudioOutput out;
SineWave sine;

Serial port;  // Create object from Serial class

Rectangle outerRect;
Rectangle outerRect1;
Rectangle midRect;
Rectangle innerRect1;
Rectangle innerRect;

int val;    // Data received from the serial port

int[] readings = new int[40];
int index = 0;
int total = 0;
int average = 0;
int audio = 0;

int h_on_off; //height on off  

int sw= 0;//initial strokeWeight

float theta;  

float a;
float c;
float s;

float magnitude;


float r = random(0,255);
float g = random(0,255);
float b = random(0,255);

int pos;

class Rectangle{
  
  float w;
  float h;
  color clr;
  
 Rectangle(float tempW, float tempH, color tempClr){
   w=tempW;
   h=tempH;
   clr=tempClr;
 }
  
  void display(){
    
      rectMode(CENTER);
      strokeWeight(0);
      fill(clr);
      rect (width/2,height/2,w,h);
  }
}  






void setup() {
  size(1100, 768);
  background(255-r, 255-g, 255-b);
//   sw=(val-35);
//      if (sw<1)
//      sw=1;
  
   
  
   minim = new Minim(this);
  // get a line out from Minim, default bufferSize is 1024, default sample rate is 44100, bit depth is 16
  out = minim.getLineOut(Minim.STEREO);
  // create a sine wave Oscillator, set to 440 Hz, at 0.5 amplitude, sample rate from line out
  sine = new SineWave(440, 0.5, out.sampleRate());
  // set the portamento speed on the oscillator to 200 milliseconds
  sine.portamento(200);
  // add the oscillator to the line out
  out.addSignal(sine);

  println(Serial.list());
  String arduinoPort = Serial.list()[0];
  port = new Serial(this, arduinoPort, 9600);
  for (int thisReading = 0; thisReading < 40; thisReading++)
    readings[thisReading] = 0;  
  smooth();
  

}

void serialEvent (Serial myPort) {
  // get the byte:
  val = myPort.read();
}
// 1 + (val-30)*(640-1)/(70-30)


void draw()

{
  
   background(255-r, 255-g, 255-b);
   
   if (average>=1200){
    r= random(0, 255);
    g= random(0, 255);
    b= random(150, 200);    
  }

  if (val<38)
     h_on_off=0;
  if (val>=38)
     h_on_off=1;
  outerRect = new Rectangle ((a*10),(val+200)*h_on_off,color (r,g,b,50));
  outerRect1 = new Rectangle ((a*5),(val+100)*h_on_off,color (255-2, 255-2*g,255-2*b,75));
  midRect = new Rectangle ((a*2),(val+50)*h_on_off,color (r,g,b,100));
  innerRect1= new Rectangle ((a),(val+25)*h_on_off,color ((255-r), (255-(g)), (255-(b)),255)); 
  innerRect = new Rectangle (a/2,val*h_on_off,color (r-20,g-20,b-20));
  
  
   
float freq = map(val, 36,80, 60,1500);
sine.setFreq(freq);
println(val);

  total = total - readings[index];
  readings[index] = val;
  total = total + readings[index];
  index = index + 1;

  if (index >=10 )
    index = 0;

  average = total / 10;
  //average= val;
  audio = average;
  //println (average);
  average = (1 + (average-25)*(1350-1)/(70-25));

  if (average<=38)
    average=0;
    
  magnitude = (1.1-  (.1 +    ((audio-36) *  (1-.1)/ (80-36)))  );

 
  frameRate(30);

 
//  stroke(r, g, b);
//  
  
  // Let's pick an angle 0 to 90 degrees` based on the mouse position
 
    
   
//rectMode(CENTER);
//rect(width/2,height/2,a*5, val);
 
   
   outerRect.display();
   outerRect1.display();
   
   midRect.display();
   innerRect1.display();
   innerRect.display(); 

  if (val<=36)
   a=0;

    a =  (average/ (float) width) * 135f;
//  theta = radians(a);
//
//  noFill();
}
