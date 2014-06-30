void setup(){
size(1000,2000);
background(0);
  for (int j=0;j<height;j+=height/5){
   smooth();
}

void draw(){
for (int i=0;i<width;i+=width/5){

  stroke(i,j/5,0);  
  strokeWeight(j/5);
  noFill();
  ellipse(i,j,width-i,width-j);
  }
}
}
