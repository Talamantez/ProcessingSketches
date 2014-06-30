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

public class Rectangle_grow_class extends PApplet {

Rbox myRbox;
Rbox randomRbox;
float r=random(0,255);
float g=random(0,255);
float b=random(0,255);


class Rbox {
float r=random(0,255);
float g=random(0,255);
float b=random(0,255);
  int c;
  float w;
  float h;
  float x_start;
  float y_start;
  float x_grow_rate;
  float y_grow_rate;
  int d;


  
  Rbox(
  int tempC, 
  float tempW, float tempH, 
  float tempX_start, float tempY_start, float tempX_grow_rate, float tempY_grow_rate, int tempD) {
    c= tempC;
    w=tempW;
    h=tempH;
    x_start=tempX_start;
    y_start=tempY_start;
    x_grow_rate=tempX_grow_rate;
    y_grow_rate=tempY_grow_rate;
    d=tempD;
    
  }    
  public void display() {
    rectMode(CENTER);
    rect(x_start, y_start, w, h);
    fill(r,g,b);
    stroke(b,g,r);
    strokeWeight(random(2,10));
    
}

  public void grow() {
    w*=x_grow_rate;
    h*=y_grow_rate;
    delay(d);
    if (w>width) {
      w=4;
      h=4;
      x_start=random(0, width);
      y_start=random(0,height);
    }
    if (h>height) {
      w=3;
      h=3;
    }
  }
}      

public void setup() {
  size(500, 500);

 //fill(r,g,b);
  randomRbox = new Rbox(color(r, g, b), random(0, 30), random(0, 30), random(0, width), random(0, height), random(1, 20), random(1, 20), 5);

  //       Rbox(
  //  color tempC,
  //  float tempW, float tempH, 
  //  float tempX_start,float tempY_start, float tempX_grow_rate,float tempY_grow_rate, int tempD)
  myRbox = new Rbox(color(r, g, b), 40, 40, width/2, height/2, 2, 2, 50);
}

public void draw() {
  
  background(255-r, 255-g, 255-b);



  myRbox.display();
  myRbox.grow();
  randomRbox.display();
  randomRbox.grow();
}

  static public void main(String args[]) {
    PApplet.main(new String[] { "--present", "--bgcolor=#666666", "--stop-color=#cccccc", "Rectangle_grow_class" });
  }
}
