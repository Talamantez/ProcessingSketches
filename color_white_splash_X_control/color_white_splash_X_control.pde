void setup() {
  size(1200, 800);
  background(0);
  //smooth();
}
void draw() {
  for (int i=0;i<width;i+=25) {
    for (int j=0;j<height;j+=25) {
      strokeWeight(20);
      stroke(random(i-400, j-400), random(i-400, j-400), random(i-400, j-400));
      beginShape();
      vertex(i, j);
      vertex(i+100, mouseX);
      endShape();
    }
  }
}

