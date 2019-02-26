float squarePosition = 30;
float squareVelocity = 1;

void setup() {
  size(700, 100);
  noStroke();
}
void draw() {
  background(120, 50, 130);
  rect(squarePosition, 25, 50, 50);
  squarePosition += squareVelocity;
}
