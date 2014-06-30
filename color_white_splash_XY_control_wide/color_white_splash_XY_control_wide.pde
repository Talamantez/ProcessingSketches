void setup() {
  size(1200, 800);
  background(0);
 // smooth();
}
void draw() {
  for (int i=0;i<width;i+=width/10) {
    for (int j=0;j<height;j+=height/10) {
      strokeWeight(100);
      stroke(random(i-400, j-400), random(i-400, j-400), random(i-400, j-400));
      beginShape();
      vertex(i, j);
      vertex(i, mouseX);
      vertex(mouseX,mouseY);
      endShape();  
  }
  }
}

