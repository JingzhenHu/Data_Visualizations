class Graph {
  final int MAX_VEC = 1;
  final float NOISE_DELTA = 0.05;
  PVector loc; 
  PVector vec;
  PVector acc;
  PVector tendency;
  float xOffSet;
  int currMember;
  ArrayList<Data> graphData;     //using an arraylist to simulate the bag

  public Graph()
  {
    loc = new PVector(50, 450);
    vec = new PVector(0, 0);
    acc = new PVector(0.5, 0);
    tendency = new PVector(1.3, 0);
    xOffSet = 0;
    currMember = 0;
    graphData = new ArrayList<Data>();
  }
  public void motion()
  {
    acc = PVector.fromAngle(noise(xOffSet) * TWO_PI);
    vec.add(acc);
    vec.add(tendency);
    loc.add(vec);
    vec.limit(MAX_VEC);                //limit for the magnitude of speed
    xOffSet -= NOISE_DELTA;
    //check for the boundary
    if (loc.y <= 40)  loc.y = 360;
    if (loc.y >= 360)  loc.y = 40;
    if (loc.x > width)  loc.x = 0;
  }

  public void drawGraphCircle()
  {
    textSize(15);
    text("Graph", this.loc.x - 20, this.loc.y + 5);
    noFill();
    ellipse(this.loc.x, this.loc.y, r, r);
  }

  public void displayInteral()
  {
    textSize(18);
    text("Gongli Graph", 945, 420);
    textSize(12);
    text("Element: " + currMember, 915, 580);
    for(int i = 0; i < graphData.size(); i++)
    {
      for(int j = i; j < graphData.size(); j++)
      {
       if(graphData.get(i).hue == graphData.get(j).hue) 
       {
         stroke(graphData.get(i).fill);
         line(graphData.get(i).loc.x, graphData.get(i).loc.y, graphData.get(j).loc.x, graphData.get(j).loc.y);
       }
      }
    }
  }

  public void addIn(Data dataAdd)
  {
      dataAdd.loc = new PVector(random(915, 1085), random(435, 565));
      dataAdd.setRadius(5);
      graphData.add(dataAdd); 
      currMember++;
  }

  public void deleteOut(Data dataOut)
  {
    for (int i =0; i < graphData.size(); i++)
    {
      if (dataOut.hue == graphData.get(i).hue)
      {
        float xCordReturn1 = random(115, 285);
        float xCordReturn2 = random(515, 685);
        float xCordReturn3 = random(915, 1085);
        int halfAndHalf = ceil(random(0,3));
        graphData.get(i).setRadius(15);
        if(halfAndHalf == 1) graphData.get(i).loc = new PVector(xCordReturn1, random(25, 385));
        if(halfAndHalf == 2) graphData.get(i).loc = new PVector(xCordReturn2, random(25, 385));
        if(halfAndHalf == 3) graphData.get(i).loc = new PVector(xCordReturn3, random(25, 385));
        graphData.remove(i);
        currMember--;
        break;
      }
    }
  }
}