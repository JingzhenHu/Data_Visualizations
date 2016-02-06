//import java.awt.List;
//import java.util.Stack;
class Stack {
  PVector loc; 
  PVector vec;  
  PVector acc;
  PVector tendency;
  float xOffSet;
  int currMember;
  int yCorr;
  //Stack<Data> dataStack; 
  final int MAX_VEC = 1;
  final float NOISE_DELTA = 0.05;
  ArrayList<Data> stackData;
  public Stack()
  {
    loc = new PVector(50, 250);
    vec = new PVector(0, 0);
    acc = new PVector(0.5, 0);
    tendency = new PVector(1.3, 0);
    xOffSet = 0;
    currMember = 0;
    yCorr = 0;
    //dataStack = new Stack();
    stackData = new ArrayList<Data>();
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
  public void drawStackCircle()
  {
    textSize(15);
    text("Stack", this.loc.x - 15, this.loc.y + 5);
    noFill();
    ellipse(this.loc.x, this.loc.y, r, r);
  }

  public void displayInteral()
  {
    textSize(18);
    text("Sera Stack", 750, 420);
    textSize(12);
    text("Element: " + currMember, 715, 580);
  }

  public void addIn(Data dataAdd)
  {
    yCorr = height - 15*(currMember + 1);
    if ((currMember+1) % 9 == 0)
    {
      for (int i = 0; i < stackData.size(); i++)
        stackData.get(i).loc.y += 120;    
    }
    int factor = (currMember + 1)/9;
    if (factor >= 1)  yCorr += factor*120;
    dataAdd.loc = new PVector(800, yCorr);
    stackData.add(dataAdd);
    //dataStack.push((int)dataAdd.hue); 
    currMember++;
  }

  public void deleteOut(Data dataOut)
  {
    if (dataOut.hue == stackData.get(stackData.size()-1).hue)
    {
      float xCordReturn1 = random(115, 285);
      float xCordReturn2 = random(515, 685);
      int halfAndHalf = ceil(random(0, 2));
      if (halfAndHalf == 1) stackData.get(stackData.size()-1).loc = new PVector(xCordReturn1, random(25, 385));
      if (halfAndHalf == 2) stackData.get(stackData.size()-1).loc = new PVector(xCordReturn2, random(25, 385));
      //bagData.get(i).loc = new PVector(random(115, 285), random(25, 385));
      stackData.remove(stackData.size()-1);
      currMember--;
    }
  }
}