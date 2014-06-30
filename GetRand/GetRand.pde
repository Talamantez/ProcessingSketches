/*set a 0/1 randomized variable to control multiple states
 of a range of functions.
 
 every option has two states - I need to wrap a global alternator
 that defines the state for the active function when the 
 function switches to something different.
 
 
 */
Rectangle outerRect;
int state=1;
float rand;

class Rectangle{
  
  float w;
  float h;
  color clr;
  
 Rectangle(float tempW, float tempH, color tempClr){
   w=tempW;
   h=tempH;
   clr=tempClr;
 }
  void display(){
    
      rectMode(CENTER);
      strokeWeight(0);
      fill(clr);
      rect (width/2,height/2,w,h);
  }
}



void getRand() {  
  rand=random(1);
  if (rand<.5) {
    rand=0;
  }
  else if (rand>.5) {
    rand=1;
  }
  println(rand);
  println("ran state control");
}

void mousePressed() {
  getRand();
}

void setup() {

  size(300, 400);
}
void draw() {
  println(rand);
  outerRect = new Rectangle(100,rand*100,color (#123456));
  outerRect.display();
  
}
//if (state!=state){

