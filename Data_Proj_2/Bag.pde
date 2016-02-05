class Bag {
  PVector loc = new PVector(50,50);
  PVector vec;
  int currMember = 0;
  final int limit = 12;
  public Bag()
  {
    
  }
  public void motion()
  {
    
  }
  public void drawBagCircle()
  {
    textSize(15);
    text("Bag", this.loc.x - 10, this.loc.y + 5);
    noFill();
    ellipse(this.loc.x, this.loc.y, 80, 80);
  }
  
  public void displayInteral()
  {
    textSize(18);
    text("BilBo Bag", 150, 420);
    textSize(12);
    text("Element: " + currMember, 115, 580);
    text("Capacity: " + limit, 220, 580);
  }
}