import processing.serial.*;

Serial myPort;  //the serial port
int graphXPos = 1; //the horizontal position of the graph
int val;
int current = 0;
int last = 0;
int birdCount = 200;
Bird[]birds = new Bird[birdCount];
float[]x = new float[birdCount];
float[]y = new float[birdCount];
float[]z = new float[birdCount];
float[]rx = new float[birdCount];
float[]ry = new float[birdCount];
float[]rz = new float[birdCount];
float[]spd = new float[birdCount];
float[]rot = new float[birdCount];


void setup () {
     size(640, 360, P3D);
  noStroke();   //window size
     
     //list all the available serial ports
     println(Serial.list());
     myPort = new Serial(this, "COM3", 9600);
      
     background(150,200,5);
     for (int i = 0; i < birdCount; i++){
    birds[i] = new Bird(random(-300, 300), random(-300, 300), 
               random(-500, -2500), random(5, 30), random(5, 30)); 

    x[i] = random(2, 340);
    y[i] = random(3, 350);
    z[i] = random(100, 9000);
    rx[i] = random(-10, 2);
    ry[i] = random(-5, 55);
    rz[i] = random(-20, 20);
    spd[i] = random(.1, 3.75);
    rot[i] = random(.025*20, 20*.15);
  }
}
}


void draw() {
  background(0);
  lights();
  for (int i = 0; i < birdCount; i++){
    birds[i].setFlight(x[i], y[i], z[i], rx[i], ry[i], rz[i]);
    birds[i].setWingSpeed(spd[i/4]);
    birds[i].setRotSpeed(rot[i/4]);
    birds[i].fly();
  }
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
  



