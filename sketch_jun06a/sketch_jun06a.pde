
int speed=0;
void setup(){size(400,300);background(255);smooth();}


void draw(){for(int i=width/2;i<width;i+=speed){
              for(int j=height/2;j<height;j+=speed){
                  fill(j);
                  ellipse(i,j,5,5);
                                  }}
        for(int i=width/2;i<width;i+=speed){
              for(int j=height/2;j<height;j+=speed){
                  fill(j);
                  ellipse(i,j,5,5);
                  speed++;                  }}
      
    }
