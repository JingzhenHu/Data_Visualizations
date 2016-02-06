class Bag {
  final int MAX_VEC = 1;
  final float NOISE_DELTA = 0.05;
  final int limit = 12;
  PVector loc; 
  PVector vec;
  PVector acc;
  PVector tendency;
  float xOffSet;
  int currMember;
  ArrayList<Data> bagData;

  public Bag()
  {
    loc = new PVector(50, 50);
    vec = new PVector(0, 0);
    acc = new PVector(0.5, 0);
    tendency = new PVector(1.3, 0);
    xOffSet = 0;
    currMember = 0;
    bagData = new ArrayList<Data>();
  }
  public void motion()
  {
    acc = PVector.fromAngle(noise(xOffSet) * TWO_PI);
    vec.add(acc);
    vec.add(tendency);
    loc.add(vec);
    vec.limit(MAX_VEC);                //limit for the magnitude 
    xOffSet -= NOISE_DELTA;
    //check for the boundary
    if (loc.y <= 40)  loc.y = 360;
    if (loc.y >= 360)  loc.y = 40;
    //if (loc.x <0)  loc.x = width;
    if (loc.x > width)  loc.x = 0;
  }
  //public void applyForce(PVector f)
  //{
  //  vec.add(f);
  //}
  public void drawBagCircle()
  {
    textSize(15);
    text("Bag", this.loc.x - 10, this.loc.y + 5);
    noFill();
    ellipse(this.loc.x, this.loc.y, r, r);
  }

  public void displayInteral()
  {
    textSize(18);
    text("BilBo Bag", 150, 420);
    textSize(12);
    text("Element: " + currMember, 115, 580);
    text("Capacity: " + limit, 220, 580);
  }

  public void addIn(Data dataAdd)
  {
    if (currMember < limit)
    {
      dataAdd.loc = new PVector(random(115, 285), random(435, 565));
      bagData.add(dataAdd); 
      currMember++;
    }
  }

  public void deleteOut(Data dataOut)
  {
    for (int i =0; i < bagData.size(); i++)
    {
      if (dataOut.hue == bagData.get(i).hue)
      {
        float xCordReturn1 = random(115, 285);
        float xCordReturn2 = random(515, 685);
        int halfAndHalf = ceil(random(0,2));
        if(halfAndHalf == 1) bagData.get(i).loc = new PVector(xCordReturn1, random(25, 385));
        if(halfAndHalf == 2) bagData.get(i).loc = new PVector(xCordReturn2, random(25, 385));
        //bagData.get(i).loc = new PVector(random(115, 285), random(25, 385));
        bagData.remove(i);
        currMember--;
        break;
      }
    }
  }
}