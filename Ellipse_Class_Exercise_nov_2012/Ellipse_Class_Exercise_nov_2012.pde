C c1,c2,c3,c4;


void setup(){
  smooth();
  size(300,400);
  background(0);
  //c = new C(radius, hue, x position, y position)
  c1 = new C(100, 150, 100, 150);
  c2 = new C(60, 217, 100, 200);
}

void draw(){
  c1.d();
  c2.d();
  //mv(float x, float y, float dmp);
  c1.mv(mouseX, mouseY, 100);
  c2.mv(width-mouseX,height-mouseY, 100);
}

void mousePressed(){
  background(0);
}
