  Thing myThing;
  Thing yourThing;

void setup(){
  myThing= new Thing();
  yourThing= new Thing();
}
void draw(){
  myThing.display();
  yourThing.display();
}

class Thing{
    
      color c;
      float xpos;
      float ypos;
      float diameter;

Thing() {
  c=color(168);
  xpos=width/2;
  ypos=height/2;
  diameter=4.0;
}


void display(){
 smooth();
 ellipse(xpos,ypos,diameter,diameter);
}

}
