void setup(){
size(300,400);
}
void draw(){
for(int i=0;i<width;i++){
  for(int j=0;j<height;j++)
      colorMode(HSB,360,100,100);
      float newHue=i*.5;
      float
      stroke(newHue,100,100);
      
      line(i,0,i,height);

}}
