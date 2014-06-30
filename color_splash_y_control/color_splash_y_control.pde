void setup() {
  size(1200, 800);
  background(0);
}
void draw() {
  smooth();
  for (int i=0;i<width;i+=25) {
    for (int j=0;j<height;j+=25) {
      strokeWeight(20);
      stroke(random(i-400, j-400), random(i-400, j-400), random(i-400, j-400));
      beginShape();
      vertex(i, j);
      vertex(i-10, mouseY);
      endShape();
    }
  }
}

