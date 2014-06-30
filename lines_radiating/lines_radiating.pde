int b;

void setup() {
  b=255;
  size(800,600);
  background(b);
}

void draw() {
  for (int i=0;i<width;i+=30)
  {
    delay(0);
    for(int j=0;j<height;j+=30) {
      stroke(random(0,255),random(0,255),random(0,255));
      strokeWeight(random(15,40));
      line(i,j,mouseX,mouseY);
    }
  }
}

