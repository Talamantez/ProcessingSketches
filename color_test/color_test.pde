void setup()

{
  size(250,300);
  
  noStroke();
  
  int low,high;
  
  low = 5;
  
  high = 250;
  
  float r,g,b;





  
  r=random(0,255); 
       while (r>low && r<high)
       {
           r=random(0,255);
         }
  println (r);
  
  g=random(0,255);
       while (g>low && g<high)
           {g=random(0,255);}
  println (g);         
           
  b=random(0,255);
       while (b>low && b<high)
           {b=random(0,255);}
  println (b);
  
  
  fill(r,g,b);
  rect(0,0,width/2,height);
  
  fill(255-r,255-g,255-b);
  rect(width/2,0,width,height);
}

void r()
{random(0,255);}


void draw()

{
}

