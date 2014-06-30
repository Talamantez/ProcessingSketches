class Aggregation
{
  AggregationPoint [] ap;
  int index;
  Aggregation (float [] [] initPoints, float [] r, int [] c)
  {
    index = 0;
    ap = new AggregationPoint [initPoints.length];
    for (int i = 0; i < ap.length; i++) 
    {
      ap [i] = new AggregationPoint (initPoints [i] [0], initPoints [i] [1], r [i], index, c [i], 1.5);
      index++;
    }
  }
  
  Aggregation (float [] xInitPoints, float [] yInitPoints, float [] r)
  {
    index = 0;
    ap = new AggregationPoint [xInitPoints.length];
    for (int i = 0; i < ap.length; i++) 
    {
      ap [i] = new AggregationPoint (xInitPoints [i], yInitPoints [i], r[i], index, color (random (255), random (255), random (255)), 1.5);
      index++;
    }
  }
  
  void addAggregationPoint (float x, float y, float r, int motherIndex, int lookup, int c)
  {
    
    if (motherIndex == lookup)
    {
      ap [motherIndex].addChild (x, y, r, index, c);
      index++;
    }
    else{
      ap [motherIndex].addChild (x, y, r, lookup, index, c);
      index++;
    }
  }
  
  void draw ()
  {
    for (int i = 0; i < ap.length; i++) ap [i].draw();
  }
  
}
