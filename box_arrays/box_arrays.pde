void setup() {
  size(400,300);
  background(255);
  smooth();
}
void draw() {
  for (int i=10;i<width-10;i+=10) {
    for(int j=10;j<height-10;j+=10) {
      stroke(random(0,255));
      noFill();
      rect(i,j,5,5);
      if(mousePressed==true)background(0);
      if(mousePressed==false)background(255);
    }

    for (int h=50;h<width-50;h+=10) {
      for(int k=50;k<height-50;k+=10) {
        stroke(random(0,255));
        fill(random(0,255));
        rect(h,k,random(5),random(5));
      }

      for (int l=100;l<width-100;l+=10) {
        for(int m=100;m<height-100;m+=10) {
          noStroke();
          fill(random(0,255),random(0,255),random(0,255));
          rectMode(CENTER);
          rect(l,m,6,6);
        }}
      }

  
}
}
