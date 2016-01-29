/*
  Jingzhen(Journey) Hu's project 1 
 This project read from the a novel and set up a color rule for 26 characters and symbol.
 Then, after normalizing (case-insensitive), judging and sorting the datas input, I record the frequencies of the letters and generate rectangulars to represent the datas.
 In the process, I also searched for the keyword 'Alice', counted the frequencies, and highlighed them in the canvas.
 Finally, the frequencies display in a sector diagram.
 It has three displays. 
 The start tells people how to interact.
 The firstVisualization shows the colors in the same order as the text input and the highlights keyword 'Alice'.
 The secondVisualization shows the frequencies.
 */
BufferedReader reader;
final String FILENAME = "Alice.txt";
int status = 0;                                               //switch to different displays
int[] frequency = new int[26];                                //contain frequencies of 26 characters and the symbols
color[] colors = new color[26];                               //store 26 different random colors corresponding 26 characters (the symbols should be black)
int numOfAlice = 0;                                           //count the number of occurance of the word "Alice" (case-insensitive)
ArrayList<Integer> colorForBuffer = new ArrayList<Integer>(); //corresponding to the bufferChar arraylist
ArrayList<Integer> indexOfAlice = new ArrayList<Integer>();   //contain the index of the word 'Alice' each time it occurs in the bufferChar
PImage bg;                                                    //background image
float startRad =0.0;                                          //starting radian for arc for the second Visulaization's Arc
float stopRad = 0.0;                                          //ending radian for arc for the second Visualization's Arc
int[] index = {};                                             //calculate the max & min frequencies, and sum up all the frequency in the array
int side;                                                     //the number of square on each side in the first viz
int size;                                                     //the size of each square in the first viz 
//store the 26 letters in an array to use conveniently in the second visutalization
char[] characters = {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'};

void setup() {
  size(800, 800);
  surface.setResizable(true);
  bg = loadImage("bg.jpg");
  readFile();                                                 //call the readFile to prepare the data
  prepareForDraw();                                           //calculate the basic variable to first and second viz
}

void draw() {                                                 //three displays and their corresponidng control
  if (status == 0) {
    displayStart();
  }
  if (status == 1) {
    displayFirstVisualization();
  }
  if (status == 2) {
    displaySecondVisulaization();
  }
  if (keyPressed) {
    if (key == 's' || key == 'S') {
      status = 1;
    }
  }
}

void readFile() {
  reader = createReader(FILENAME);
  initializeColor();
  int order = 0;                                  //store the ordinal number in the iterative processes which is used for record the indexOfAlice
  try {
    int character = reader.read();                //read and store the input stream characters by characters    
    while (character != -1) {                     //judge whether reached the end of the file   
      if (character >= 65 && character <= 90 ) {  //convert every character to the lowercase using ASCII
        character += 32;
      }
      generateColorAndFreq(character);            //call the method to generate 26 distinct colors and black for symbols
      character = reader.read();
      order ++;
      if (checkAlice(character, order)) {         //for each character that call the checkAclice method to check the key word
        indexOfAlice.add(order+1);                //store the position of the last letter 'e' in the indexOfAlice array
        numOfAlice ++;                            //record the frequency of the keyword 'Alice' (case-insensitive)
      }
    }
  }
  catch(IOException e) {
    println("Cannot read from the sourse file >_<!!!");
    e.printStackTrace();
  }
}

void initializeColor() {
  for (int i=0; i<26; i++) {
    colors[i] = color(random(100, 200), random(100, 200), random(100, 200));  //random generate 26 distinct colors
  }
}

void generateColorAndFreq(int character) {
  if (character < 97 || character > 122) {        //assign symbols with black and store
    colorForBuffer.add(color(0)); 
    // ignore the frequency of symbol
  } 
  else                                            //assign character with color and store the corresponding colors
  for (int i = 0; i < 26; i++) {
    if (character == 97+i) {
      colorForBuffer.add(colors[i]);
      frequency[i]++;
      break;
    }
  }
}

boolean checkAlice(int character, int order) {                     //check if there is a word 'Alice'
  boolean isAlice = false;
  int[] on_off = {1, 1, 1, 1, 1};                                  // each for one character
  
  if (character == 101 || character == 69) {                       //check if encountering the last character of Alice, 'e'; the following check form 'e' to 'a'
    on_off[0] = 0;
    if (order >= 4)
    {
      if (colorForBuffer.get(order-1) == colors[2]) {              //colors[2] which means the color of 'c'
        on_off[1] = 0;
        if (colorForBuffer.get(order-2) == colors[8]) {            //colors[8] which means the color of 'i'
          on_off[2] = 0;
          if (colorForBuffer.get(order-3) == colors[11]) {         //colors[11] which means the color of 'l'
            on_off[3] = 0;
            if (colorForBuffer.get(order-4) == colors[0]) {        //colors[0] which means the color of 'a'
              on_off[4] = 0;
            }
          }
        }
      }
    }
  }
  
  int sum = 0;                                                   //sum all of the data in on_off in order to judge
  for (int j =0; j < on_off.length; j++) {
    sum += on_off[j];
  }
  if (sum == 0) {                                                //if all the letters fit in the order are true, then it is Alice
    isAlice = true;
  }
  return isAlice;
}


void  prepareForDraw() {
  index = checkFrequencies(frequency);                                       //prepare the frequencies' things; index[0] = indexMax; index[1] = indexMin; index[2] = sumofFreq     
  //calculate the size and side of square in first visualization
  side = ceil(sqrt(colorForBuffer.size()));                        //calculate how many squares each row or column
  int len = width > height? height : width;                            //judge the shorter side of the canvas and choose it
  size = round(len*1.0 / side);                                    // claculate the sizes of squares 
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
void mouseClicked() {
  status = 2;
}