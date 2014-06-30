// Example 11-08 from "Getting Started with Processing" 
// by Reas & Fry. O'Reilly / Make 2010

import processing.serial.*;

//variables for displaying text
PFont font; // The display font:


//set up the display text which will display the data recieved via serial


Serial port;  // Create object from Serial class

float val;
float val1 = (.1 + (val-40)*(1-.1)/(80-40)); // Data received from the serial port
int x;
float easing = 0.05;
float easedVal;

void setup() {
  size(440, 440);
  frameRate(9000000);
 smooth();
  String arduinoPort = Serial.list()[0];
  port = new Serial(this, "COM3", 9600);
  background(0);
}

void draw() {
  if ( port.available() > 0) {  // If data is available,
    val = port.read();          // read it and store it in val
    val = map(val, 0, 255, 0, height);  // Convert the values    
  }
    font = loadFont("David-72.vlw");
  
textFont (font);
fill(-val,-val, val);
rect(69+val , 253-val, 184, 50);
fill(val+69+val, (val), -x*x);
text(val, 50+val, 300-val);


  float targetVal = val;
  easedVal += (targetVal - easedVal) * easing;
  stroke(255);
  
  line(x, 0, x, height);  // Black line
  stroke(0);
  line(x+1, 0, x+1, height);  // White line
  line(x, 220, x, val-50);  // Raw value
  line(x, 440, x, easedVal + 220); // Averaged value

  x++;
  if (x > width) {
    x = 0; 
  }
println(val);

}





