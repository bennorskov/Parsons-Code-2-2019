float circ_x, circ_y;
float leftSide = 50;
float rightSide = 550;
float totalTime = 4;
float distance = rightSide - leftSide;
float scaler = 0; 
void setup() {
  size(600, 400);
  circ_x = leftSide;
  circ_y = height*.5;
  noStroke();
  totalTime *= 1000;
}
void draw() {
  background(40, 200, 200);
  ellipse(circ_x, circ_y, 20, 20);
  
  float currentTime = millis()%totalTime;
  if(currentTime > totalTime/2) {
    currentTime = totalTime - currentTime;
  }
  scaler = currentTime/(totalTime/2);
  
  circ_x = leftSide + distance * scaler;
}
