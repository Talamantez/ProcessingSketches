import pitaru.sonia_v2_9.*;
import processing.serial.*;

Serial myPort;
    int val;
    int current = 0;
    int last = 0;
    float vol;
    
Sample mySample;

void setup() { 
  
  Sonia.start(this); 
  mySample = new Sample("beats.wav"); 
  
  mySample.play();
  vol = mySample.getVolume();
  mySample.setVolume(.2) ;
  mySample.repeat(); 
   size(400,400);   //window size
     
     //list all the available serial ports
     println(Serial.list());
     myPort = new Serial(this, "COM3", 9600);
      
     background(150,200,5);
}


void draw () {}

void serialEvent (Serial myPort) {
  // get the byte:
  int inByte = myPort.read(); 
  // print it:

  println(.1 + (inByte-40)*(1-.1)/(70-40));
  mySample.setVolume (.1 + (inByte-40)*(1-.1)/(80-40));
 
 
}
//(inByte-39)/10) 
//sets vol from .1 to 1
//.1 + (inByte-20)*(1-.1)/(100-20)
 //equation to normalize data range from wide to 1-10: y = 1 + (x-A)*(10-1)/(B-A)
