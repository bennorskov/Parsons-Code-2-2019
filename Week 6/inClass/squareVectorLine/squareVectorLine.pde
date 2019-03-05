PVector squarePosition = new PVector(30, 225);
PVector squareVelocity = new PVector(0, -3);
PVector squareAcceleration = new PVector(0, .1);

void setup() {
  size(900, 900);
  noStroke();
}
void draw() {
  background(120, 50, 130);
  rect(squarePosition.x, squarePosition.y, 50, 50);
  squarePosition.add(squareVelocity);
  squareVelocity.add(squareAcceleration);
  //squareAcceleration.rotate( radians(1) );
}
void mousePressed() {
  squarePosition = new PVector(30, 225);
  squareVelocity = new PVector(5, -3);
  squareAcceleration = new PVector(0, .1);
}
