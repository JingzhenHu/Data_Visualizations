class DataForChart{
 int year;
 float quanlity;
 
 DataForChart()
 {
   year = 0;
   quanlity = 0;
 }
 DataForChart(int year, float quanlity)
 {
   this.year = year;
   this.quanlity = quanlity;
 }
 void setYear(int year)
 {
   this.year = year;
 }
 void setQuanlity(float quanlity)
 {
   this.quanlity = quanlity;
 }
}

class DataForMap {
 String countryName;
 PVector loc;
 int numRadius;
 int hiddenValue;
 DataForMap(String countryName, PVector loc, int numRadius, int hiddenValue)
 {
    this.countryName = countryName;
    this.loc = loc;
    this.numRadius = numRadius;
    this.hiddenValue = hiddenValue;
 }
}