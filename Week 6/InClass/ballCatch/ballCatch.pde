PVector pos, vel, acc;
float ballW = 60;
PVector gravity = new PVector(0, 2);
boolean isCaught = false;
void setup() {
  size(700, 600);
  
  pos = new PVector(200, 200);
  vel = new PVector(0, 0);
  acc = new PVector(0, 0);
}
void draw() {
  background(200);
  
  if (!isCaught) {
    acc = new PVector(0, 0);
    acc.add(gravity);
    vel.add(acc);
    pos.add(vel);
    checkBounds();
  } else {
    pos.x = mouseX;
    pos.y = mouseY;
  }
  
  ellipse(pos.x, pos.y, ballW, ballW);
}
void checkBounds() {
  if (pos.x > width - ballW*.5) {
    pos.x = width - ballW*.5;
    vel.x *= -.8;
  } else if (pos.x < ballW*.5) {
    pos.x = ballW*.5;
    vel.x *= -.8;
  }
  
  if (pos.y > height - ballW*.5) {
    if (vel.y > 0) vel.y *= -.8;
    pos.y = height - ballW*.5;
  } 
}
void mousePressed() {
  if (dist(mouseX, mouseY, pos.x, pos.y) < ballW) {
    isCaught = true;
  }
}
void mouseReleased() {
  if (isCaught) {
    isCaught = false;
    float x = -pmouseX + mouseX;
    float y = -pmouseY + mouseY;
    vel = new PVector(x, y);
  }
}
