void setup() {
  size(1000,800);
  background(0);
  smooth();
}
void draw() {
  for(int i=width;i>0;i-=100){
    for(int j=0;j<height;j+=25){
         strokeWeight(random(0,255));
         stroke(random(0,255),random(0,255),random(0,255),random(0,255));
        // line(i, mouseX, mouseX,mouseY);
         beginShape();
vertex(mouseX, mouseY);
vertex(mouseX+30, mouseY+30);
vertex(mouseX+20,mouseY+20);
vertex(mouseX-100,mouseY-10);
endShape();
}}}

