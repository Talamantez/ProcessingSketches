
//declare your rectangles--only way to do it
Rectangle outerRect;
Rectangle midRect;
Rectangle innerRect;
int outerRectWidth = 200;
int outerRectHeight = 200;
int midRectWidth = 100;
int midRectHeight = 100;
int innerRectWidth = 50;
int innerRectHeight = 50;
//define class Rectangle
class Rectangle{
  
  float w;
  float h;
  
 Rectangle(float temporaryW, float temporaryH){
   w=temporaryW;
   h=temporaryH;
 }
  
  
//define Display function  
  void display(){
    
      rectMode(CENTER);
      
      stroke (255,30,20);
      strokeWeight(20);
      noFill();
      rect (width/2,height/2,w,h);
  }
}

//Set up the sketch
void setup(){
   size(400,400);
   outerRect = new Rectangle (outerRectWidth,outerRectHeight);
   midRect = new Rectangle (midRectWidth,midRectHeight);
   innerRect = new Rectangle (innerRectWidth,innerRectHeight);
   
}

//main loop
void draw(){
 
  background(0,225, 235);
  
  innerRect.display();
  midRect.display();
  outerRect.display();

}


