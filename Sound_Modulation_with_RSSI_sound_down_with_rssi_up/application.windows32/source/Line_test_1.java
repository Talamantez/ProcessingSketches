import processing.core.*; 
import processing.xml.*; 

import pitaru.sonia_v2_9.*; 
import processing.serial.*; 

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

public class Line_test_1 extends PApplet {



Serial port;  // Create object from Serial class



int val;    // Data received from the serial port

int[] readings = new int[10];
int index = 0;
int total = 0;
int average = 0;
int audio = 0;


float theta;  
float vol_satisfied;
float vol_will_i_break;
float a;
float c;
float s;

float magnitude;
float mag_will_i_break;

float r;
float g;
float b;

int pos;

Sample satisfied;
Sample will_i_break;

public void setup() {

  size(1100, 768);

  // enter fullscreen mode

  Sonia.start(this); 
  satisfied = new Sample("satisfied.wav");
  satisfied.play();


  will_i_break = new Sample("will i break_.wav");
  will_i_break.play();

  vol_satisfied = satisfied.getVolume();
  satisfied.setVolume(.1f) ;
  satisfied.repeat(); 

  vol_will_i_break = will_i_break.getVolume();
  will_i_break.setVolume(.4f) ;
  will_i_break.repeat(); 







  println(Serial.list());
  String arduinoPort = Serial.list()[0];
  port = new Serial(this, arduinoPort, 9600);
  for (int thisReading = 0; thisReading < 10; thisReading++)
    readings[thisReading] = 0;  
  smooth();
}

public void serialEvent (Serial myPort) {
  // get the byte:
  val = myPort.read();
}
// 1 + (val-30)*(640-1)/(70-30)


public void draw()

{

println(val);

  total = total - readings[index];
  readings[index] = val;
  total = total + readings[index];
  index = index + 1;

  if (index >=10 )
    index = 0;

  average = total / 10;
  //average= val;
  audio = average;
  //println (average);
  average = (1 + (average-25)*(1350-1)/(70-25));

  if (average<=0)
    average=0;

  //println (average);
  // println (val);
  //println (average);

  magnitude = (1.1f-  (.1f +    ((audio-36) *  (1-.1f)/ (80-36)))  );
  //println (magnitude);

  if (magnitude > 1)
    satisfied.setVolume (0);

  if (magnitude > 0)  
    satisfied.setVolume ((magnitude)*2.2f);


  will_i_break.setVolume(1-magnitude);



  // if (magnitude <=.7)    
  //  will_i_break.setVolume (1-magnitude);


  // if (magnitude <=.8)    
  //will_i_break.setVolume (1-magnitude);   
  // if (magnitude > 1)
  // will_i_break.setVolume (2);    
  // else if (magnitude > 0) 
  //     will_i_break.setVolume (1-magnitude);


  // println (vol);
  // vol= (1.1 - vol);
  // println (vol);
  // 
  background(0);
  frameRate(30);
//  if (val<=36)
//    r= random(0, 255);
//  if (val<=36)
//    g= random(0, 255);
//  if (val<=36)
//    b= random(0, 255);
  if (val>=70){
    r= random(0, 255);
    g= random(0, 255);
    b= random(150, 200);
  }
  stroke(r, g, b);
  strokeWeight(val-35);
  // Let's pick an angle 0 to 90 degrees based on the mouse position
  background(255-r, 255-g, 255-b); 
  if (val<=36)
    a=0;

    a =  (average/ (float) width) * 135f;
rectMode(CENTER);
rect(width/2,height/2,a*5, val);

  theta = radians(a);

  noFill();
}
  static public void main(String args[]) {
    PApplet.main(new String[] { "--present", "--bgcolor=#666666", "--hide-stop", "Line_test_1" });
  }
}
