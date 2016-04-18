class VisualizationI {
  Table table;
  DataForMap[] informs;
  ArrayList<PVector> espLoc;
  PImage bg;
  int totalMW;   //383513
  final float FACTOR = 234.0; // to scale to image size

  VisualizationI(String csvName) {
    bg = loadImage("http://upload.wikimedia.org/wikipedia/commons/thumb/4/4f/Kavraiskiy_VII_projection_SW.jpg/1280px-Kavraiskiy_VII_projection_SW.jpg");  //the world map
    imageMode(CENTER);
    table = loadTable(csvName, "header");  //parsing the data from the csv file
    informs = new DataForMap[table.getRowCount()]; //create the DataForMap object corresponding to the number of rows
    espLoc = new ArrayList<PVector>(); //to store the postion of circle in order to draw in show method
    totalMW = 0; //calculate the sum of MW
  }
  void parse() {
    int i = 0;
    for (TableRow row : table.rows())
    {
      informs[i] = new DataForMap(row.getString("CountryName"), new PVector(row.getFloat("Longitude"), row.getFloat("Latitude")), row.getInt("Number"), row.getInt("MW")); //based on the structure of data
      totalMW += informs[i].hiddenValue;
      i++;
    }
  }
  void setting()  //for every data, called the setPoint to claculate the drawing position
  {
    for (int i = 0; i < informs.length; i++)
    {
      setPoint(informs[i]);
    }
  }
  void show()
  {
    pushMatrix();
    translate(width/2, height/2);
    tint(128);
    image(bg, 0, 0);
    for (int i = 0; i < espLoc.size(); i++)
    {
      strokeWeight(2);
      fill(255, 0, 0);
      ellipse(espLoc.get(i).x, espLoc.get(i).y, informs[i].numDiameter, informs[i].numDiameter); //draw circiles according to the pos and use the number of station as the diameter
      //interaction, for each country, if the mouse move around, it will show the country name, the actual MW of that country, and the total MW 
      if (mouseX>=espLoc.get(i).x - informs[i].numDiameter/2+width/2 && mouseX <= espLoc.get(i).x + informs[i].numDiameter/2+width/2 && mouseY>=espLoc.get(i).y - informs[i].numDiameter/2+height/2 && mouseY <= espLoc.get(i).y + informs[i].numDiameter/2+height/2)
      {
        fill(255);
        textFont(font, 15);
        text(informs[i].countryName, espLoc.get(i).x + 10, espLoc.get(i).y);
        text(informs[i].hiddenValue, espLoc.get(i).x + 10, espLoc.get(i).y+ 15);
        text("World's Total amount: "+totalMW, espLoc.get(i).x + 10, espLoc.get(i).y+ 30);
      }
    }
    popMatrix();
  }
  //calculate the PVector for drawing
  void setPoint(DataForMap data) {
    noFill();
    stroke(255, 200, 10);
    //ellipseMode(CENTER);
    println(data.loc.y);
    float xp = kavraX(radians(data.loc.x), radians(data.loc.y))*FACTOR;
    float yp = kavraY(radians(data.loc.x), radians(data.loc.y))*FACTOR;
    espLoc.add(new PVector(xp, yp));
  }

  /// mapping
  float kavraX (float longitude, float latitude) { // Kavra for Kavrayskiy 
    // formula from http://en.wikipedia.org/wiki/Kavrayskiy_VII_projection
    //println(latitude);
    //println(PI*PI/3 - latitude*latitude);
    return ((3 * longitude) / TWO_PI)*sqrt(PI*PI/3 - latitude*latitude);
  } 

  float kavraY (float longitude, float latitude) {
    return latitude*-1;
  }
}

class VisualizationII {
  JSONObject energy;
  ArrayList<DataForChart> data;

  VisualizationII(String dataset)
  {
    energy = loadJSONObject(dataset);
    data = new ArrayList<DataForChart>();
  }
  
  void parse()
  {
    //according the structured data source
    for (int i = 0; i < 66; i++)
      data.add(new DataForChart(energy.getJSONArray("series").getJSONObject(0).getJSONArray("data").getJSONArray(i).getInt(0), energy.getJSONArray("series").getJSONObject(0).getJSONArray("data").getJSONArray(i).getFloat(1)));
  }
  void show()
  {
    stroke(255);
    strokeWeight(2);
    line(100, 700, 100, 60);  //y-axis
    for (int i = 0; i < data.size(); i ++)
    {
      fill(255, 0, 0);
      rect(100 + i*17, 700, 17, -data.get(i).quanlity/15);//histogram
      if (i % 10 == 0)
      {
        fill(255);
        textFont(font, 15);
        text(data.get(i).year, 90 + i*17, 715); //year for x-axis
      }
    }
    for (int i = 0; i < 10; i++)
    {
      fill(255);
      textFont(font, 15);
      text(0 + i*1000, 50, 700-66*i); // quanlity for y-axis
    }
    fill(255);
    textFont(font, 20);
    text("Year", 1210, 715); //x-axis 
    text("World Anuual Nuclear Electric Power C/P (Trillion Btu)", 50, 50);// y-axis
    for (int i = 0; i < data.size(); i++)
    {
      //interaction
      if (mouseX>=100 + i*17 && mouseX <= 100 + (i+1)*17 && mouseY <= 700 && mouseY >=700-data.get(i).quanlity/15)
      {
        fill(255);
        textFont(font, 15);
        text(data.get(i).quanlity, 100+ i*17, 700-data.get(i).quanlity/15-10);
      }
    }
  }
}