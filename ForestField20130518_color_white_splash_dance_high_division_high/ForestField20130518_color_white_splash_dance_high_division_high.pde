//processing serial library:
import processing.serial.*;
//minim sound synthesis libraries:
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

int indent=40;
//Serial Variables:
Serial port;  // Create object from Serial class
//Signal Strength Data Received from Serial Port
int rssi;// signal strength received from the the transmitting dancer's 
            // xbee module. rssi range is between 36 and 80. 36 is, like, 0. 

//Boxcar average Variables:
int window_size=40;//size of the Box car array to average
int[] readings = new int[window_size]; //create an array called "readings" that will be averaged
int index = 0;//start at the first index of the array
int total = 0;//total will = total- readings[index]
float average = 0; //average will = total/window_size
int low_rssi = 36;//lowest rssi value->maps to 1
int high_rssi = 80;// highest rssi value-> maps to width
PFont font;
//Audio Variables:
int onCount = 0;//"On" Counter, counts the time that performers have been close
              //and is used to increment the volume the longer they've been near each other
            
int offCount = 0;//"Off" Counter, counts the time that performers have been apart
              //and is used to decrement the volume the longer they've been apart

int onThreshold = 0;//set the threshold that the "On" Counter has to reach before the volume increments
int offThreshold = 1;//set the threshold that the "Off" Counter has to reach before the volume decrements

float onIncrement = 2;//amount volume is increased per near time step
float offIncrement = .7;//amount volume is decresead per away time step
float volMax = 120.0;//maximum volume
float volMin = 30.0;//minimum volume

float vol;//This is the amplitude (functionally volume) used in the synthesizer
int off=0;//This is the variable for the amplitude when a note is turned off

int closeCount=0;//count how many times performers have come close
int farCount=0;//count how many time performers have been far - closenessCount can't increase 
                 //until this has an equal value

AudioOutput out;//audio output
SineWave sineG;//audio G sine wave
SineWave sineC;//audio C sine wave
SineWave sineF;//audio F sine wave
SineWave sineB;//B flat sine wave
Minim minim;//minim session

//count the number of times sineB plays
int loopCount=0;
//End audio variables

void setup() {
  size(screenWidth, screenHeight);
  background(0);
  //smooth();
  //**SECTION HEAD------SERIAL EVENT-----**//
//**This section created a serial event. The serial port reads the rssi strength up to the
//size of of the window array "readings". This will then be averaged later as the
//functional RSSI(the control value for all dynamics in the project)
  //println(Serial.list());
  String arduinoPort = Serial.list()[0];
  port = new Serial(this, arduinoPort, 9600);
  for (int thisReading = 0; thisReading < window_size; thisReading++)
    readings[thisReading]=0;

//**SECTION FOOTER-----SERIAL EVENT**//

//**MAIN HEADER-------------AUDIO------------**\\
  //**SECTION HEADER----AUDIO SYNTH-----**\\
   //**This section creates a sine wave audio synthesizer from the Minim Library**//
  minim = new Minim(this);
  // get a line out from Minim, default bufferSize is 1024, default sample rate is 44100, bit depth is 16
  out = minim.getLineOut(Minim.STEREO);
  // create a sine wave Oscillator, set to 440 Hz, at 0.5 amplitude(volume, sample rate from line out
  sineG = new SineWave(196.00, off, out.sampleRate());//1st sine wave - frequency between G and an A
  sineC = new SineWave(130.81, off, out.sampleRate());//2nd sine wave - frequency between C and D
  sineF = new SineWave(174.61, off, out.sampleRate());//3rd sine wave - frequency ~F
  sineB = new SineWave(20.60, off, out.sampleRate()); 
 //sineB = new SineWave(120.21, off, out.sampleRate());low option 4th sine wave - low b flat
  //sineB = new SineWave(00.01, off, out.sampleRate());//low option 4th sine wave - low b flat
  // set the portamento speed on the oscillator to 200 milliseconds
  sineG.portamento(200);
  sineC.portamento(200);
  sineF.portamento(200);
  sineB.portamento(50);
 // add the oscillator to the line out
  out.addSignal(sineG);
  out.addSignal(sineC);  
  out.addSignal(sineF);  
  out.addSignal(sineB);
}

