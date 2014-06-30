
float w=1;
float h=1;


void setup() {
  size(400,600);
  background(255,0,0);
  stroke(0,0,255);
  strokeWeight(10*h);
}

void draw() {
  w*=3;
  h*=3;
fill(255,255,0);

  if (h>width) {
    h=1;
    w=1;
  }
 background(255,0,0);

  rectMode(CENTER); 
  rect(width/2, height/2, w, h);

  delay(250);
}



