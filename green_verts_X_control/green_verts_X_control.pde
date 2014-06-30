

void setup() {
  size(1200, 800);
  background(0);
  smooth();
}



void draw() {

  int x= mouseX;
  //  for (int i=10;i>0;i++){
  background(0);
  drawVerts();
  //    i=x;
  delay(x);
}


void drawVerts() {
  strokeCap(ROUND);
  for (int i=0;i<width;i+=60) {
    line(i, 40, i, height-40);
    strokeWeight(random(1, 30));
    stroke(32, 137, random(0, 85));
  }
}

