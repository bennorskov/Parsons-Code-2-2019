/*
Catch and Release

10 points: Have a circle move on screen
25 points: have the circle bounce off the bottom and sides of the screen
25 points: Simulate Gravity on the circle
20 points: Reduce the circle's velocity when it hits the screen edges
20 points: Catch & Release the circle with your mouse
30 points: "Throw" the circle by moving and releasing your mouse quickly

*/
PVector pos, vel, acc;
float ballW = 60;
float ballH = 60;
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
  
  ellipse(pos.x, pos.y, ballW, ballH);
}
void  if (pos.x > width - ballW*.5) {
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
