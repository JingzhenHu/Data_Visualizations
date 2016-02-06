/*
  Jingzhen(Journey) Hu's project 2 
 This project 
 */
Data[] dataList = new Data[100];
PVector[] dataPos = new PVector[100];
color[] dataColor = new color[10];
Bag bag;
Set set;
Stack stack;
Tree tree;
final int r = 80;
final int STATUS_BAG = 0;
final int STATUS_SET = 1;
final int STATUS_TREE = 2;
final int STATUS_STACK = 3;
int pause = 0;
int status = -1;
void setup()
{
  size(900, 600);
  bag = new Bag();
  set = new Set();
  stack = new Stack();
  tree = new Tree();
  for (int i = 0; i < 10; i++)
  {
    dataColor[i] = color(random(255), random(255), random(255));
    for (int j = 0; j < 10; j++)
    {
      dataList[j + 10*i] = new Data(dataColor[i]);
    }
  }
}

void draw()
{
  background(250);
  displayBG();
  bag.drawBagCircle();
  bag.displayInteral();
  set.drawSetCircle();
  set.displayInteral();
  tree.drawTreeCircle();
  tree.displayInteral();
  stack.drawStackCircle();
  stack.displayInteral();
  for (int i = 0; i< 100; i++)
  {
    dataList[i].displayData();
  }
  if (pause == 0)
  {
    if (status == 0)
    {
      bag.motion();
      for (int i = 0; i < dataList.length; i++)
      {
        if (dataList[i].checkCollison(bag.loc))
        {
          //println(dataList[i].hue + "!!!!" + dataList[i].loc);
          if ((bag.loc.x > 100 - r/2 && bag.loc.x < 300 - r/2)||(bag.loc.x > 500 - r/2 && bag.loc.x < 700 - r/2))
            bag.addIn(dataList[i]);
          else if ((bag.loc.x > 300 - r/2 && bag.loc.x < 500 - r/2)||(bag.loc.x > 700 - r/2 && bag.loc.x < 900))
            bag.deleteOut(dataList[i]);
        }
      }
    } else if (status == 1)
    {
      set.motion();
      for (int i = 0; i < dataList.length; i++)
      {
        if (dataList[i].checkCollison(set.loc))
        {
          //println(dataList[i].hue + "!!!!" + dataList[i].loc);
          if ((set.loc.x > 100 - r/2 && set.loc.x < 300 - r/2)||(set.loc.x > 500 - r/2 && set.loc.x < 700 - r/2))
            set.addIn(dataList[i]);
          else if ((set.loc.x > 300 - r/2 && set.loc.x < 500 - r/2)||(set.loc.x > 700 - r/2 && set.loc.x < 900))
            set.deleteOut(dataList[i]);
        }
      }
    } 
    else if (status == 2)
    {
    tree.motion();
    for (int i = 0; i < dataList.length; i++)
    {
      if (dataList[i].checkCollison(tree.loc))
      {
        //println(dataList[i].hue + "!!!!" + dataList[i].loc);
        if ((tree.loc.x > 100 - r/2 && tree.loc.x < 300 - r/2)||(tree.loc.x > 500 - r/2&& tree.loc.x < 700 - r/2))
          tree.addIn(dataList[i]);
        else if ((tree.loc.x > 300 -r/2 && tree.loc.x < 500 - r/2)||(tree.loc.x > 700 - r/2&& tree.loc.x < 900))
          tree.deleteOut(dataList[i]);
      }
    }
    } 
    else if (status == 3)
    {
      stack.motion();
      for (int i = 0; i < dataList.length; i++)
      {
        if (dataList[i].checkCollison(stack.loc))
        {
          //println(dataList[i].hue + "!!!!" + dataList[i].loc);
          if ((stack.loc.x > 100-r/2 && stack.loc.x < 300 - r/2)||(stack.loc.x > 500 - r/2 && stack.loc.x < 700 - r/2))
            stack.addIn(dataList[i]);
          else if ((stack.loc.x > 300 -r/2 && stack.loc.x < 500 - r/2)||(stack.loc.x > 700 - r/2 && stack.loc.x < 900 ))
            stack.deleteOut(dataList[i]);
        }
      }
    } 




    if (keyPressed)
    {
      if (key == 'b' || key == 'B') status = 0; 
      if (key == 's') status = 1;
      if (key == 'T') status = 2;
      if (key == 'S') status = 3;
    }
  }
}

void displayBG()
{
  stroke(0);
  line(100, 400, 900, 400);
  line(100, 0, 100, 600);
  line(300, 0, 300, 600);
  line(500, 0, 500, 600);
  line(700, 0, 700, 600);
  textSize(18);
  text("Add", 180, 20);
  text("Delete", 370, 20);
  text("Add", 580, 20);
  text("Delete", 770, 20);
}

void mouseClicked()
{
  pause = (pause + 1) % 2;
  //bag.applyForce(new PVector(1,0));  //apply the wind to block the data structure to let it go right; create the tendency
}