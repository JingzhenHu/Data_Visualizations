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
PImage firstViz;
PImage secondviz;

void setup() {
  size(800, 800);
  surface.setResizable(true);
  bg = loadImage("bg.jpg");
  readFile();                                                 //call the readFile to prepare the data
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
void generateColorAndFreq(int character) {
  if (character < 97 || character > 122) {        //assign symbols with black and store
    colorForBuffer.add(color(0)); 
    //frequency[26] ++; ignore the frequency of symbol
  } else                                            //assign character with color and store the corresponding colors
  for (int i = 0; i < 26; i++) {
    if (character == 97+i) {
      colorForBuffer.add(colors[i]);
      frequency[i]++;
      break;
    }
  }
}

void initializeColor() {
  //I just refered 26 colors on the website http://graphicdesign.stackexchange.com/questions/3682/where-can-i-find-a-large-palette-set-of-contrasting-colors-for-coloring-many-d
  /*
   colors.add(color(240, 163, 255));
   colors.add(color(0, 117, 220));
   colors.add(color(153, 63, 0));
   colors.add(color(76, 0, 92));
   colors.add(color(0, 0, 180));
   colors.add(color(0, 92, 49));
   colors.add(color(43, 206, 72));
   colors.add(color(255, 204, 153));
   colors.add(color(128, 128, 128));
   colors.add(color(148, 255, 181));
   colors.add(color(143, 124, 0));
   colors.add(color(157, 204, 0));
   colors.add(color(194, 0, 136));
   colors.add(color(194, 0, 136));
   colors.add(color(255, 164, 5));
   colors.add(color(255, 168, 187));
   colors.add(color(66, 102, 0));
   colors.add(color(255, 0, 16));
   colors.add(color(94, 241, 242));
   colors.add(color(0, 153, 143));
   colors.add(color(224, 255, 102));
   colors.add(color(116, 10, 255));
   colors.add(color(153, 0, 0));
   colors.add(color(255, 255, 128));
   colors.add(color(255, 255, 0));
   colors.add(color(255, 80, 5));*/
  for (int i=0; i<26; i++) {
    colors[i] = color(random(100, 200), random(100, 200), random(100, 200));  //random generate 26 distinct colors
  }
}
void mouseClicked() {
  status = 2;
}