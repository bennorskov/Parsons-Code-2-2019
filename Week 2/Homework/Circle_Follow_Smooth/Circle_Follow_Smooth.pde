PVector pos, velocity;
float speed = 3;

void setup(){
  size(600, 400);
  noStroke();
  pos = new PVector();
  velocity = new PVector();
}
void draw() {
  background(213,89,120);
  ellipse(pos.x, pos.y, 20, 20);
  
  velocity.x = mouseX - pos.x;
  velocity.y = mouseY - pos.y;
  velocity.normalize();
  velocity.mult(speed);
  pos.add(velocity);
}
