import pitaru.sonia_v2_9.*;
import processing.serial.*;

Serial myPort;  //the serial port
int graphXPos = 1; //the horizontal position of the graph
int val;
int current = 0;
int last = 0;
Sample mySample;

void setup () {  Sonia.start(this); 
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
  int inByte = myPort.read(); 
  // print it:
  println(inByte);
//set the drawing color.
 mySample.setVolume(sqrt (inByte-50)/4) ;
 stroke(116,145,200);
//draw the line.
line(graphXPos, height, graphXPos, height - inByte);
//at the edge of the screen, go back to the beginning.
if (graphXPos >= width) {
    graphXPos = 0;
    // clear the screen.
background(150,200,5);
}
else {
  //increment the horizontal position for the next reading.
  graphXPos++;
}
}

