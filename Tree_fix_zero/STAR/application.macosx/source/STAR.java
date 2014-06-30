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

public class STAR extends PApplet {

float ps; //pentagon side length
float ss; //star point distance length

float xpos=width/2; //x of pentagon starting vertex
float ypos=height/2; //y of pentagon starting vertex
float xstar; //x of star point starting vertex
float ystar; //y of star point starting vertex

public void setup() {

  size(800, 800);
}

public void draw() {

  ps=mouseX;
  xpos=mouseX; //turn this on to use mouseX as Xpos
  ypos=mouseY;  //turn this on to use mouseY as Ypos
  //xpos=width/4;
  //ypos=height/4;
  xstar=xpos + ps/2;
  ystar=(ypos-sqrt( sq(ps)-(sq(ps/2))));
  ss=2*ystar;

  beginShape(POLYGON); 
  fill(0);
  stroke(random(0,255),random(0,255),random(0,255));
  strokeWeight(10);
  fill(random(0,255),random(0,255),random(0,255));
  vertex(xpos, ypos); 
  vertex(xstar, ystar);
  vertex((xpos+ps), ypos);

  vertex((xstar+ss+ss*(.308f)), (ystar+ss*(.951f))); 
  vertex((xpos+ps+ps*(.308f)), (ypos+ps*(.951f)));
  vertex((xstar+ss+ss*.03f), (ystar+5*ss*(.588f)));
  // vertex( (xstar+(ps/2)), (ystar+ps*.951+sqrt(   sq(ps)-sq((ps/2)+ps*(.309))  ) ) );
  vertex( (xpos+(ps/2)), (ypos+ps*.951f+sqrt(   sq(ps)-sq((ps/2)+ps*(.309f))  )  )    );
  vertex((xstar-ss-ss*.03f), (ystar+5*ss*(.588f)));
  vertex((xpos-ps*(.309f)), (ypos+ps*(.951f)));
  vertex((xstar-ss-ss*(.308f)), (ystar+ss*(.951f)));
  endShape(CLOSE);
}

  static public void main(String args[]) {
    PApplet.main(new String[] { "--present", "--bgcolor=#666666", "--stop-color=#cccccc", "STAR" });
  }
}
