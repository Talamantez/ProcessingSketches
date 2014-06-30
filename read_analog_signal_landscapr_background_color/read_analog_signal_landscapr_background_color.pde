import processing.serial.*;

Serial myPort;  //the serial port
int graphXPos = 1; //the horizontal position of the graph
int val;
int current = 0;
int last = 0;


void setup () {
     size(400,300);   //window size
     
     //list all the available serial ports
     println(Serial.list());
     myPort = new Serial(this, "COM3", 9600);
      
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
stroke(116,145,200);
//draw the line.
//line(graphXPos, height, graphXPos, height - inByte);
triangle(graphXPos, height, graphXPos, height - inByte, 160, 200); 
//at the edge of the screen, go back to the beginning.
if (graphXPos >= width) {
    graphXPos = 0;
    // clear the screen.
background(150,height ,height - inByte);
}
else {
  //increment the horizontal position for the next reading.
  graphXPos++;
}
}
  



