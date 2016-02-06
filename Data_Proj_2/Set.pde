class Set {
  final int MAX_VEC = 1;
  final float NOISE_DELTA = 0.05;
  final int limit = 12;
  PVector loc; 
  PVector vec;
  PVector acc;
  PVector tendency;
  float xOffSet;
  int currMember;
  ArrayList<Data> setData;
  public Set()
  {
    loc = new PVector(50, 150);
    vec = new PVector(0, 0);
    acc = new PVector(0.5, 0);
    tendency = new PVector(1.3, 0);
    xOffSet = 0;
    currMember = 0;
    setData = new ArrayList<Data>();
  }
  public void motion()
  {
    acc = PVector.fromAngle(noise(xOffSet) * TWO_PI);
    vec.add(acc);
    vec.add(tendency);
    loc.add(vec);
    vec.limit(MAX_VEC);                
    xOffSet -= NOISE_DELTA;
    //check for the boundary
    if (loc.y <= 40)  loc.y = 360;
    if (loc.y >= 360)  loc.y = 40;
    if (loc.x > width)  loc.x = 0;
  }
  public void drawSetCircle()
  {
    textSize(15);
    text("Set", this.loc.x - 10, this.loc.y + 5);
    noFill();
    ellipse(this.loc.x, this.loc.y, r, r);
  }

  public void displayInteral()
  {
    textSize(18);
    text("Sally Set", 350, 420);
    textSize(12);
    text("Element: " + currMember, 315, 580);
    text("Capacity: " + limit, 420, 580);
  }

  public void addIn(Data dataAdd)
  {
    if (currMember < limit)
    {
      boolean isRepeated = false;
      for (int i = 0; i < setData.size(); i++)
      {
        if (dataAdd.hue == setData.get(i).hue)
        {
          isRepeated = true;
        }
      }
      if (!isRepeated)
      {
        dataAdd.loc = new PVector(random(315, 485), random(435, 565));
        setData.add(dataAdd); 
        currMember++;
      }
    }
  }

  public void deleteOut(Data dataOut)
  {
    for (int i =0; i < setData.size(); i++)
    {
      if (dataOut.hue == setData.get(i).hue)
      {
        float xCordReturn1 = random(115, 285);
        float xCordReturn2 = random(515, 685);
        int halfAndHalf = ceil(random(0, 2));
        if (halfAndHalf == 1) setData.get(i).loc = new PVector(xCordReturn1, random(25, 385));
        if (halfAndHalf == 2) setData.get(i).loc = new PVector(xCordReturn2, random(25, 385));
        //setData.get(i).loc = new PVector(random(115, 285), random(25, 385));
        setData.remove(i);
        currMember--;
      }
    }
  }
}