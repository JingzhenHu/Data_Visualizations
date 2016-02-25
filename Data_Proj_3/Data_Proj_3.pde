final String nuclearEnergy = "http://api.eia.gov/series/?api_key=5A90ED6BF982DD3EF3CFA866AAADB8CB&series_id=TOTAL.NUETBUS.A";  //annual total nuclear
//final String primaryEnergy = "http://api.eia.gov/series/?api_key=5A90ED6BF982DD3EF3CFA866AAADB8CB&series_id=TOTAL.TEAJBUS.A"; 
final String csvTable = "Distribution_of_Nuclear_Electric.csv";
VisualizationI mapNE;
VisualizationII visForNE;
//VisualizationII visForPE;
int pause = 0;
PFont font;
void setup()
{
  size(1280, 743, P2D);
  font = createFont("Arial", 15);
  //thread("loadDoc");
  mapNE = new VisualizationI(csvTable);
  visForNE = new VisualizationII(nuclearEnergy);
  //visForPE = new VisualizationII(primaryEnergy);
  mapNE.parse();
  visForNE.parse();
  //visForPE.parse();
}
void draw() {
  if (pause == 0)
    mapNE.show();
  if (pause == 1)
  {  
    background(0);
    visForNE.show();
  }
}

void mouseClicked()
{
  pause = (pause + 1) % 2;
}