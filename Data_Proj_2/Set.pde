class Set {
  PVector loc = new PVector(50, 150);
  PVector vec;
  int currMember = 0;
  final int limit = 12;
  public Set()
  {
  }
  public void motion()
  {
  }
  public void drawSetCircle()
  {
    textSize(15);
    text("Set", this.loc.x - 10, this.loc.y + 5);
    noFill();
    ellipse(this.loc.x, this.loc.y, 80, 80);
  }

  public void displayInteral()
  {
    textSize(18);
    text("Sally Set", 350, 420);
    textSize(12);
    text("Element: " + currMember, 315, 580);
    text("Capacity: " + limit, 420, 580);
  }
}