import processing.serial.*;
import controlP5.*;

ControlP5 controlP5;
ControlFont font;

Serial serial;
int lf = 10;	// ASCII linefeed

int count=0;//count incoming packets
String fileName="think_1";

int packetCount = 0;
int globalMax;
String scaleMode;

void setup() {
	size(40,40);
	smooth();
	font = new ControlFont(createFont("DIN-MediumAlternate", 12), 12);
	// Create each channel
	serial = new Serial(this, Serial.list()[0], 9600);	
	serial.bufferUntil(10);
	}
	
void draw() {
}
	
void serialEvent(Serial p) {
	String[] incomingValues = split(p.readString(), ',');

	println(incomingValues);
 count+=1;
      
        saveStrings(dataPath("thinkRight_"+count+".txt"), incomingValues);
	// Add the data to the logs
	if (incomingValues.length > 1) {
		packetCount++;
		
		// Wait till the third packet or so to start recording to avoid initialization garbage.
		if(packetCount > 3) {
			for (int i = 0; i < incomingValues.length; i++) {
				int newValue = Integer.parseInt(incomingValues[i].trim());
		
				// Zero the EEG power values if we don't have a signal.
				// Can be useful to leave them in for development.
				if((Integer.parseInt(incomingValues[0]) == 200) && (i > 2)) newValue = 0;		}
		}
		
	}


}
// Extend core's Map function to the Long datatype.
long mapLong(long x, long in_min, long in_max, long out_min, long out_max)  { 
  return (x - in_min) * (out_max - out_min) / (in_max - in_min) + out_min; 
}

long constrainLong(long value, long min_value, long max_value) {
  if(value > max_value) return max_value;
  if(value < min_value) return min_value;
  return value;
}
