float x = 33;
float numFrames = 50;

void setup() {
  size(1200, 800);
  background(0);
}
void draw() {
  frameCount=0;
  smooth();
  for (int i=0;i<width;i+=25) {
    for (int j=0;j<height;j+=25) {
      strokeWeight(20);
      stroke(random(0,255),random(0,255),random(0,255));
      beginShape();
      vertex(mouseX,mouseY);
      vertex(i-mouseX,j-mouseY);      
  
      endShape();
      
      if (frameCount<=numFrames){
        saveFrame("center_spray-####.tif");
      }
    frameCount++;    
      
    
  }}}

