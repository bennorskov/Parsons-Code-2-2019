PVector centerPoint = new PVector(200, 200);
float dist = 50;
int numObjects = 5;
float startOffsetAngle = 0;
void setup() {
  size(400, 400);
  colorMode(HSB, TWO_PI, 100, 100);
  noStroke();
  smooth();
}
void draw() {
  background(0, 10, 10);
  float incr = TWO_PI/numObjects;
  startOffsetAngle += .01;
  for (int i = 0; i<numObjects; i++) {
    float newDist = dist;// + sin(frameCount *.05 + i) * 20;
    float angle = i*incr + startOffsetAngle;
    float x = cos(angle) * newDist + centerPoint.x;
    float y = sin(angle) * newDist + centerPoint.y;
    angle -= startOffsetAngle;
    fill(angle, 100, 100);
    float circW = 30;// + sin(frameCount *.05 + i + PI) * 10;
    ellipse(x, y, circW, circW);
  }
}
void keyPressed() {
  switch(key) {
  case '-':
    numObjects--;
    break;
  case '=':
    numObjects++;
    break;
  }
}
