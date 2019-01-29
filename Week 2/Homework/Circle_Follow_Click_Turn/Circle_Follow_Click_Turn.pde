  PVector pos, velocity, target;
float speed = 3;
boolean isMoving = false;

void setup() {
  size(600, 400);
  noStroke();
  pos = new PVector( 200, 300 );
  velocity = new PVector();
  target = new PVector();
}
void draw() {
  background(213, 89, 120);
  fill(255);
  pushMatrix();
  translate(pos.x, pos.y);
  rotate( velocity.heading() );
  triangle(0, 0, -20, 5, -20, -5);
  popMatrix();

  if (isMoving == true) {
    velocity.x = target.x - pos.x;
    velocity.y = target.y - pos.y;
    velocity.normalize();
    velocity.mult(speed);
    pos.add(velocity);
    
    fill(0);
    ellipse(target.x, target.y, 5, 5);
    
    if (dist(pos.x, pos.y, target.x, target.y) < speed) {
      isMoving = false;
    }
  }
}

void mouseClicked() {
  target.x = mouseX;
  target.y = mouseY;
  isMoving = true;
}
