class Tree {
  PVector loc = new PVector(50, 350);
  PVector vec;  
  int currMember = 0;
  public Tree()
  {
  }
  public void motion()
  {
  }
  public void drawTreeCircle()
  {
    textSize(15);
    text("Tree", this.loc.x - 13, this.loc.y + 5);
    noFill();
    ellipse(this.loc.x, this.loc.y, 80, 80);
  }

  public void displayInteral()
  {
    textSize(18);
    text("Sera Stack", 750, 420);
    textSize(12);
    text("Element: " + currMember, 715, 580);
  }
}