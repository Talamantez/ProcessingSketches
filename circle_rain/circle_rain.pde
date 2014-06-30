float xPos=0;
float yPos=0;

int h=40;
int w=40;


int incr=0;

int r=110-2*incr;
int g=200-2*incr;
int b=130-2*incr;


void setup() {
  background(80,95,110);
  size(500,500); 
  smooth();
}
void draw() {

  background(80,95,110);
  noStroke();

  //  for(int i=0;i<100;i++){
  fill(r+incr,g+incr,b+incr); 
  xPos=xPos+w;
  println(xPos);
  yPos=yPos+h;
  println(yPos);
  makeEllipses();
  delay(30);

  if(xPos+w>=width) {
    xPos=random(-100,700);
    yPos=random(-100,700);
  }
}
//  println(i);
// }

// for(int i=0;i<100;i++){
//  fill(r+incr,g+incr,b+incr);
//  ellipse(xPos,yPos, h,w);
//  makeEllipses();
//  xPos=xPos-1;
//  yPos=yPos-1;
//  delay(100);
// }
// 




void makeEllipses() {
  ellipse(xPos,yPos, h,w);
  ellipse(xPos+w,yPos,h,w);
  ellipse(xPos,yPos+h,h,w);
  ellipse(xPos-w,yPos,h,w);
  ellipse(xPos,yPos-h,h,w);
}

