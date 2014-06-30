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
line(graphXPos, height, graphXPos, height - inByte);
//at the edge of the screen, go back to the beginning.
if (graphXPos >= width) {
    graphXPos = 0;
    // clear the screen.
background(150,200,5);
}
else {
  //increment the horizontal position for the next reading.
  graphXPos++;
}
}
/**
 * Sine Wave Signal
 * by Damien Di Fede.
 *  
 * This sketch demonstrates how to use a <code>SineWave</code> with 
 * an <code>AudioOutput</code>. Move the mouse up and down to change 
 * the frequency, left and right to change the panning.
 * 
 * <code>SineWave</code> is a subclass of <code>Oscillator</code>, which 
 * is an abstract class that implements the interface <code>AudioSignal</code>.
 * This means that it can be added to an <code>AudioOutput</code> and the 
 * <code>AudioOutput</code> will call one of the two <code>generate()</code> 
 * functions, depending on whether the AudioOutput is STEREO or MONO. 
 * Since it is an abstract class, it can't be directly instantiated, it 
 * merely provides the functionality of smoothly changing frequency, amplitude 
 * and pan. In order to have an <code>Oscillator</code> that actually 
 * produces sound, you have to extend <code>Oscillator</code> and define 
 * the value function. This function takes a <b>step</b> value and returns 
 * a sample value between -1 and 1. In the case of the SineWave,
 * the value function returns this: <b>sin(freq * TWO_PI * step)</b>
 * <b>freq</b> is the current frequency (in Hertz) of the <code>Oscillator</code>. 
 * It is multiplied by <b>TWO_PI</b> to set the period of the sine wave 
 * properly and then that sine wave is sampled at <b>step</b>.
 */

import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;
AudioOutput out;
SineWave sine;

void setup()
{
  size(512, 200, P2D);
  
  minim = new Minim(this);
  // get a line out from Minim, default bufferSize is 1024, default sample rate is 44100, bit depth is 16
  out = minim.getLineOut(Minim.STEREO);
  // create a sine wave Oscillator, set to 440 Hz, at 0.5 amplitude, sample rate from line out
  sine = new SineWave(440, 0.5, out.sampleRate());
  // set the portamento speed on the oscillator to 200 milliseconds
  sine.portamento(200);
  // add the oscillator to the line out
  out.addSignal(sine);
}

void draw()
{
  background(0);
  stroke(255);
  // draw the waveforms
  for(int i = 0; i < out.bufferSize() - 1; i++)
  {
    float x1 = map(i, 0, out.bufferSize(), 0, width);
    float x2 = map(i+1, 0, out.bufferSize(), 0, width);
    line(x1, 50 + out.left.get(i)*50, x2, 50 + out.left.get(i+1)*50);
    line(x1, 150 + out.right.get(i)*50, x2, 150 + out.right.get(i+1)*50);
  }
}

void mouseMoved()
{
  // with portamento on the frequency will change smoothly
  float freq = map(mouseY, 0, height, 1500, 60);
  sine.setFreq(freq);
  // pan always changes smoothly to avoid crackles getting into the signal
  // note that we could call setPan on out, instead of on sine
  // this would sound the same, but the waveforms in out would not reflect the panning
  float pan = map(mouseX, 0, width, -1, 1);
  sine.setPan(pan);
}

void stop()
{
  out.close();
  minim.stop();
  
  super.stop();
}
  



