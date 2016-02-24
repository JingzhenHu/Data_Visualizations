final String nuclearEnergy = "http://api.eia.gov/series/?api_key=5A90ED6BF982DD3EF3CFA866AAADB8CB&series_id=TOTAL.NUETBUS.A";  //annual total nuclear
final String primaryEnergy = "http://api.eia.gov/series/?api_key=5A90ED6BF982DD3EF3CFA866AAADB8CB&series_id=TOTAL.TEAJBUS.A"; 
Visualization visForNE;
Visualization visForPE;
PImage bg;
/*
void loadDoc() {
  isLoaded = true;
}
*/
void setup()
{
  size(1200, 800);
  //thread("loadDoc");
  bg = loadImage("demo_world.png");
  visForNE = new Visualization(nuclearEnergy);
  visForPE = new Visualization(primaryEnergy);
  visForNE.parse();
  visForPE.parse();
}
void draw() {
  background(0);
  image(bg, 0, 0, width, height);
  visForNE.show();
}