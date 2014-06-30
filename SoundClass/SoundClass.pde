import pitaru.sonia_v2_9.*;
import processing.serial.*;
import ddf.minim.*;
import ddf.minim.signals.*;
Minim minim;
AudioOutput out;
SquareWave square1;
soundState soundState1 = new soundState(27.5,.06,44100,20);
	
// Declare and construct two objects (h1, h2) from the class HLine 
HLine h1 = new HLine(20, 2.0); 
HLine h2 = new HLine(50, 2.5); 

class soundState{
     float freq, amp, sampleRate, port;
     soundState(float tempFreq, float tempAmp, float tempSampleRate, float tempPort){
       ;
     }

}

void setup() 
{
  size(200, 200);
  frameRate(30);
  minim = new Minim(this);
  out = minim.getLineOut(Minim.STEREO);
}

void draw() { 
  background(204);
  h1.update(); 
  h2.update();  
} 
 
class HLine { 
  float ypos, speed; 
  HLine (float y, float s) {  
    ypos = y; 
    speed = s; 
  } 
  void update() { 
    ypos += speed; 
    if (ypos > height) { 
      ypos = 0; 
    } 
    line(0, ypos, width, ypos); 
  } 
} 




