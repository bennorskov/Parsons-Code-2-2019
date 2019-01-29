float xPos, yPos;
float xSpeed, ySpeed;
float speed = 3;

void setup(){
  size(600, 400);
  noStroke();
}
void draw() {
  background(213,89,120);
  ellipse(xPos, yPos, 20, 20);
  
  if (mouseX > xPos) {
  	xSpeed = speed;
  } else {
  	xSpeed = -speed;
  }
  if (mouseY > yPos) {
  	ySpeed = speed;
  } else {
  	ySpeed = -speed;
  }
  xPos += xSpeed;
  yPos += ySpeed;
}
