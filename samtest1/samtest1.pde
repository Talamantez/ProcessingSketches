import processing.serial.*;

/**
 * Shape Primitives. 
 * 
 * The basic shape primitive functions are triangle(),
 * rect(), quad(), and ellipse(). Squares are made
 * with rect() and circles are made with
 * ellipse(). Each of these functions requires a number
 * of parameters to determine the shape's position and size. 
 */
 /*
size(200, 200);
smooth(); 
background(0);
noStroke();
fill(226);
triangle(10, 10, 10, 200, 45, 200);
rect(45, 45, 35, 35);
quad(105, 10, 120, 10, 120, 200, 80, 200);
ellipse(140, 80, 40, 40);
triangle(160, 10, 195, 200, 160, 200); 
*/


int actual_now = 0;
int[] x = new int[10];
int current = 0;


void setup(){
  
 size(400, 400);
  smooth(); 
  background(0);
  noStroke();
  fill(226);
  while (current < 10){
    x[current] = current * 10;
    current = (current+1);
  }
}

void draw(){
    
    actual_now = (actual_now+1); 
    ellipse(140, 80, x[actual_now], 40);
    delay(1000);
}
/*

*/
