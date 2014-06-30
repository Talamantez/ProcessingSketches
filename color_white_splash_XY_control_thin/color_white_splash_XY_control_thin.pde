void setup() {
  size(1200, 800);
  background(0);
 // smooth();
}
void draw() {
  for (int i=0;i<width;i+=width/100) {
    for (int j=0;j<height;j+=height/100) {
      strokeWeight(5);
      stroke(random(i-400, j-400), random(i-400, j-400), random(i-400, j-400));
      beginShape();
      vertex(i, j);
      vertex(i+100, mouseX);
      vertex(i+15,mouseY);
      endShape();  
  }
  }
}

