class Visualization {
  JSONObject energy;
  ArrayList<Data> data;
  Visualization(String dataset)
  {
    energy = loadJSONObject(dataset);
    data = new ArrayList<Data>();
  }
  void parse()
  {
    for(int i = 0; i < 64; i++)
     data.add(new Data(energy.getJSONArray("series").getJSONObject(0).getJSONArray("data").getJSONArray(i).getInt(0), energy.getJSONArray("series").getJSONObject(0).getJSONArray("data").getJSONArray(i).getFloat(1))); 
  }
  void show()
  {
    stroke(178);
    strokeWeight(2);
    //println(data.get(0).year);
    text(data.get(0).year, width/2, height/2);
  }
}