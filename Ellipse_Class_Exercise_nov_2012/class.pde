class C
{
  float r; //radius
  float h; //hue
  float x; //x position
  float y; //y position
  
  C(int ir, int ih, float ix, float iy){
    r=ir;
    h=ih;
    x=ix;
    y=iy;
  }
  
  void mv(float X, float Y, float dmp){
    float df=y-Y;
    if (abs(df)>1){
      y-=df/dmp;
      h=(x-dmp);
    }
    df = x-X;
    if (abs(df)>1){
      x-=df/dmp;
    }
    
    
   }
    
void d(){
  strokeWeight(5);
  stroke(h,h-20,h+30);
  noFill();
  ellipse(x,y,r,r);
}
}

