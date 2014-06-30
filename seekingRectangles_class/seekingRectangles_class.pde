
//declare your rectangles--only way to do it
Rectangle outerRect;
Rectangle midRect;
Rectangle innerRect;
int outerRectWidth = 200;
int outerRectHeight = 200;
int midRectWidth = 100;
int midRectHeight = 100;
int innerRectWidth = 50;
int innerRectHeight = 50;
int midInnerDifferential = 10;
int outerMidDifferential = 200;
//define class Rectangle
class Rectangle {

  float w;
  float h;

  Rectangle(float temporaryW, float temporaryH) {
    w=temporaryW;
    h=temporaryH;
  }


  //define Display function  
  void display() {

    rectMode(CENTER);

    stroke (255, 30, 20);
    strokeWeight(20);
    noFill();
    rect (width/2, height/2, w, h);
  }
}

//Set up the sketch
void setup() {
  size(400, 400);
}

//main loop
void draw() {

  background(0, 225, 235);

  outerRect = new Rectangle (outerRectWidth, outerRectHeight);
  midRect = new Rectangle (outerRectWidth-outerMidDifferential, outerRectHeight-outerMidDifferential);
  if (outerMidDifferential<300) {
    outerMidDifferential+=10;
  }  
  innerRect = new Rectangle (midRectWidth-midInnerDifferential, midRectHeight-midInnerDifferential);
  if (midInnerDifferential<100) {
    midInnerDifferential+=1;
  }
  println(midInnerDifferential);

  innerRect.display();
  midRect.display();
  outerRect.display();
}

