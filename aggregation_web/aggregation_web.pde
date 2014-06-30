/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/80169*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
Aggregation ag;
PImage input, over;
int branchesNum = 2, imageIndex = 1;
float [] [] target;
PImage [] images;
color backgroundColor = color (230/*121, 195, 229*/);
boolean showImage = false;

void setup ()
{
  size (675, 450);
  smooth();

  frameRate (30);

  images = new PImage [2];
  images[0] = loadImage ("bird.jpg");
  images[1] =loadImage ("fuzzy.jpg");
  input = images [imageIndex];
  
  over = createImage (1, 1, RGB);
  for (int i = 0; i < over.pixels.length; i++) over.pixels [i] = backgroundColor;
  over.updatePixels();
  
  initBranches(target, input);
}

void draw ()
{
  background (255);
  ag.draw();
  for (int i = 0; i < 30; i++) doAggregation();
  blend (over, 0, 0, width, height, 0, 0, width, height, MULTIPLY);
  if (showImage) image (input, 10, 10, input.width / 4, input.height / 4);
}


void mousePressed ()
{
  initBranches(target, input);
}



void initBranches (float [] [] target, PImage img)
{
  target = (float[] []) findTargets (branchesNum, img);

  int [] c = new int [target.length];
  float [] r = new float [target.length];
  int index = 0;
  for (int i = 0; i < r.length; i++) 
  {
    r[i] = random (1, 2);

    index = (int) target [i] [1] *img.width + (int) target [i] [0];
    c [i] = img.pixels[index];
  }
  ag = new Aggregation (target, r, c);
}

void keyPressed ()
{
  if (keyCode == KeyEvent.VK_1) 
  {
    branchesNum = 1;
    initBranches(target, input);
  }
  if (keyCode == KeyEvent.VK_2) 
  {
    branchesNum = 2;
    initBranches(target, input);
  }
  if (keyCode == KeyEvent.VK_3) 
  {
    branchesNum = 3;
    initBranches(target, input);
  }
  if (keyCode == KeyEvent.VK_4) 
  {
    branchesNum = 4;
    initBranches(target, input);
  }
  if (keyCode == KeyEvent.VK_5) 
  {
    branchesNum = 5;
    initBranches(target, input);
  }
  if (keyCode == KeyEvent.VK_6) 
  {
    branchesNum = 6;
    initBranches(target, input);
  }
  if (keyCode == KeyEvent.VK_7) 
  {
    branchesNum = 7;
    initBranches(target, input);
  }
  if (keyCode == KeyEvent.VK_8) 
  {
    branchesNum = 8;
    initBranches(target, input);
  }
  if (keyCode == KeyEvent.VK_9) 
  {
    branchesNum = 9;
    initBranches(target, input);
  }
  
  if (keyCode == KeyEvent.VK_I) showImage = !showImage;

  if (keyCode == KeyEvent.VK_SPACE) 
  {
    imageIndex++;
    if (imageIndex > images.length-1) imageIndex = 0;
    input = images [imageIndex];
    initBranches(target, input);
  }
}

