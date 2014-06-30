int x=100;
int y=100;
int r,g,b;
int bg;
int[] coordinates = {0,0,   3,0,   3,3}; // remember it starts at 0,0 ;-)
void setup() {
  size(1000,1000);
}

void draw() {
  
  background(bg);
  fill(255,0,0);

  // this adds a blinking cursor after your text, at the expense of redrawing everything every frame

  noFill();
  noStroke();
//  for (int i=0; i<width/x; i++) { 
//    for (int j=0; j<height/y; j++) {fill(random(0,255),random(0,255),random(0,255),random(200,255));
//      delay(2);
//      r = int(random(6));
//      if (r==0) {
//      rect(i*x,j*y,x,y);
//      fill(random(0,255),random(0,255),random(0,255),random(200,255)); 
//      ellipseMode(CORNER);
//      ellipse(i*x,j*y,x,y);
//      }
//      if (r==1){
//      triangle(i*x,j*y,i*x+x,j*y,i*x,j*y+y);
//      }
//      if (r==2){
//      triangle(i*x,j*y,i*x+x,j*y+y,i*x,j*y+y);
//      }
//      if (r==3){
//      triangle(i*x,j*y,i*x+x,j*y,i*x+x,j*y+y);
//      }
//      if(r==4){
//      triangle(i*x,j*y+y,i*x+x,j*y,i*x+x,j*y+y);
//      }
//      if (r==5){
//      rect(i*x,i*y,x,y);
//      }
   
//}}
  
  for (int i=0; i<coordinates.length; i+=2)  {
    fill(random(0,255),random(0,255),random(0,255));
    
     
   // rect (coordinates[i]*x,coordinates[i+1]*y,x,y);
    triangle(coordinates[i]*x,coordinates[i]*y,coordinates[i]*x+x,coordinates[i]*y,coordinates[i]*x+x,coordinates[i]*y+y);
  }
  delay(200);


}


