final String Dallas = "http://api.openweathermap.org/data/2.5/weather?id=4058076&appid=44db6a862fba0b067b1930da0d769e98";  //Dallas Weather information
final String Pitt = "http://api.openweathermap.org/data/2.5/weather?id=4277241&appid=44db6a862fba0b067b1930da0d769e98";  //Pittsburg Weather information
JSONObject dallas;

boolean isLoaded = false;

void loadDoc() {
  dallas = loadJSONObject(Dallas);
  isLoaded = true;
}

void setup()
{
   size(800,800);
   thread("loadDoc");
   //document = loadJSONObject("data.json");
}
void draw() {
  background(0);
  if(isLoaded) {
  println(dallas.getJSONObject("coord").getFloat("lon"));
  stroke(255);
  strokeWeight(3);
  text(dallas.getJSONArray("weather").getJSONObject(0).getString("main"), width/2, height/2);
  }
}