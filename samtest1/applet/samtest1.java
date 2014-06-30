import processing.core.*; 
import processing.xml.*; 

import java.applet.*; 
import java.awt.Dimension; 
import java.awt.Frame; 
import java.awt.event.MouseEvent; 
import java.awt.event.KeyEvent; 
import java.awt.event.FocusEvent; 
import java.awt.Image; 
import java.io.*; 
import java.net.*; 
import java.text.*; 
import java.util.*; 
import java.util.zip.*; 
import java.util.regex.*; 

public class samtest1 extends PApplet {
  public void setup() {
/**
 * Shape Primitives. 
 * 
 * The basic shape primitive functions are triangle(),
 * rect(), quad(), and ellipse(). Squares are made
 * with rect() and circles are made with
 * ellipse(). Each of these functions requires a number
 * of parameters to determine the shape's position and size. 
 */
 /*
size(200, 200);
smooth(); 
background(0);
noStroke();
fill(226);
triangle(10, 10, 10, 200, 45, 200);
rect(45, 45, 35, 35);
quad(105, 10, 120, 10, 120, 200, 80, 200);
ellipse(140, 80, 40, 40);
triangle(160, 10, 195, 200, 160, 200); 
*/
int x = 0;
while (x < 10){
  int thingsize = x * 10;
  ellipse(140, 80, 40, 40);
  x++;
  delay(10000);
}
  noLoop();
} 
  static public void main(String args[]) {
    PApplet.main(new String[] { "--bgcolor=#F0F0F0", "samtest1" });
  }
}
