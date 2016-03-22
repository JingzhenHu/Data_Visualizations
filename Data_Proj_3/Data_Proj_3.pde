/*
  Jingzhen(Journet) Hu's Project 3
  This Project grasp a JASON API online with data of annual world nuclear electric power consumption/production and a locally downloaded data of the distribution of nuclear electric power among
  countries in 2016. The two related dataset will be visualized into two different ways.
  There are two data class: the first one is DataForChart which is for storing the year and quanlity in order to drawing the histogram. The detailed amount of each year will be showed in the interaction.
  The second one is DataForMap that contains information of countries name, their longitude, latitude and number of station of nuclear electric and their actual total quanlity of Medium Wave. 
  Those information will be represented as the radius of circles that are drawed on the world map and the total MW will be showed in the interaction when the mouse move into those region.
  User can click to change the two visualizations
  
*/
final String nuclearEnergy = "http://api.eia.gov/series/?api_key=5A90ED6BF982DD3EF3CFA866AAADB8CB&series_id=TOTAL.NUETBUS.A";  //annual total nuclear
final String csvTable = "Distribution_of_Nuclear_Electric.csv";                                                                //data for mapping
VisualizationI mapNE;
VisualizationII visForNE;
int pause = 0;
PFont font;
boolean isloaded = false;
void loadDoc()                    //parsing data for the mapping (first Vis)
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
       text("Waiting For Data Visualization", width/2-20, height/2-10);
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