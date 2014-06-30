import pitaru.sonia_v2_9.*;
import processing.serial.*;

Serial myPort;
int val;
int current = 0;
int last = 0;
int inByte[] = {0,0};

Sample mySample;

void setup() { 

  Sonia.start(this); 
  mySample = new Sample("satisfied.wav"); 

  mySample.play();
  mySample.setVolume(.2) ;
  mySample.repeat(); 
  size(400,300);   //window size

  //list all the available serial ports
  println(Serial.list());
  myPort = new Serial(this, "COM4", 9600);

  background(150,200,5);
}


void draw () {
}

void serialEvent (Serial myPort) {
  // get the byte:
  inByte[0] = myPort.read(); 
  inByte[1] = myPort.read(); 
  // print it:
  println(inByte[0]);
  println(inByte[1]);
  
//  mySample.setVolume(inByte) ;
}

