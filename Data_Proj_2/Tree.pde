class Tree {
  PVector loc; 
  PVector vec;
  PVector acc;
  PVector tendency;
  float xOffSet;
  int currMember;
  ArrayList<Data> treeData;
  final int MAX_VEC = 1;
  final float NOISE_DELTA = 0.05;

  public Tree()
  {
    loc = new PVector(50, 350);
    vec = new PVector(0, 0);
    acc = new PVector(0.5, 0);
    tendency = new PVector(1.3, 0);
    xOffSet = 0;
    currMember = 0;
    treeData = new ArrayList<Data>();
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
  public void drawTreeCircle()
  {
    textSize(15);
    text("Tree", this.loc.x - 13, this.loc.y + 5);
    noFill();
    ellipse(this.loc.x, this.loc.y, r, r);
  }

  public void displayInteral()
  {
    textSize(18);
    text("Tommy Tree", 550, 420);
    textSize(12);
    text("Element: " + currMember, 515, 580);
  }
  public void addIn(Data dataAdd)
  {
    if (treeData.size()== 0)   dataAdd.loc = new PVector(600, 420);
    else
    //int xCor = treeData.get(treeData.size()-1).loc.x + 
    //int yCor = treeData.get(treeData.size()-1).loc.y +
    treeData.add(dataAdd); 
    currMember++;
  }

  public void deleteOut(Data dataOut)
  {
    //for (int i =0; i < treeData.size(); i++)
    //{
    //  if (dataOut.hue == treeData.get(i).hue)
    //  {
    //    float xCordReturn1 = random(115, 285);
    //    float xCordReturn2 = random(515, 685);
    //    int halfAndHalf = ceil(random(0, 2));
    //    if (halfAndHalf == 1) treeData.get(i).loc = new PVector(xCordReturn1, random(25, 385));
    //    if (halfAndHalf == 2) treeData.get(i).loc = new PVector(xCordReturn2, random(25, 385));
    //    //treeData.get(i).loc = new PVector(random(115, 285), random(25, 385));
    //    treeData.remove(i);
    //    currMember--;
    //    break;
    //  }
    //}
  }
}