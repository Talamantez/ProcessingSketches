import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
int counter=0;
int closeCount=1;
int farCount=0;
PFont font;
int bg;
int indent=40;


float vol=300;//This is the amplitude (functionally volume) used in the synthesizer
int off=0;//This is the variable for the amplitude when a note is turned off

AudioOutput out;//audio output
SineWave sineG;//audio G sine wave
SineWave sineC;//audio C sine wave
SineWave sineF;//audio F sine wave
SineWave sineBflat;//audio B flat sine wave
Minim minim;//minim session

void setup(){
  font = loadFont("LaoUI-Bold-32.vlw");
  textFont(font, 32);
    //**MAIN HEADER-------------AUDIO------------**\\
  //**SECTION HEADER----AUDIO SYNTH-----**\\
   //**This section creates a sine wave audio synthesizer from the Minim Library**//
  minim = new Minim(this);
  // get a line out from Minim, default bufferSize is 1024, default sample rate is 44100, bit depth is 16
  out = minim.getLineOut(Minim.STEREO);
  // create a sine wave Oscillator, set to 440 Hz, at 0.5 amplitude(volume, sample rate from line out
  sineG = new SineWave(196.00, off, out.sampleRate());//G sine wave
  sineC = new SineWave(130.81, off, out.sampleRate());//C sine wave
  sineF = new SineWave(174.61, off, out.sampleRate());//F sine wave
  sineBflat = new SineWave(00.01, off, out.sampleRate());//B flat sine wave
  // set the portamento speed on the oscillator to 200 milliseconds
  sineG.portamento(100);
  sineC.portamento(200);
  sineF.portamento(200);
  sineBflat.portamento(300);
 // add the oscillator to the line out
  out.addSignal(sineG);
  out.addSignal(sineC);  
  out.addSignal(sineF);  
  out.addSignal(sineBflat);
  //**SECTION FOOTER----AUDIO SYNTH-----**//
size(350,160);
}

void draw(){
  if (closeCount==1){
          sineG.setAmp(vol);//set the amplitude of the sine wave synth to the new volume
          sineC.setAmp(off);
          sineF.setAmp(off);
          sineBflat.setAmp(off);
  }
 else if (closeCount==2){
          sineG.setAmp(vol);//set the amplitude of the sine wave synth to the new volume
          sineC.setAmp(vol);
          sineF.setAmp(off);
          sineBflat.setAmp(off);
  }
  else if (closeCount==3){
          sineG.setAmp(vol);//set the amplitude of the sine wave synth to the new volume
          sineC.setAmp(vol);
          sineF.setAmp(vol);
          sineBflat.setAmp(off);
  }
  else if (closeCount==4){
          sineG.setAmp(vol);//set the amplitude of the sine wave synth to the new volume
          sineC.setAmp(vol);
          sineF.setAmp(vol);
          sineBflat.setAmp(vol);
  }
 // text("word", 10, 50);
 
 
}

void mouseClicked(){
  background(bg);
   counter+=1;
   if (counter%2==0) {closeCount+=1;bg+=1000;}
   else farCount+=1;
     if (closeCount==5)closeCount=1;
  if (farCount==4)farCount=0;
  text("counter = " + counter,indent,40);
  text("close count = " + closeCount,indent,80);
  text("far count = " + farCount,indent,120);
  
}
