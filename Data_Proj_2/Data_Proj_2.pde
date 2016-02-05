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

void setup()
{
  size(900, 600);
  bag = new Bag();
  set = new Set();
  stack = new Stack();
  tree = new Tree();
  for (int i = 0; i < 4; i++)
  {
    for (int j = 0; j < 25; j++)
    {
      dataPos[j + i*25] = new PVector(random(115 + i*200 , 285 + i*200), random(25, 385));
      
      //dataList[k + j*5 + i*25] = new Data(dataPos[k + j*5 + i*25], sameData);
    }
  }
  for (int i = 0; i < 10; i++)
  {
    dataColor[i] = color(random(255), random(255), random(255));
    for(int j = 0; j < 10; j++)
    {
       dataList[j + 10*i] = new Data(dataPos[j + 10* i], dataColor[i]); 
    }
  }
}

void draw()
{
  background(255);
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
}

void displayBG()
{
  //stroke(0, 255, 255);
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