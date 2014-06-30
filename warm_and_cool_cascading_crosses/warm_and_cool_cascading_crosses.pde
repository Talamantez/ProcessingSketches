void setup(){size(300,300);}
void draw(){smooth();
makeBlast();
delay(100);
}

void mousePressed(){
//makeBlast();
background(mouseX,random(255),random(255));
delay(20);
}

void mouseMoved(){
//background(mouseX,random(255),random(255));

}

void makeBlast(){stroke(random(255));strokeWeight(random(30));
for(int i=0;i<30;i++){
 // background(random(0,100),random(0,100),random(0,100));
pushMatrix();
translate(width/2+50,map(mouseY,0,300,-150,500));
rotate(45+i+mouseX);

line(width/2,height/2,width/2,0);

stroke(mouseY,random(255),random(255));strokeWeight(random(30));line(width/2,height/2,width,height/2);
stroke(mouseY,random(255),random(255));strokeWeight(random(30));line(width/2,height/2,width/2,height);
stroke(mouseY,random(255),random(255));strokeWeight(random(30));line(width/2,height/2,0,height/2);
popMatrix();

//stroke(mouseY,random(255),random(255));strokeWeight(random(30));line(width/2,height/2,width/2,0);
//stroke(random(255),random(255),random(255));strokeWeight(random(30));line(width/2,height/2,width,height/2);
//stroke(random(255),random(255),random(255));strokeWeight(random(30));line(width/2,height/2,width/2,height);
//stroke(random(255),random(255),random(255));strokeWeight(random(30));line(width/2,height/2,0,height/2);
}

//line(width/2,height/2,width/8,height-20);
//line(width/2,height/2,width/6,height-20);
//
//line(width/2,height/2,width/4,height-20);
//
//line(width/2,height/2,width/2,height-20);
//
//line(width/2,height/2,width/2+width/8,height-(height-20));
//
//line(width/2,height/2,width/2+width/6,height-20);
//
//line(width/2,height/2,width/2+width/4,height-20);
//
//line(width/2,height/2,width/2+width/2,height-20);
}
