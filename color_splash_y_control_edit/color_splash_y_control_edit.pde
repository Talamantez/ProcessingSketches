void setup() {
  size(1200, 800);
  background(0);
}
void draw() {
  smooth();
  for (int i=0;i<width;i+=25) {
    for (int j=0;j<height;j+=25) {
      strokeWeight(20);
      if (i<i+1){
     //link random colors to the shapes - the color range is based on position of the shape
      float a=random(i-400, j-400);
      float b=random(i-400, j-400);
      float c=random(i-400, j-400);
      stroke(a,b,c);
      
      beginShape();
      vertex(i, j);
      vertex(i-10, mouseY);
      endShape();
        }
      else{
     //link random colors to the shapes - the color range is based on position of the shape
      float a=random(width-2*(i-400),height-(j-400));
      float b=random(width-2*(i-400),height-(j-400));
      float c=random(width-2*(i-400),height-(j-400));
      stroke(a,b,c);
      
      beginShape();
      vertex(i, j);
      vertex(i-10, mouseY);
      endShape();
        
    
  
}
    }
  }
}

