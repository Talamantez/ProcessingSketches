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

public class color_square_array extends PApplet {

int x=100;
int y=100;
int r,g,b;
int bg;
int[] coordinates = {0,0,0,3,3,0,1,1,3,3,2,2,}; // remember it starts at 0,0 ;-)
public void setup() {
  size(400,400);
  selectInput();
}

public void draw() {
  
  background(bg);
  fill(255,0,0);

  // this adds a blinking cursor after your text, at the expense of redrawing everything every frame

  noFill();
  noStroke();
  for (int i=0; i<width/x; i++) { 
    for (int j=0; j<height/y; j++) {fill(random(0,255),random(0,255),random(0,255));
      r = PApplet.parseInt(random(2));
      if (r==0) {  
      ellipseMode(CORNER);
      ellipse(i*x,j*y,x,y);
      }
      else{
      rect(i*x,j*y,x,y);
      }
   }
}
  delay(200);
  for (int i=0; i<coordinates.length; i+=2)  {
    fill(random(0,255),random(0,255),random(0,255)); 
    rect (coordinates[i]*x,coordinates[i+1]*y,x,y);
  }

}


  static public void main(String args[]) {
    PApplet.main(new String[] { "--present", "--bgcolor=#666666", "--stop-color=#cccccc", "color_square_array" });
  }
}