void serialEvent (Serial myPort) {
  // get the signal strength between the dancers' xbee modules through the serial port:
  rssi= myPort.read();
}

void draw() {
//**SECTION HEADER ---- PROCESS THE RSSI **\\    
  total = total - readings[index];
  readings[index] = rssi;
  total = total + readings[index];
  index = index + 1;
  
   if (index == window_size)
    index = 0;

    average = (total / window_size);
    
  average= map(average, low_rssi, high_rssi, 1, width);  //1 is min screen width
  
  if (average<=0)
    average=0; 
//**SECTION FOOTER ----PROCESS THE RSSI***\\

 
  
//*MAIN HEADER -----------AUDIO---------------******\\  
              
   //**SECTION HEAD------SYNTH VOLUME CONTROLLER------**//
 //**The following code increments the volume while the performers are very close
 //and decrements it if they are away from each other**//
 //**Use the closeCount to control which notes are played
 
 
 //ending
 if (loopCount>=10) {
  if (rssi>=58){
     if (farCount==4)farCount=closeCount;
     else if (closeCount>farCount){farCount+=1;loopCount+=1;}
   }
                                       
   if (rssi<=36 && closeCount==farCount){
          closeCount+=1;
   }

                                       
  if (closeCount==5)closeCount=1;
  if (farCount==5)farCount=1;
  if (closeCount==1){
if(average<=36){  //if rssi is at its lowest value 
              //(performers are as close as they can get to oneanother
            //increse the closenessCount  
              //run this code:
       offCount=0;//set the "Off" Counter to Zero
      if(vol>=volMax){    //if the volume is maxxed out
                onCount = 0; //set the On counter to 0
                //continue;  //and continue with the show
                     }
       else{              //else
                onCount+=1;//increment the "On" Counter
                      if(onCount>=onThreshold){  //if the "On" Counter reaches the "On" Threshold
                               vol+=onIncrement; //increase the volume
                               onCount = 0;        //set the "On" Counter to 0
                                              }
                                                            }
          sineG.setAmp(vol);//set the amplitude of the sine wave synth to the new volume
          sineC.setAmp(off);
          sineF.setAmp(off);
          sineB.setAmp(off);
        }
else{           
   onCount=0; //set the "On" Counter to zero 
   
  if(vol<=volMin){//if the volume is minned out
        offCount = 0;   } 
  else{    //
          offCount+=1;//increment the "Off" Counter
                 if(offCount>=offThreshold){ //if the "Off" Counter reaches the "Off" Threshold
                            vol-=offIncrement; //decrease the volume\
                             offCount = 0;       //and set the "Off" Counter to 0
                                            }
                 else{                         //if the "Off" Counter hasn't reached the 
                                               //decrement threshold yet
                     // continue;                //continue with the show
                 }                      
   }
   sineG.setAmp(vol);//set the amplitude of the sine wave synth to the new volume
   sineC.setAmp(off);
   sineF.setAmp(off);
   sineB.setAmp(off);
 }   }
else if (closeCount ==2){
if(average<=36){  //if rssi is at its lowest value 
              //(performers are as close as they can get to oneanother
            //increse the closenessCount  
              //run this code:
       offCount=0;//set the "Off" Counter to Zero
      if(vol>=volMax){    //if the volume is maxxed out
                onCount = 0; //set the On counter to 0
                //continue;  //and continue with the show
                     }
       else{              //else
                onCount+=1;//increment the "On" Counter
                      if(onCount>=onThreshold){  //if the "On" Counter reaches the "On" Threshold
                               vol+=onIncrement; //increase the volume
                               onCount = 0;        //set the "On" Counter to 0
                                              }
                                                            }
          sineG.setAmp(vol);//set the amplitude of the sine wave synth to the new volume
          sineC.setAmp(vol);
          sineF.setAmp(off);
          sineB.setAmp(off);
        }
else{           
   onCount=0; //set the "On" Counter to zero 
   
  if(vol<=volMin){//if the volume is minned out
        offCount = 0;   } 
  else{    //
          offCount+=1;//increment the "Off" Counter
                 if(offCount>=offThreshold){ //if the "Off" Counter reaches the "Off" Threshold
                            vol-=offIncrement; //decrease the volume\
                             offCount = 0;       //and set the "Off" Counter to 0
                                            }
                 else{                         //if the "Off" Counter hasn't reached the 
                                               //decrement threshold yet
                     // continue;                //continue with the show
                 }                      
   }
   sineG.setAmp(vol);//set the amplitude of the sine wave synth to the new volume
   sineC.setAmp(vol);
   sineF.setAmp(off);
   sineB.setAmp(off);
 }   }
 
 else if(closeCount ==3){
if(average<=36){  //if rssi is at its lowest value 
              //(performers are as close as they can get to oneanother
            //increse the closenessCount  
              //run this code:
       offCount=0;//set the "Off" Counter to Zero
      if(vol>=volMax){    //if the volume is maxxed out
                onCount = 0; //set the On counter to 0
                //continue;  //and continue with the show
                     }
       else{              //else
                onCount+=1;//increment the "On" Counter
                      if(onCount>=onThreshold){  //if the "On" Counter reaches the "On" Threshold
                               vol+=onIncrement; //increase the volume
                               onCount = 0;        //set the "On" Counter to 0
                                              }
                                                            }
          sineG.setAmp(vol);//set the amplitude of the sine wave synth to the new volume
          sineC.setAmp(vol);
          sineF.setAmp(vol);
          sineB.setAmp(off);
      }
else{         //else, if the rssi is not at its l
              //(the performers are away from each other)
              //run this code:              
   onCount=0; //set the "On" Counter to zero 
   
  if(vol<=volMin){//if the volume is minned out
        offCount = 0;//set the "Off" counter to 0
       // continue;  //and continue with the show
   } 
  else{    //
          offCount+=1;//increment the "Off" Counter
                 if(offCount>=offThreshold){ //if the "Off" Counter reaches the "Off" Threshold
                            vol-=offIncrement; //decrease the volume\
                             offCount = 0;       //and set the "Off" Counter to 0
                                            }
                 else{                         //if the "Off" Counter hasn't reached the 
                                               //decrement threshold yet
                     // continue;                //continue with the show
                 }                      
   }
   sineG.setAmp(vol);//set the amplitude of the sine wave synth to the new volume
   sineC.setAmp(vol);
   sineF.setAmp(vol);
   sineB.setAmp(off);
 }   }
 
 else if(closeCount ==4){
if(average<=36){
       offCount=0;//set the "Off" Counter to Zero
      if(vol>=volMax){    //if the volume is maxxed out
                onCount = 0; //set the On counter to 0
                     }
       else{
                onCount+=1;//increment the "On" Counter
                      if(onCount>=onThreshold){  //if the "On" Counter reaches the "On" Threshold
                               vol+=onIncrement; //increase the volume
                               onCount = 0;        //set the "On" Counter to 0
                                              }}
          sineG.setAmp(vol);//set the amplitude of the sine wave synth to the new volume
          sineC.setAmp(vol);
          sineF.setAmp(vol);
          sineB.setAmp(vol);  
      }
else{               
   onCount=0;
  if(vol<=volMin){//if the volume is minned out
        offCount = 0;//set the "Off" counter to 0
   } 
  else{
          offCount+=1;//increment the "Off" Counter
                 if(offCount>=offThreshold){ //if the "Off" Counter reaches the "Off" Threshold
                            vol-=offIncrement; //decrease the volume\
                             offCount = 0;       //and set the "Off" Counter to 0
                                            }
                 else{                         //if the "Off" Counter hasn't reached the 
                                               //decrement threshold yet
                     // continue;                //continue with the show
                 }                      
   }
   sineG.setAmp(vol);//set the amplitude of the sine wave synth to the new volume
   sineC.setAmp(vol);
   sineF.setAmp(vol);
   sineB.setAmp(vol);
   
   
 }   
 
 //if all the notes have played through once, increase the loop count
// if (closeCount){
 //loopCount+=1;
 //}
 }
 }
 println("close count = " + closeCount);//,indent,80);
  println("far count = " + farCount);//,indent,120); 
  println("loopCount =" + loopCount);//
 
 int diff=200;
 int division=100;

  for (int i=0;i<width;i+=division) {
    for (int j=0;j<height;j+=division) {
      strokeWeight(100);
      stroke(random(i-diff, j-diff), random(i-diff, j-diff), random(i-diff, j-diff));
      beginShape();
      vertex(i, j);
      vertex(i+100, average);
      endShape();
    }
  }
  delay(40);
}

