/*
  Jingzhen(Journey) Hu's project 2 
 This project is to visualize five data structures
 Bag: A structure that the including data are unsorted, unordered. It allow repeated data. It has the limited of 20
 Set: A structure that the including data are unique, unsorted and unordered. It has the limited of 15.
 Tree: A normal Tree that created by myself (Not Binary search tree or B+tree), it can add data in the order from the left to the right, from the root(top) to the children(bottom).
 When it find the data that is needed to be deleted, it will remove all its subtree.
 Stack: A structure that will be fromed in a line and following the rule of last in, first out. 
 Graphc: A strcuture that will connect the data have the same color (hue value) wit randomly distribute in the room
 When you run the program, Press 'b' or 'B' to run the Bag section; Press 's' to start the set section; Press 't' or 'T' to start tree section and Press 'S' to start the stack section.
 When you want to pause the program, click and click again to recover.
 */
Data[] dataList = new Data[150];                  //an array of data
color[] dataColor = new color[15];                //corresponding of data's color
Bag bag;
Set set;
Stack stack;
Tree tree;
Graph graph;
final int r = 80;
final int STATUS_BAG = 0;              
final int STATUS_SET = 1;
final int STATUS_TREE = 2;
final int STATUS_STACK = 3;
final int STATUS_GRAPH = 4;
int pause = 0;
int status = -1;
void setup()
{
  size(1100, 600);
  bag = new Bag();
  set = new Set();
  stack = new Stack();
  tree = new Tree();
  graph = new Graph();
  for (int i = 0; i < 15; i++)                                       //generate 10 different random colors to inialize the data
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
  bag.drawBagCircle();                //basic drawing for the brackgound
  bag.displayInteral();
  set.drawSetCircle();
  set.displayInteral();
  tree.drawTreeCircle();
  tree.displayInteral();
  stack.drawStackCircle();
  stack.displayInteral();
  graph.drawGraphCircle();
  graph.displayInteral();
  for (int i = 0; i< dataList.length; i++)
  {
    dataList[i].displayData();
  }
  if (pause == 0)
  {
    if (status == STATUS_BAG)
    {
      bag.motion();
      for (int i = 0; i < dataList.length; i++)
      {
        if (dataList[i].checkCollison(bag.loc))
        {
          //println(dataList[i].hue + "!!!!" + dataList[i].loc);
          if ((bag.loc.x > 100 - r/2 && bag.loc.x < 300 - r/2)||(bag.loc.x > 500 - r/2 && bag.loc.x < 700 - r/2) || (bag.loc.x > 900 - r/2 && bag.loc.x < 1100 - r/2))    //calling the add method when in the area of adding
            bag.addIn(dataList[i]);
          else if ((bag.loc.x > 300 - r/2 && bag.loc.x < 500 - r/2)||(bag.loc.x > 700 - r/2 && bag.loc.x < 900))     //calling the delete method when in the area of deleting
            bag.deleteOut(dataList[i]);
        }
      }
    } else if (status == STATUS_SET)
    {
      set.motion();
      for (int i = 0; i < dataList.length; i++)
      {
        if (dataList[i].checkCollison(set.loc))
        {
          //println(dataList[i].hue + "!!!!" + dataList[i].loc);
          if ((set.loc.x > 100 - r/2 && set.loc.x < 300 - r/2)||(set.loc.x > 500 - r/2 && set.loc.x < 700 - r/2) || (set.loc.x > 900 - r/2 && set.loc.x < 1100 - r/2))   //calling the add method when in the area of adding
            set.addIn(dataList[i]);
          else if ((set.loc.x > 300 - r/2 && set.loc.x < 500 - r/2)||(set.loc.x > 700 - r/2 && set.loc.x < 900))   //calling the delete method when in the area of deleting
            set.deleteOut(dataList[i]);
        }
      }
    } else if (status == STATUS_TREE)
    {
      tree.motion();
      for (int i = 0; i < dataList.length; i++)
      {
        if (dataList[i].checkCollison(tree.loc))
        {
          //println(dataList[i].hue + "!!!!" + dataList[i].loc);
          if ((tree.loc.x > 100 - r/2 && tree.loc.x < 300 - r/2)||(tree.loc.x > 500 - r/2&& tree.loc.x < 700 - r/2) || (tree.loc.x > 900 - r/2 && tree.loc.x < 1100 - r/2))
            tree.addIn(dataList[i]);
          else if ((tree.loc.x > 300 -r/2 && tree.loc.x < 500 - r/2)||(tree.loc.x > 700 - r/2&& tree.loc.x < 900))
            tree.deleteOut(dataList[i]);
        }
      }
    } else if (status == STATUS_STACK)
    {
      stack.motion();
      for (int i = 0; i < dataList.length; i++)
      {
        if (dataList[i].checkCollison(stack.loc))
        {
          //println(dataList[i].hue + "!!!!" + dataList[i].loc);
          if ((stack.loc.x > 100-r/2 && stack.loc.x < 300 - r/2)||(stack.loc.x > 500 - r/2 && stack.loc.x < 700 - r/2)||(stack.loc.x > 900 - r/2 && stack.loc.x < 1100 - r/2))
            stack.addIn(dataList[i]);
          else if ((stack.loc.x > 300 -r/2 && stack.loc.x < 500 - r/2)||(stack.loc.x > 700 - r/2 && stack.loc.x < 900 ))
            stack.deleteOut(dataList[i]);
        }
      }
    } else if (status == STATUS_GRAPH)
    {
      graph.motion();
      for (int i = 0; i < dataList.length; i++)
      {
        if (dataList[i].checkCollison(graph.loc))
        {
          //println(dataList[i].hue + "!!!!" + dataList[i].loc);
          if ((graph.loc.x > 100-r/2 && graph.loc.x < 300 - r/2)||(graph.loc.x > 500 - r/2 && graph.loc.x < 700 - r/2)||(graph.loc.x > 900 - r/2 && graph.loc.x < 1100 - r/2))
            graph.addIn(dataList[i]);
          else if ((graph.loc.x > 300 - r/2 && graph.loc.x < 500 - r/2)||(graph.loc.x > 700 - r/2 && graph.loc.x < 900 ))
            graph.deleteOut(dataList[i]);
        }
      }
    } 

    if (keyPressed)
    {
      if (key == 'b' || key == 'B') status = STATUS_BAG; 
      if (key == 's') status = STATUS_SET;
      if (key == 't' || key == 'T') status = STATUS_TREE;
      if (key == 'S') status = STATUS_STACK;
      if (key == 'g' || key == 'G') status = STATUS_GRAPH;
    }
  }
}

void displayBG()            //divide the whole screen into different sections
{
  stroke(0);
  line(100, 400, 1100, 400);
  line(100, 0, 100, 600);
  line(300, 0, 300, 600);
  line(500, 0, 500, 400);
  line(470, 400, 470, 600);
  line(730, 400, 730, 600);
  line(700, 0, 700, 400);
  line(900, 0, 900, 600);
  textSize(18);
  fill(0);
  text("Add", 180, 20);
  text("Delete", 370, 20);
  text("Add", 580, 20);
  text("Delete", 770, 20);
  text("Add", 980, 20);
}

void mouseClicked()
{
  pause = (pause + 1) % 2;
  //bag.applyForce(new PVector(1,0));  //apply the wind to block the data structure to let it go right; create the tendency
}