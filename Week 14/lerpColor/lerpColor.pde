// Smoothin' and Lerpin
float lerpAmount = 0;

float xStart = 20;
float xEnd = 440;

float yStart = 45;
float yEnd = 374;

color zeroColor = color(230, 30, 100);
color oneColor = color(56, 130, 225);

float lengthInMillis = 1500;
int startTime = 0; //set on mouse click

void setup () {
  size(600, 400);
  noStroke();
  smooth();
}

void draw() {
  background(27, 0, 52);

  float x = lerp(xStart, width/2, lerpAmount);
  float y = lerp(yStart, height/2, lerpAmount);

  color lerpFill = lerpColor(zeroColor, oneColor, lerpAmount);
  fill(lerpFill);
  ellipse(x, y, 30, 30);

  //lerpAmount += .001;
  //lerpAmount = min( lerpAmount, 1);
  println(lerpAmount);
  
   lerpAmount = 1 - pow( 1- returnEaseAmount(), 4);
   
  //lerpAmount = 1-pow( 1-returnEaseAmount(), 3);
   
  /* // if you want to do some springy stuff, ElasticEaseOut:
  float time = returnEaseAmount();
  float springyness = .2; // lower number is more springy
  lerpAmount = pow(2, -10*time) * sin((time-springyness/4)*(2*PI)/springyness) + 1;
  */
}
float returnEaseAmount() {
  // localTime is to see where to start the function
  float localTime = millis()-startTime;
  // divide the part by the total for a percentage:
  float toReturn = localTime/lengthInMillis;
  // clamp the percentage to 1. (Beyond 1 means it doesn't stop)
  toReturn = min(toReturn, 1);
  return toReturn;
}
void mouseClicked() {
  startTime = millis();
  xStart = mouseX;
  yStart = mouseY;
}
