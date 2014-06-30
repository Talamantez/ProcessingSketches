

void setup() {
  size(1200,800);
  background(0);
    smooth();
  
  strokeCap(ROUND);
  for(int i=0;i<width;i+=60){
      line(i,40,i,height-40);
      strokeWeight(random(1,30));
      stroke(32,137,random(0,85));
}

}

void draw() {

}

