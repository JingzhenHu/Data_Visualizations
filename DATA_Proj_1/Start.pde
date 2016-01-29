void displayStart() {
  image(bg, 0, 0, width, height);               
  PFont font;
  font = createFont("VeraMoIt.ttf", 20);
  fill(0, 100, 150);
  textFont(font);
  //textSize(32);
  text("First Press the 's' to view the first visualization!", width/6, height/3);
  text("Second Click the screen to view the second visualization!", width/9, 2*height/3);
}