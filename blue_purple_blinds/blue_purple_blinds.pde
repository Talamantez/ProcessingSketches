void setup(){
  size(800,600);
  
}

void draw(){
smooth();
colorMode(HSB);
for (int i=0;i<width;i++){
  for (int j=0;j<height;j++){
    float newHue = sqrt(i*j);
    newHue = map(newHue, 0,width,150,200);
    stroke(newHue, j*2.5, i*2.5);
    point(i,j);
  }
  for(int j=0;j<height;j+=20){
    strokeWeight(5);
    stroke(0);
    fill(158,j,i);
    //strokeWeight(5);
    point(i,j);
     }
   }
 }


