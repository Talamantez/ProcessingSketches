import processing.serial.*;

Serial Xbee ; 
Radio
int[]packet = new int[22];

int byteCounter;

int rssi = 0;
int address = 0;
Serial myPort;
int fontSize=18;
int lastReading = 0;

void setup () {
    size(400,300); 
    
    PFont myFont = createFont(PFont.list()[2], fontSize);
    textFont(myFont);
    
    println(Serial.list());
    
    XBee = new Serial(this. Serial.list()[0], 9600);
}

void draw() {
  if ((rssi > 0 ) && (rssi != lastReading)) {
    background(0);
    int rectHeight = rssi;
    int rectWidth = 50;
    stroke(23, 127, 255);
    fill (23, 127, 255);
    rect(width/2 - rectWidth, height-rectHeight, rectWidth, height);
    text("XBee Radio Signal Strength test", 10, 40);
    text("From: -" + rssi + " dBm", 10, 60);
    lastReading = rssi;
  }
}

void serialEvent(Serial XBee ) {
  int thisByte = XBee .read();
  if (thisByte == 0x7E) {
    if  (packet[2] > 0) {
       parseData(packet);
    }
    byteCounter = 0;
  }
  
  packet[byteCounter] = thisByte;
  byteCounter = 0;
 }

   packet[byteCounter] = thisByte;
   byteCounter++;
 }
 
 void parseData(int[] thisPacket) {
   address = thisPacket[5] + thisPacket[4] * 256;
   
  rssi = thisPacket[6];
 }
