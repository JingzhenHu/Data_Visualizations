void displaySecondVisulaization() { 
  background(255);
  float startRad =0.0;                              //starting radian for arc
  float stopRad = 0.0;                              // ending radian for arc 
  int[] index = checkFrequencies(frequency);        // calculate the max and min frequencies
  for (int i = 0; i< frequency.length; i++) {       //Draw the Sector Diagram to classify the frequency and color
    stopRad += ((frequency[i]*1.0/index[2])*2*PI);  //use sumOfFreq to ignore the symbols
    noStroke();    
    if (i == index[0] || i == index[1]) {           //heightlight the max and min in the sector diagram with stroke of arc
      stroke(0);
      strokeWeight(3);
    }
    fill(colors[i]);                            //fill each arc with corresponding color and proportion
    arc(width/3, height/2, 300, 300, startRad, stopRad);
    startRad += ((frequency[i]*1.0/index[2])*2*PI);
  }
  //store the 26 letters in an array to use in loop
  char[] characters = {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'};
  for (int i = 0; i < characters.length; i++) {    //text each letter, its frequency, and its colored line
    stroke(colors[i]);
    fill(colors[i]);
    text(characters[i] + " " + frequency[i], width/1.5, height*(i+1)/29);
    strokeWeight(6);
    line(width/1.1, height*(i+1)/29, width/1.3, height*(i+1)/29);
    
    if (i == index[0]) {                           //height the max and min freuqency with a label and a retangular around
      text("Max", width/1.7, height*(i+1)/29);
      noFill();
      strokeWeight(2);
      rect(width/1.7, height*i/29 + height/90, width/1.08 - width/1.67, height/29-height/120);
    }
    if (i == index[1]) {
      text("Min", width/1.7, height*(i+1)/29);
      noFill();
      strokeWeight(2);
      rect(width/1.7, height*i/29 + height/80, width/1.08 - width/1.67, height/29-height/120);
    }
  }  
  text("Num of Alice " + numOfAlice, width/1.5, height*28/29);      //print put the freuency of the key word 'Alice'
}

//calculate the max frequency and min frequency and store them into an array and return
//If there exist multiple most and least, it will just ouput the former alphabet in the letter order
int[] checkFrequencies(int[] frequency) {
  int sumOfFreq = 0;
  for(int i = 0; i < frequency.length; i++) {
    sumOfFreq += frequency[i];
  }
  int max = frequency[0];
  int min = frequency[0];
  int indexMax = 0;
  int indexMin = 0;
  for (int i =0; i < frequency.length - 1; i++) {
    if (frequency[i] > max) {
      max = frequency[i];
      indexMax = i;
    }
    if (frequency[i] < min) {
      min = frequency[i];
      indexMin = i;
    }
  }
  int[] index = {indexMax, indexMin, sumOfFreq};
  return index;
}