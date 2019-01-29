PVector pos, velocity, target;
float easing = .01;
boolean isMoving = false;
float endDistance = 5;

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

    float distance = PVector.dist(target, pos);
    distance *= easing;
    
    velocity.normalize();
    velocity.mult(distance);
    pos.add(velocity);
    
    fill(0);
    ellipse(target.x, target.y, endDistance, endDistance);
    
    if (dist(pos.x, pos.y, target.x, target.y) < endDistance) {
      isMoving = false;
    }
  }
}

void mouseClicked() {
  target.x = mouseX;
  target.y = mouseY;
  isMoving = true;
}
