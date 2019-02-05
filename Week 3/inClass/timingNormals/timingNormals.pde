float circleW, circleSpace;

int startTime, endTime;
float totalTime = 2.5;

void setup() {
  size(400, 700);
  
  circleW = 20;
  circleSpace = circleW * 2;
}
void draw() {
  background(100, 100, 0);
  
  // regular millis()
  ellipse(circleSpace, millis(), circleW, circleW);
  
  // millis divided:
  ellipse(circleSpace * 2, millis()/2500 * 100, circleW, circleW);
  
  // millis modulo:
  ellipse(circleSpace * 3, millis()%1000, circleW, circleW);
  
  // millis modulo:
  ellipse(circleSpace * 3, millis()%1000, circleW, circleW);
}

void keyPressed() {
  startTime = millis();
  endTime = millis() + int(totalTime * 1000);
}
