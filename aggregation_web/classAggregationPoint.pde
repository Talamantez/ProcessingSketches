class AggregationPoint
{
  int id, c;
  float x, y, r, sw;
  ArrayList <AggregationPoint> children;

  AggregationPoint (float x, float y, float r, int id, int c, float sw)
  {
    this.c = c;
    this.sw = sw;
    if (sw < 0.25) this.sw = 0.25;
    this.id = id;
    this.x = x;
    this.y = y;
    this.r = r;
  }


  void addChild (float x, float y, float r, int id, int c)
  {
    if (children == null) children = new ArrayList();

    children.add (new AggregationPoint (x, y, r, id, c, map (brightness (c), 0, 255, 1.5, 0.25)));
  }

  void addChild (float x, float y, float r, int lookup, int newId, int c)
  {

    if (this.id == lookup) addChild ( x, y, r, newId, lerpColor (c, this.c, 0.5));
    else 
    {
      if (children != null && children.size() > 0)
      {
        for (int i = 0; i < children.size(); i++)
        {
          children.get (i).addChild  (x, y, r, lookup, newId, c);
        }
      }
    }
  }

  Target [] getPos ()
  {  

    Target [] pos = {
      new Target (x, y, r, id)
      };


      if (children != null && children.size() > 0)
      {
        for (int i = 0; i < children.size(); i++)
        {
          Target [] childTargets = children.get(i).getPos();
          pos = (Target []) concat (pos, childTargets);
        }
      }  
    return pos;
  }


  void draw ()
  {
    stroke (0, 150);
    strokeWeight (sw);
    if (children != null && children.size() > 0)
    {
      if (children.size() > 1)
      {
        noStroke();
        fill (0, 80);
        ellipse (x, y, sw*2, sw*2);
        noFill();
        stroke (0, 80);
      }
      for (int i = 0; i < children.size(); i++)
      {

        line (x, y, children.get(i).x, children.get(i).y);

        children.get(i).draw();
      }
    }
  }
}

