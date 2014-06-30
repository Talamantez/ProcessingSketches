Bubble bigBubble;
Bubble smallBubble;
Bubble giantBubble;
Bubble randomBubble;

int r;
int g;
int b;


class Bubble{

  color c;
  float xpos;
  float ypos;

  float xwide;
  float yhigh;
  float bouyancy;
  float drift;
  
  Bubble(color tempC, float tempXpos, float tempYpos, float tempXwide, float tempYhigh, 
         float tempBouyancy, float tempDrift){
    c=tempC;
    xpos = tempXpos;
    ypos = tempYpos;
  
    xwide = tempXwide;
    yhigh = tempYhigh;
    bouyancy = tempBouyancy;
    drift = tempDrift;
  }
  
  
      void display(){
        
       ellipseMode(CENTER);
       fill(c);
       ellipse(xpos,ypos,xwide,yhigh);
      }
      
      
      void floating(){
        
        xpos = xpos + drift;
           if (xpos > width) {
               drift = -drift;
           }                
          if (xpos < 0) {
               drift = -drift;
           }     
        
        ypos = ypos + bouyancy;
           if (ypos < 0 ){
               bouyancy = -bouyancy;
           }   
           
           if (ypos > height ){
               bouyancy = -bouyancy;
           }   
      }
}     
        
 void setup() {
   size(100,400);
  
   pushMatrix();
     bigBubble = new Bubble(color(75,32,200), 25, height,20,20,-3,random(-3,3));
     smallBubble = new Bubble(color(24,200,16),60,height,5,5,-4,random(-2,-1));
     giantBubble = new Bubble(color(255,30,40),70, height,40,40,-2,random(-3,2));
     randomBubble = new Bubble(color(random(0,255),random(0,255),random(0,255)), random(0,width),random(0,height), random(1,60),random(1,60),random(-4,4), random(-10,10));
 }
 
 void draw() {
   background(64,95,255);
   bigBubble.display();
   bigBubble.floating();
  // pushMatrix();
 //  translate(50,60);
   smallBubble.display();
   smallBubble.floating();
   
   giantBubble.display();
   giantBubble.floating();
 //  popMatrix();
    randomBubble.display();
    randomBubble.floating();
 }
