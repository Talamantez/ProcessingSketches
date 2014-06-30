int x=100;
int y=100;
int r,g,b;
int bg;

int[] tri1_coords = {0,0};
int[] tri2_coords = {1,0};
int[] tri3_coords = {2,0};
int[] tri4_coords = {3,0};
int[] circ_pos_coords = {0,1};
int[] circ_neg_coords = {1,1};
int[] rect_pos_coords = {2,1};
int[] rect_neg_coords = {3,1};


void setup() {
  size(400,400);
}

void draw() {
  
  background(bg);
  stroke(100,100,100);

  for (int i=0; i<tri1_coords.length; i+=2){
  fill(0,0,0);
  rect(tri1_coords[i]*x,tri1_coords[i+1]*y,x,y);
  fill(255,0,0);
  triangle(tri1_coords[i]*x,tri1_coords[i+1]*y+y,tri1_coords[i]*x,tri1_coords[i+1]*y,tri1_coords[i]*x+x,tri1_coords[i+1]*y);
}
  for (int i=0; i<tri2_coords.length; i+=2)  {
  fill(0,0,0);
  rect(tri2_coords[i]*x,tri2_coords[i+1]*y,x,y);
  fill(255,0,0);
  triangle(tri2_coords[i]*x,tri2_coords[i+1]*y,tri2_coords[i]*x+x,tri2_coords[i+1]*y,tri2_coords[i]*x+x,tri2_coords[i+1]*y+y);
  }
   
  for (int i=0;i<tri3_coords.length;i+=2) {
  fill(0,0,0);
  rect(tri3_coords[i]*x,tri3_coords[i+1]*y,x,y);
  fill(255,0,0);
  triangle(tri3_coords[i]*x,tri3_coords[i+1]*y+y,tri3_coords[i]*x+x,tri3_coords[i+1]*y,tri3_coords[i]*x+x,tri3_coords[i+1]*y+y);
   }
   
  for(int i=0;i<tri4_coords.length;i+=2) {
  fill(0,0,0);
  rect(tri4_coords[i]*x,tri4_coords[i+1]*y,x,y);
  fill(255,0,0);
  triangle(tri4_coords[i]*x,tri4_coords[i+1]*y,tri4_coords[i]*x,tri4_coords[i+1]*y+y,tri4_coords[i]*x+x,tri4_coords[i+1]*y+y);
}
  
  for(int i=0;i<circ_pos_coords.length;i+=2){
  fill(0,0,0);
  rect(circ_pos_coords[i]*x, circ_pos_coords[i+1]*y,x,y);
  fill(255,0,0);
  ellipseMode(CORNER);
  ellipse(circ_pos_coords[i]*x, circ_pos_coords[i+1]*y,x,y);
}

  for(int i=0;i<circ_neg_coords.length;i+=2){
    fill(255,0,0);
    rect(circ_neg_coords[i]*x,circ_neg_coords[i+1]*y,x,y);
    fill(0,0,0);
    ellipse(circ_neg_coords[i]*x,circ_neg_coords[i+1]*y,x,y);
}

  for(int i=0;i<rect_pos_coords.length;i+=2){
    fill(255,0,0);
    rect(rect_pos_coords[i]*x,rect_pos_coords[i+1]*y,x,y);
}
 
  for(int i=0;i<rect_neg_coords.length;i+=2){
    fill(0,0,0);
    rect(rect_neg_coords[i]*x,rect_neg_coords[i+1]*y,x,y);
}
}
