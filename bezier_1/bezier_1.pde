void setup(){
  size(700,700);
//bezier(x1,y1,cx1,cy1,cx2,cy2,x2,y2)
  bezier(300,50,30,400,600,200,30,60);
  //draw the control points
  line(300,50,30,400);
  ellipse(30,400,30,30);
  line(30,60,600,200);
  ellipse(600,200,30,30);

}
