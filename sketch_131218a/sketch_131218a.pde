import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

AudioOutput out;//audio output
SineWave sineG;//audio G sine wave
//sineG.setAmp(vol);
Minim minim;//minim session

void setup(){
minim = new Minim(this);
out = minim.getLineOut(Minim.STEREO);
sineG = new SineWave(196.00, 25, 144000);//1st sine wave - frequency between G and an A
sineG.portamento(200);
}
