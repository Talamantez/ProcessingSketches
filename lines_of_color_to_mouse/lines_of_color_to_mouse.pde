float x,y;
float targetX,targetY;
float easing=.009;

void setup(){size(screenWidth,screenHeight);smooth();
}
void draw(){  for (int i=0;i<width;i+=20){
    for(int j=0;j<height;j+=20){
      targetX = mouseX;
  float dx = targetX - x;
  if(abs(dx) > 1) {
    x += dx * easing;
  }
    targetY = mouseY;
  float dy = targetY - y;
  if(abs(dy) > 1) {
    y += dy * easing;
  }
     
      strokeWeight(random(1,20));
      stroke(random(0,255),random(0,255),random(0,255));
      
      line(i,j,x,y);
      

}}}
