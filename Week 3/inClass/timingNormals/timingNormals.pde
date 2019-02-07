float circleW, circleSpace;

float startTime, endTime;
float totalTime = 3;

color backgroundStart, backgroundEnd, bgColor;

void setup() {
  size(400, 700);
  
  circleW = 20;
  circleSpace = circleW * 2;
  startTime = millis();
  endTime = millis() + int(totalTime * 1000);

  backgroundStart = color(255, 0, 0);
  backgroundEnd = color(0, 255, 0);
  bgColor = backgroundStart;
}
void draw() {
  background(bgColor);
  
  // regular millis()
  ellipse(circleSpace, millis(), circleW, circleW);
  
  // millis divided:
  ellipse(circleSpace * 2, millis()/1000 * 10, circleW, circleW);
  
  // millis modulo:
  ellipse(circleSpace * 3, millis()%700, circleW, circleW);
  
  // millis over time:
  float normalizedTime = (millis() - startTime)/(endTime - startTime);
  //println(normalizedTime);
  ellipse(circleSpace * 4, height*normalizedTime, circleW, circleW);

  // time as the normalized force in a background lerp:
  bgColor = lerpColor(backgroundStart, backgroundEnd, normalizedTime);

  // time as the normalizing factor in a lerp between two positions:
  float xPos = lerp(0, width, normalizedTime);
  ellipse(xPos, height/2, circleW, circleW);
  // a different way of writing that:
  float xPos2 = float(width) * normalizedTime;
  ellipse(xPos2, height/2+circleSpace, circleW, circleW);
}

void keyPressed() {
  startTime = millis();
  endTime = millis() + totalTime * 1000;
}
