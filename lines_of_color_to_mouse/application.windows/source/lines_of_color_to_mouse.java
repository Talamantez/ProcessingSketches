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

public class lines_of_color_to_mouse extends PApplet {

float x,y;
float targetX,targetY;
float easing=.009f;

public void setup(){size(screenWidth,screenHeight);smooth();
}
public void draw(){  for (int i=0;i<width;i+=20){
    for(int j=0;j<height;j+=20){
      targetX = mouseX;
  float dx = targetX - x;
  if(abs(dx) > 1) {
    x += dx * easing;
  }
    targetY = mouseY;
  float dy = targetY - y;
  if(abs(dy) > 1) {
    y += dy * easing;
  }
     
      strokeWeight(random(1,20));
      stroke(random(0,255),random(0,255),random(0,255));
      
      line(i,j,x,y);
      

}}}
  static public void main(String args[]) {
    PApplet.main(new String[] { "--present", "--bgcolor=#666666", "--hide-stop", "lines_of_color_to_mouse" });
  }
}
