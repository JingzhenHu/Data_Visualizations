class Tree {
  PVector loc; 
  PVector vec;
  PVector acc;
  PVector tendency;
  float xOffSet;
  int currMember;
  ArrayList<Data> treeData;            //using an arraylist to simulate the tree
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
    vec.limit(MAX_VEC);                //limit for the magnitude of speed
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
    text("Tommy Tree", 530, 420);
    textSize(12);
    text("Element: " + currMember, 485, 580);

    for (int i = 1; i < treeData.size(); i++)
    {
      if (i % 2 == 0)
        line(treeData.get(i).loc.x, treeData.get(i).loc.y, treeData.get((i-2)/2).loc.x, treeData.get((i-2)/2).loc.y);
      if (i % 2 == 1)
        line(treeData.get(i).loc.x, treeData.get(i).loc.y, treeData.get((i-1)/2).loc.x, treeData.get((i-1)/2).loc.y);
    }
  }
  public void addIn(Data dataAdd)
  {
    //As 2^7 = 128 which exceed the total number of data, then
    //we choose 2^6 +2^5 to be the max possible situation that results into the total 7 digits in the binary form
    String binaryStr = binary(treeData.size()+1, 7); 
    /*
    char binaryList[] = new char[7];
     for (int i = 0; i < 7; i++)
     {
     binaryList[i] = binaryStr.charAt(i);
     }
     */
    int len = Integer.parseInt(binaryStr);
    if (treeData.size() == 0)   
    {
      dataAdd.loc = new PVector(600, 440);
      dataAdd.setRadius(5);
      treeData.add(dataAdd); 
      currMember++;
    } else if (String.valueOf(len).length() == 2)              //divide into different situations of layers
    {
      if ((treeData.size()+1) % 2 == 0)
        dataAdd.loc = new PVector((treeData.get((treeData.size()-1)/2).loc.x - 50*sqrt(2)), (treeData.get((treeData.size()-1)/2).loc.y + 10*sqrt(2))); 
      if ((treeData.size()+1) % 2 == 1)
        dataAdd.loc = new PVector((treeData.get((treeData.size()-1)/2).loc.x + 50*sqrt(2)), (treeData.get((treeData.size()-1)/2).loc.y + 10*sqrt(2))); 
      dataAdd.setRadius(5);
      treeData.add(dataAdd); 
      stroke(0);
      line(dataAdd.loc.x, dataAdd.loc.y, treeData.get((treeData.size()-1)/2).loc.x, treeData.get((treeData.size()-1)/2).loc.y);
      currMember++;
    } else if (String.valueOf(len).length() == 3)
    {
      if ((treeData.size()+1) % 2 == 0)
        dataAdd.loc = new PVector((treeData.get((treeData.size()-1)/2).loc.x - 25*sqrt(2)), (treeData.get((treeData.size()-1)/2).loc.y + 15*sqrt(2))); 
      //line(dataAdd.loc.x, dataAdd.loc.y, treeData.get((treeData.size()-1)/2).loc.x, treeData.get((treeData.size()-1)/2).loc.y);
      if ((treeData.size()+1) % 2 == 1)
        dataAdd.loc = new PVector((treeData.get((treeData.size()-1)/2).loc.x + 25*sqrt(2)), (treeData.get((treeData.size()-1)/2).loc.y + 15*sqrt(2))); 
      dataAdd.setRadius(5);
      treeData.add(dataAdd); 
      currMember++;
    } else if (String.valueOf(len).length() == 4)
    {
      if ((treeData.size()+1) % 2 == 0)
        dataAdd.loc = new PVector((treeData.get((treeData.size()-1)/2).loc.x - 13*sqrt(2)), (treeData.get((treeData.size()-1)/2).loc.y + 15*sqrt(2))); 
      //line(dataAdd.loc.x, dataAdd.loc.y, treeData.get((treeData.size()-1)/2).loc.x, treeData.get((treeData.size()-1)/2).loc.y);
      if ((treeData.size()+1) % 2 == 1)
        dataAdd.loc = new PVector((treeData.get((treeData.size()-1)/2).loc.x + 13*sqrt(2)), (treeData.get((treeData.size()-1)/2).loc.y + 15*sqrt(2))); 
      dataAdd.setRadius(5);
      treeData.add(dataAdd); 
      currMember++;
    } else if (String.valueOf(len).length() == 5)
    {
      if ((treeData.size()+1) % 2 == 0)
        dataAdd.loc = new PVector((treeData.get((treeData.size()-1)/2).loc.x - 7*sqrt(2)), (treeData.get((treeData.size()-1)/2).loc.y + 15*sqrt(2))); 
      //line(dataAdd.loc.x, dataAdd.loc.y, treeData.get((treeData.size()-1)/2).loc.x, treeData.get((treeData.size()-1)/2).loc.y);
      if ((treeData.size()+1) % 2 == 1)
        dataAdd.loc = new PVector((treeData.get((treeData.size()-1)/2).loc.x + 7*sqrt(2)), (treeData.get((treeData.size()-1)/2).loc.y + 15*sqrt(2))); 
      dataAdd.setRadius(5);
      treeData.add(dataAdd); 
      currMember++;
    } else if (String.valueOf(len).length() == 6)
    {
      if ((treeData.size()+1) % 2 == 0)
        dataAdd.loc = new PVector((treeData.get((treeData.size()-1)/2).loc.x - 3*sqrt(2)), (treeData.get((treeData.size()-1)/2).loc.y + 20*sqrt(2))); 
      //line(dataAdd.loc.x, dataAdd.loc.y, treeData.get((treeData.size()-1)/2).loc.x, treeData.get((treeData.size()-1)/2).loc.y);
      if ((treeData.size()+1) % 2 == 1)
        dataAdd.loc = new PVector((treeData.get((treeData.size()-1)/2).loc.x + 3*sqrt(2)), (treeData.get((treeData.size()-1)/2).loc.y + 20*sqrt(2))); 

      dataAdd.setRadius(5);
      treeData.add(dataAdd); 
      currMember++;
    }
    /*
    else if (binaryList[1] == 49)
     {
     int yCorr = int(pow(2, 5)*(binaryList[1] - 48) + pow(2, 4)*(binaryList[2] - 48) + pow(2, 3)*(binaryList[3] - 48) + pow(2, 2)*(binaryList[4] - 48) + pow(2, 1)*(binaryList[5] - 48) + pow(2, 0)*(binaryList[6] - 48));
     dataAdd.loc = new PVector(600 + (yCorr - pow(2, 5)*2.5), 430 + 6*5);
     stroke(0);
     if (yCorr % 2 == 0)
     line(dataAdd.loc.x, dataAdd.loc.y, dataAdd.loc.x + 2.5, dataAdd.loc.y - 5);
     if (yCorr % 2 == 1)
     line(dataAdd.loc.x, dataAdd.loc.y, dataAdd.loc.x - 2.5, dataAdd.loc.y - 5);
     treeData.add(dataAdd); 
     currMember++;
     } else if (binaryList[2] == 49)
     {
     int yCorr = int(pow(2, 4)*(binaryList[2] - 48) + pow(2, 3)*(binaryList[3] - 48) + pow(2, 2)*(binaryList[4] - 48) + pow(2, 1)*(binaryList[5] - 48) + pow(2, 0)*(binaryList[6] - 48));
     dataAdd.loc = new PVector(600 + (yCorr - pow(2, 4)*2.5), 430 + 5*5);
     stroke(0);
     if (yCorr % 2 == 0)
     line(dataAdd.loc.x, dataAdd.loc.y, dataAdd.loc.x + 2.5, dataAdd.loc.y - 5);
     if (yCorr % 2 == 1)
     line(dataAdd.loc.x, dataAdd.loc.y, dataAdd.loc.x - 2.5, dataAdd.loc.y - 5);
     treeData.add(dataAdd); 
     currMember++;
     } else if (binaryList[3] == 49)
     {
     int yCorr = int(pow(2, 3)*(binaryList[3] - 48) + pow(2, 2)*(binaryList[4] - 48) + pow(2, 1)*(binaryList[5] - 48) + pow(2, 0)*(binaryList[6] - 48));
     dataAdd.loc = new PVector(600 + (yCorr - pow(2, 3)*2.5), 430 + 4*5);
     stroke(0);
     if (yCorr % 2 == 0)
     line(dataAdd.loc.x, dataAdd.loc.y, dataAdd.loc.x + 2.5, dataAdd.loc.y - 5);
     if (yCorr % 2 == 1)
     line(dataAdd.loc.x, dataAdd.loc.y, dataAdd.loc.x - 2.5, dataAdd.loc.y - 5);
     treeData.add(dataAdd); 
     currMember++;
     } else if (binaryList[0] == 48 && binaryList[1] == 48 && binaryList[2] == 48 && binaryList[3] == 48 && binaryList[4] == 49)
     {
     int yCorr = int(pow(2, 2)*(binaryList[4] - 48) + pow(2, 1)*(binaryList[5] - 48) + pow(2, 0)*(binaryList[6] - 48));
     dataAdd.loc = new PVector(600 + (yCorr - pow(2, 2)*2.5), 430 + 3*5);
     stroke(0);
     if (yCorr % 2 == 0)
     line(dataAdd.loc.x, dataAdd.loc.y, dataAdd.loc.x + 2.5, dataAdd.loc.y - 5);
     if (yCorr % 2 == 1)
     line(dataAdd.loc.x, dataAdd.loc.y, dataAdd.loc.x - 2.5, dataAdd.loc.y - 5);
     treeData.add(dataAdd); 
     currMember++;
     } else if (binaryList[5] == 49)
     {
     int yCorr = int(pow(2, 1)*(binaryList[5] - 48) + pow(2, 0)*(binaryList[6] - 48));
     dataAdd.loc = new PVector(600 + (yCorr - pow(2, 1)*35), 430 + 2*20);
     stroke(0);
     if (yCorr % 2 == 0)
     line(dataAdd.loc.x, dataAdd.loc.y, dataAdd.loc.x + 35, dataAdd.loc.y - 20);
     if (yCorr % 2 == 1)
     line(dataAdd.loc.x, dataAdd.loc.y, dataAdd.loc.x - 35, dataAdd.loc.y - 20);
     treeData.add(dataAdd); 
     currMember++;
     } else if (binaryList[6] == 49)
     {
     int yCorr = int(pow(2, 0)*(binaryList[6] - 48));
     println(yCorr);
     dataAdd.loc = new PVector(600 + (yCorr - pow(2, 0)*75), 430 + 1*20);
     
     if (yCorr % 2 == 0)
     stroke(0);
     line(dataAdd.loc.x, dataAdd.loc.y, dataAdd.loc.x + 75, dataAdd.loc.y - 20);
     if (yCorr % 2 == 1)
     stroke(0);
     line(dataAdd.loc.x, dataAdd.loc.y, dataAdd.loc.x - 75, dataAdd.loc.y - 20);
     treeData.add(dataAdd); 
     currMember++;
     }
     */
  }

  public void deleteOut(Data dataOut)                 //remove all its subtree if it is deleted from the tree
  {
    for (int i = treeData.size()-1; i > 0; i--)
    {
      if (dataOut.hue == treeData.get(i).hue)
      {
        for (int j = treeData.size()-1; j > i; j-- )
        {
          float xCordReturn1 = random(115, 285);
          float xCordReturn2 = random(515, 685);
          float xCordReturn3 = random(915, 1085);
          int halfAndHalf = ceil(random(0, 3));
          if (halfAndHalf == 1) treeData.get(j).loc = new PVector(xCordReturn1, random(25, 385));
          if (halfAndHalf == 2) treeData.get(j).loc = new PVector(xCordReturn2, random(25, 385));
          if (halfAndHalf == 3) treeData.get(j).loc = new PVector(xCordReturn3, random(25, 385));
          treeData.get(j).setRadius(15);
          treeData.remove(j);
          currMember--;
        }
        break;
      }
    }
  }
}