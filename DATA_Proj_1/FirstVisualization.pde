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


void drawHeightLight(int j, int i, int size, int side) {           //for different situations of the position of Alice, just draw five circles corresponding to the five letters
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