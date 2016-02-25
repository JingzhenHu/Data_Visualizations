class VisualizationI {
  Table table;
  DataForMap[] informs;
  PImage bg;
  int totalMW;   //383513
  final float FACTOR = 234.0; // to scale to image size

  VisualizationI(String csvName) {
    bg = loadImage("http://upload.wikimedia.org/wikipedia/commons/thumb/4/4f/Kavraiskiy_VII_projection_SW.jpg/1280px-Kavraiskiy_VII_projection_SW.jpg");
    imageMode(CENTER);
    table = loadTable(csvName, "header");
    informs = new DataForMap[table.getRowCount()];
    totalMW = 0;
  }
  void parse() {
    int i = 0;
    for (TableRow row : table.rows())
    {
      informs[i] = new DataForMap(row.getString("CountryName"), new PVector(row.getFloat("Longitude"), row.getFloat("Latitude")), row.getInt("Number"), row.getInt("MW"));
      totalMW += informs[i].hiddenValue;
      i++;
    }
  }
  void show()
  {
    pushMatrix();
    translate(width/2, height/2);
    //tint(128);
    image(bg, 0, 0);
    for (int i = 0; i < informs.length; i++)
    {
      setPoint(informs[i]);
    }
    popMatrix();
  }
  void setPoint(DataForMap data) {
    noFill();
    stroke(255, 200, 10);
    ellipseMode(CENTER);
    float xp = kavraX(radians(data.loc.x), radians(data.loc.y))*FACTOR;
    float yp = kavraY(radians(data.loc.x), radians(data.loc.y))*FACTOR;
    strokeWeight(2);
    fill(255, 0, 0);
    ellipse(xp, yp, data.numRadius, data.numRadius);
    if (mouseX>=xp - data.numRadius/2 && mouseX <= xp + data.numRadius/2 && mouseY>=yp - data.numRadius/2 && mouseY <= yp + data.numRadius/2)
    {
      textFont(font, 15);
      text(data.countryName, xp + 10, yp);
    }
  }

  /// mapping
  float kavraX (float longitude, float latitude) { // Kavra for Kavrayskiy 
    // formula from http://en.wikipedia.org/wiki/Kavrayskiy_VII_projection
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
    for (int i = 0; i < 66; i++)
      data.add(new DataForChart(energy.getJSONArray("series").getJSONObject(0).getJSONArray("data").getJSONArray(i).getInt(0), energy.getJSONArray("series").getJSONObject(0).getJSONArray("data").getJSONArray(i).getFloat(1)));
  }
  void show()
  {
    stroke(255);
    strokeWeight(2);
    line(83, 700, 83, 60);
    for (int i = 0; i < data.size(); i ++)
    {
      fill(255, 0, 0);
      rect(100 + i*17, 700, -17, -data.get(i).quanlity/15);
      if (i % 10 == 0)
      {
        fill(255);
        textFont(font, 15);
        text(data.get(i).year, 80 + i*17, 715);
      }
    }
    for(int i = 0; i < 10 ; i++)
    {
       fill(255);
       textFont(font, 15);
       text(0 + i*1000, 50, 700-66*i);
    }
    fill(255);
    textFont(font, 20);
    text("Year", 1210, 715);
    text("World Anuual Nuclear Electric Power C/P (Trillion Btu)", 50, 50);
  }
}