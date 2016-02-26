/*
This
*/
final String nuclearEnergy = "http://api.eia.gov/series/?api_key=5A90ED6BF982DD3EF3CFA866AAADB8CB&series_id=TOTAL.NUETBUS.A";  //annual total nuclear
final String csvTable = "Distribution_of_Nuclear_Electric.csv";
VisualizationI mapNE;
VisualizationII visForNE;
//VisualizationII visForPE;
int pause = 0;
PFont font;
boolean isloaded = false;
void loadDoc()
{
  mapNE = new VisualizationI(csvTable);
  mapNE.parse();
  mapNE.setting();
  isloaded = true;
}
void setup()
{
  size(1280, 743, P2D);
  font = createFont("Arial", 15);
  thread("loadDoc");
  visForNE = new VisualizationII(nuclearEnergy);
  visForNE.parse();
}
void draw() {
  if (pause == 0)
  {
    if (isloaded)
      mapNE.show();
     else
     {
       fill(255);
       textFont(font, 15);
       text("Waiting For Data Visualization", width/2-10, height/2-10);
     }
  }
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