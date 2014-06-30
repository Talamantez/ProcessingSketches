
int speed=0;
void setup(){size(800,600);background(255);smooth();stroke(0);
strokeWeight(1);
noFill();}


void draw(){
  
  explode();
 
  
  
      
    }
    
    
void explode(){
for(int i=width/2;i<width;i+=speed){
              for(int j=height/2;j<height;j+=speed){
                 // fill(random(0,255));
                  ellipse(i,j,5,5);
                     speed++;}}
        for(int i=width/2;i>0;i-=speed){
              for(int j=height/2;j>0;j-=speed){
                 // fill(random(40,j),200);
                  ellipse(i,j,5+speed,5+speed);
                delay(2);  
                speed++;                  }}
                  }
