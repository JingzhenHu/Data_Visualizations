void displayFirstVisualization() {
  /*
  background(255);
  loadPixels();
  for (int i=0; i < width*height ; i++) {
    if(i < colorForBuffer.size())
      pixels[i] = colorForBuffer.get(i);
  }
  updatePixels();
  */
  background(255); 
  //calculate the size and side of square in visualization
  int side = ceil(sqrt(colorForBuffer.size()));                        //calculate how many squares each row or column
  int len = width > height? height : width;                            //judge the shorter side of the canvas and choose it
  float size = round(len*1.0 / side);                                         // claculate the sizes of squares
  int index = 0;                                                       // to obtain the color correspondingly and judge the keyword 'Alice'
  
  for (int i = 0; i < side && index < colorForBuffer.size(); i++) {    //draw the rectangulars 
    for (int j = 0; j < side && index < colorForBuffer.size(); j++) {
      strokeWeight(1);
      stroke(255);
      fill(colorForBuffer.get(index));
      rect(j*size, i*size, size, size);
      
      for (int k = 0; k < indexOfAlice.size(); k++) {                  //heightlight the keyword 'Alice'
        if (index == indexOfAlice.get(k)) {
          drawHeightLight(j, i, size, side);
        }
      }
      index++;
      if (index == indexOfAlice.get(indexOfAlice.size()-1)) {         //heightLight the keyword 'Alice' if the word is at the end
        drawHeightLight(j+1, i, size, side);
      }
    }
  }
}


void drawHeightLight(int j, int i, float size, int side) {           //for different situations of the position of Alice, just draw five circles corresponding to the five letters
  stroke(255, 0, 0);
  fill(255, 0, 0);  
  if (j > 4)
  {
    for(int k =0; k < 5; k++ )
    {
      ellipse((j-k)*size - size/2, i*size + size/2, size, size);
    }
    /*
   ellipse(j*size - size/2, i*size + size/2, size, size);
   ellipse((j-1)*size - size/2, i*size + size/2, size, size);
   ellipse((j-2)*size - size/2, i*size + size/2, size, size);
   ellipse((j-3)*size - size/2, i*size + size/2, size, size);
   ellipse((j-4)*size - size/2, i*size + size/2, size, size);
   */
  } 
  else if (j == 0) 
  {
    for(int k =0; k < 5; k++ )
    {
      ellipse((side-k)*size - size/2, (i-1)*size + size/2, size, size);
    }
    /*
   ellipse(side*size - size/2, (i-1)*size + size/2, size, size);
   ellipse((side-1)*size - size/2, (i-1)*size + size/2, size, size);
   ellipse((side-2)*size - size/2, (i-1)*size + size/2, size, size);
   ellipse((side-3)*size - size/2, (i-1)*size + size/2, size, size);
   ellipse((side-4)*size - size/2, (i-1)*size + size/2, size, size);
   */
  }
  else if (j == 1)
  {
   ellipse(j*size - size/2, i*size + size/2, size, size);
   ellipse(side*size - size/2, (i-1)*size + size/2, size, size);
   ellipse((side-1)*size - size/2, (i-1)*size + size/2, size, size);
   ellipse((side-2)*size - size/2, (i-1)*size + size/2, size, size);
   ellipse((side-3)*size - size/2, (i-1)*size + size/2, size, size);
  } 
  else if (j == 2)
  {
   ellipse(j*size - size/2, i*size + size/2, size, size);
   ellipse((j-1)*size - size/2, i*size + size/2, size, size);
   ellipse(side*size - size/2, (i-1)*size + size/2, size, size);
   ellipse((side-1)*size - size/2, (i-1)*size + size/2, size, size);
   ellipse((side-2)*size - size/2, (i-1)*size + size/2, size, size);
  } 
  else if (j == 3)
  {
   ellipse(j*size - size/2, i*size + size/2, size, size);
   ellipse((j-1)*size - size/2, i*size + size/2, size, size);
   ellipse((j-2)*size - size/2, i*size + size/2, size, size);
   ellipse(side*size - size/2, (i-1)*size + size/2, size, size);
   ellipse((side-1)*size - size/2, (i-1)*size + size/2, size, size);
  } 
  else if (j == 4)
  {
   ellipse(j*size - size/2, i*size + size/2, size, size);
   ellipse((j-1)*size - size/2, i*size + size/2, size, size);
   ellipse((j-2)*size - size/2, i*size + size/2, size, size);
   ellipse((j-3)*size - size/2, i*size + size/2, size, size);
   ellipse(side*size - size/2, (i-1)*size + size/2, size, size);
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