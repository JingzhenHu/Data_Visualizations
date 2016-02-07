class Data
{
  PVector loc;
  color fill;
  float hue;
  float radius;
  //final int radius = 15;
  
   public Data(color rgb)
   {
      loc = new PVector(random(115, 885), random(25, 385));
      this.fill = rgb;
      this.hue = hue(rgb);
      radius = 15;
   }
   
   void setRadius(float radius)
   {
      this.radius = radius;
   }
   void displayData()
   {
      stroke(fill);
      fill(fill);
      ellipse(loc.x, loc.y, radius, radius); 
   }
   /*
   void remove()
   {
      stroke(255);
      fill(255);
      ellipse(loc.x, loc.y, radius, radius);
   }
   */
   boolean checkCollison(PVector pos)
   {
     boolean isCollison = false;
     PVector temp = new PVector(loc.x, loc.y);
     temp = temp.sub(pos);
     if(temp.mag()<= (radius + r)/2)
     {
       isCollison = true;
     }
     return isCollison;
   }
}