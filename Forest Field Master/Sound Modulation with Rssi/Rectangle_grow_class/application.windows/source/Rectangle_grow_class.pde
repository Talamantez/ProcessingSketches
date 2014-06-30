Rbox myRbox;
Rbox randomRbox;
float r=random(0,255);
float g=random(0,255);
float b=random(0,255);


class Rbox {
float r=random(0,255);
float g=random(0,255);
float b=random(0,255);
  color c;
  float w;
  float h;
  float x_start;
  float y_start;
  float x_grow_rate;
  float y_grow_rate;
  int d;


  
  Rbox(
  color tempC, 
  float tempW, float tempH, 
  float tempX_start, float tempY_start, float tempX_grow_rate, float tempY_grow_rate, int tempD) {
    c= tempC;
    w=tempW;
    h=tempH;
    x_start=tempX_start;
    y_start=tempY_start;
    x_grow_rate=tempX_grow_rate;
    y_grow_rate=tempY_grow_rate;
    d=tempD;
    
  }    
  void display() {
  
    rectMode(CENTER);
    rect(x_start, y_start, w, h);
    fill(r,g,b);
    stroke(b,g,r);
    strokeWeight(random(2,30));
     
}

  void grow() {
    w*=x_grow_rate;
    h*=y_grow_rate;
    delay(d);
    if (w>width) {
      w=4;
      h=4;
      x_start=random(0, width);
      y_start=random(0,height);
    }
    if (h>height) {
      w=3;
      h=3;
    }
  }
}      

void setup() {
  size(500, 500);
   background(255-r, 255-g, 255-b);
 //fill(r,g,b);
  randomRbox = new Rbox(color(r, g, b), random(0, 30), random(0, 30), random(0, width), random(0, height), random(1, 20), random(1, 20), 5);

  //       Rbox(
  //  color tempC,
  //  float tempW, float tempH, 
  //  float tempX_start,float tempY_start, float tempX_grow_rate,float tempY_grow_rate, int tempD)
  myRbox = new Rbox(color(r, g, b), 40, 40, width/2, height/2, 2, 2, 50);
}

void draw() {
  




  myRbox.display();
  myRbox.grow();
  randomRbox.display();
  randomRbox.grow();
}

