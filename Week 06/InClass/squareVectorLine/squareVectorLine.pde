PVector squarePosition = new PVector(30, 25);
PVector squareVelocity = new PVector(1, 0);

void setup() {
  size(700, 100);
  noStroke();
}
void draw() {
  background(120, 50, 130);
  rect(squarePosition.x, squarePosition.y, 50, 50);
  squarePosition.add(squareVelocity);
}
