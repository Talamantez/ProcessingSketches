int x=200;
int y=200;

int[] tri1_coords = {3,3
};
int[] tri2_coords = {3,0
};
int[] tri3_coords = {0,0
};
int[] tri4_coords = {0,3
};
int[] circ_pos_coords = {
    2, 0,        3,1,   0,2,       2,2,   1,3
};
int[] circ_neg_coords = {1,0,      0,1,    2,1,    1,2,   3,2,      2,3

};
int[] rect_pos_coords = {
  1,1,   2,2
};
int[] rect_neg_coords = {
  1,2,  2,1   
};


void setup() {
  size(800, 800);
  background(random(0,255),random(0,255),random(0,255));
  smooth();
  
  //stroke(100,100,100);
  noStroke();

  for (int i=0; i<tri1_coords.length; i+=2) {
    fill(0, 0, 0);
    rect(tri1_coords[i]*x, tri1_coords[i+1]*y, x, y);
    fill(255, 0, 0);
    triangle(tri1_coords[i]*x, tri1_coords[i+1]*y+y, tri1_coords[i]*x, tri1_coords[i+1]*y, tri1_coords[i]*x+x, tri1_coords[i+1]*y);
  }
  for (int i=0; i<tri2_coords.length; i+=2) {
    fill(0, 0, 0);
    rect(tri2_coords[i]*x, tri2_coords[i+1]*y, x, y);
    fill(255, 0, 0);
    triangle(tri2_coords[i]*x, tri2_coords[i+1]*y, tri2_coords[i]*x+x, tri2_coords[i+1]*y, tri2_coords[i]*x+x, tri2_coords[i+1]*y+y);
  }

  for (int i=0;i<tri3_coords.length;i+=2) {
    fill(0, 0, 0);
    rect(tri3_coords[i]*x, tri3_coords[i+1]*y, x, y);
    fill(255, 0, 0);
    triangle(tri3_coords[i]*x, tri3_coords[i+1]*y+y, tri3_coords[i]*x+x, tri3_coords[i+1]*y, tri3_coords[i]*x+x, tri3_coords[i+1]*y+y);
  }

  for (int i=0;i<tri4_coords.length;i+=2) {
    fill(0, 0, 0);
    rect(tri4_coords[i]*x, tri4_coords[i+1]*y, x, y);
    fill(255, 0, 0);
    triangle(tri4_coords[i]*x, tri4_coords[i+1]*y, tri4_coords[i]*x, tri4_coords[i+1]*y+y, tri4_coords[i]*x+x, tri4_coords[i+1]*y+y);
  }

  for (int i=0;i<circ_pos_coords.length;i+=2) {
    fill(0, 0, 0);
    rect(circ_pos_coords[i]*x, circ_pos_coords[i+1]*y, x, y);
    fill(255, 0, 0);
    ellipseMode(CORNER);
    ellipse(circ_pos_coords[i]*x+10, circ_pos_coords[i+1]*y+10, x-20, y-20);
  }

  for (int i=0;i<circ_neg_coords.length;i+=2) {
    fill(255, 0, 0);
    rect(circ_neg_coords[i]*x, circ_neg_coords[i+1]*y, x, y);
    fill(0, 0, 0);
    ellipseMode(CORNER);
    ellipse(circ_neg_coords[i]*x+10, circ_neg_coords[i+1]*y+10, x-20, y-20);
  }

  for (int i=0;i<rect_pos_coords.length;i+=2) {
    fill(255, 0, 0);
    rect(rect_pos_coords[i]*x, rect_pos_coords[i+1]*y, x, y);
  }

  for (int i=0;i<rect_neg_coords.length;i+=2) {
    fill(0, 0, 0);
    rect(rect_neg_coords[i]*x, rect_neg_coords[i+1]*y, x, y);
  }
 
  
}

void draw() {

}

