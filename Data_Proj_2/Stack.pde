class Stack {
  PVector loc = new PVector(50, 250);
  PVector vec;  
  int currMember = 0;
  public Stack()
  {
  }
  public void motion()
  {
  }
  public void drawStackCircle()
  {
    textSize(15);
    text("Stack", this.loc.x - 15, this.loc.y + 5);
    noFill();
    ellipse(this.loc.x, this.loc.y, 80, 80);
  }

  public void displayInteral()
  {
    textSize(18);
    text("Tommy Tree", 550, 420);
    textSize(12);
    text("Element: " + currMember, 515, 580);
  }
}