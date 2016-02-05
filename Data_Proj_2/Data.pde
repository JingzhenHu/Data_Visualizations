class Data
{
  PVector loc;
  color fill;
  float hue;
 
   public Data(PVector location, color rgb)
   {
      this.loc = location;
      this.fill = rgb;
      this.hue = hue(rgb);
   }
   
   void displayData()
   {
      fill(fill);
      ellipse(this.loc.x, this.loc.y, 15, 15); 
   }
   
}