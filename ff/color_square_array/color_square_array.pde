int x=100;
int y=100;
int r,g,b;
int bg;
int[] coordinates = {0,0,0,3,3,0,1,1,3,3,2,2,}; // remember it starts at 0,0 ;-)
void setup() {
  size(400,400);
}

void draw() {
  
  background(bg);
  fill(255,0,0);

  // this adds a blinking cursor after your text, at the expense of redrawing everything every frame

  noFill();
  noStroke();
  for (int i=0; i<width/x; i++) { 
    for (int j=0; j<height/y; j++) {fill(random(0,255),random(0,255),random(0,255));
      delay(20);
      r = int(random(6));
      if (r==0) {  
      ellipseMode(CORNER);
      ellipse(i*x,j*y,x,y);
      }
      if (r==1){
      triangle(i*x,j*y,i*x+x,j*y,i*x,j*y+y);
      }
      if (r==2){
      triangle(i*x,j*y,i*x+x,j*y+y,i*x,j*y+y);
      }
      if (r==3){
      triangle(i*x,j*y,i*x+x,j*y,i*x+x,j*y+y);
      }
      if(r==4){
      triangle(i*x,j*y+y,i*x+x,j*y,i*x+x,j*y+y);
      }
      if (r==5){
      rect(i*x,i*y,x,y);
      }
   
}
  
//  for (int i=0; i<coordinates.length; i+=2)  {
//    fill(random(0,255),random(0,255),random(0,255)); 
//    rect (coordinates[i]*x,coordinates[i+1]*y,x,y);
//  }

}
}


