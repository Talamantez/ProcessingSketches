import processing.serial.*;

Serial myPort;  //the serial port
int graphXPos = 1; //the horizontal position of the graph
int val;
int current = 0;
int last = 0;


void setup () {
     size(600,600);   //window size
     
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
stroke(height^2 - inByte,200,200);
//draw the line.
//line(graphXPos, height, graphXPos, height - inByte);
smooth();triangle(height - inByte, height, graphXPos, height - inByte, inByte,inByte); 
//at the edge of the screen, go back to the beginning.
quad(105, 10, 120, 10, 120, 200, 80, 200);
//if (graphXPos >= width) {
    graphXPos = inByte;
    // clear the screen.
background(height,height ,height - inByte^9);
}
//else {
  //increment the horizontal position for the next reading.
  //graphXPos++;
//}
//}
  



