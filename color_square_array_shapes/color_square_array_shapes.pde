int x=100;
int y=100;
int r,g,b;
int[] coordinates = {  }; // remember it starts at 0,0 ;-)

int opt;
void setup() {
  size(400,400);
}

void draw() {
  background(255);
  delay(150);  
  noFill();
     noStroke();
   
  for (int i=0; i<coordinates.length; i+=2)   
  for (int i=0; i<width/x; i++) {fill(random(0,255),random(0,255),random(0,255));
    for (int j=0; j<height/y; j++) {fill(random(0,255),random(0,255),random(0,255));
    rect(i*x,j*y,x,y);;
}

void rec(){
   
    rect(coordinates[i]*x,coordinates[i+1]*y,x,y);
       
}
  }
}

void cir(){
    noStroke();
    for (int i=0; i<width/x; i++) {   fill(random(0,255),random(0,255),random(0,255));
    for (int j=0; j<height/y; j++) {   fill(random(0,255),random(0,255),random(0,255));
    rect(i*x,j*y,x,y);
    ellipse(coordinates[i]*x,coordinates[i+1]*y,x,y);
}
  }
}
