void setup() {
  size(500, 800);
  background(255);
}
void draw() {
  colorMode(HSB, 360, 100, 100);
  for (int i=0;i<width;i+=20) {
    for (int j=0;j<height;j+=5) {

      float newHue=sqrt(i*j);
      float newBright=i+100;
      float newCont=100;
      strokeWeight(4);
      stroke(newHue, newCont, newBright);
      
      line(i,j,width,j);
    }
  }
}

