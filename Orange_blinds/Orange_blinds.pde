void setup(){
  size(600,500);
  
}

void draw(){
smooth();
colorMode(HSB);
for (int i=0;i<width;i++){
  for (int j=0;j<height;j++){
    stroke(23, j*2.5, i*2.5);
    point(i,j);
  }
  for(int j=0;j<height;j+=20){
    strokeWeight(2);
    stroke(0);
    fill(158,j,i);
    //strokeWeight(5);
    point(i,j);
 }
}

}


