Car myCar,myCar2;


class Car {
  
  color c;
  float xpos,ypos,xspeed;
  
  Car(color tempC, float tempXpos, float tempYpos, float tempXspeed){
    c=tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
  }
     void display(){
       rectMode(CENTER);
       fill(c);
       rect(xpos,ypos,20,10);
      }
  
        void drive() {
           xpos = xpos +xspeed;
           if (xpos>width) {
             xpos = 0;
           }
        }
}

void setup(){
  myCar = new Car(color(random(0,30),random(0,30),random(200,255)),0,45,3);
  myCar2 = new Car(color(0,0,255),0,25,1);
}

void draw() {
  background(255);
  
myCar.drive();
 myCar.display();
  myCar2.drive();
  myCar2.display();
}



