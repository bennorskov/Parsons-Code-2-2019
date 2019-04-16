PVector centerPoint = new PVector(200, 200);
float dist = 50;
int numObjects = 5;
float startOffsetAngle = 0;
void setup() {
  size(400, 400);
  colorMode(HSB, TWO_PI, 100, 100);
  noStroke();
}
void draw() {
  background(0, 10, 10);
  float incr = TWO_PI/numObjects;
  startOffsetAngle += .01;
  for (int i = 0; i<numObjects; i++) {
    float angle = i*incr + startOffsetAngle;
    float x = cos(angle) * dist + centerPoint.x;
    float y = sin(angle) * dist + centerPoint.y;
    angle -= startOffsetAngle;
    fill(angle, 100, 100);
    ellipse(x, y, 30, 30);
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
