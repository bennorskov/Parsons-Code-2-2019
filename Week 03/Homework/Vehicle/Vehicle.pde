PVector carDirection, pos;
float speed, turnSpeed;
float carW, carH;

float buttonLeftX, buttonRightX, buttonForwardX, buttonBackX, buttonY, buttonW;

void setup() {
  size(600, 400);
  carDirection = new PVector(1, 0);
  pos = new PVector(300, 200);

  speed = .2;
  turnSpeed = 10; // in degrees
  turnSpeed *= TWO_PI/360; // in radians

  carW = 30;
  carH = 60;

  
  buttonW = 50;
  buttonLeftX = buttonW;
  buttonY = 320;
  buttonForwardX = buttonW * 3;
  buttonBackX = buttonW * 5;
  buttonRightX = buttonW * 7;
}
void draw() {
  background(100, 100, 244);

  drawCar();

  moveCar();

  drawButtons();
}
void drawCar() {
  fill(255);
  pushMatrix();
  translate(pos.x, pos.y);
  rotate( carDirection.heading() + HALF_PI );
  rectMode(CENTER);
  rect(0, 0, carW, carH );
  popMatrix();
}
void moveCar() {
  PVector toMove = new PVector(carDirection.x, carDirection.y);
  toMove.mult(speed);
  pos.add( toMove );
}
void drawButtons() {
  fill(40, 60, 200);
  rectMode(CORNER);
  rect( buttonLeftX, buttonY, buttonW, buttonW);
  rect( buttonForwardX, buttonY, buttonW, buttonW);
  rect( buttonBackX, buttonY, buttonW, buttonW);
  rect( buttonRightX, buttonY, buttonW, buttonW);
  //draw arrows
  fill(255);
  float buttonMiddleOffset = buttonW * .5;
  float triangleBuffer = buttonW * .1;
  triangle( buttonLeftX + buttonMiddleOffset, buttonY + triangleBuffer, buttonLeftX + buttonMiddleOffset, buttonY + buttonW - triangleBuffer, buttonLeftX + triangleBuffer, buttonY + buttonMiddleOffset);
  triangle( buttonRightX + buttonMiddleOffset, buttonY + triangleBuffer, buttonRightX + buttonMiddleOffset, buttonY + buttonW - triangleBuffer, buttonRightX + buttonW - triangleBuffer, buttonY + buttonMiddleOffset);
  triangle( buttonForwardX + triangleBuffer, buttonY + buttonMiddleOffset, buttonForwardX + buttonW - triangleBuffer, buttonY + buttonMiddleOffset, buttonForwardX + buttonMiddleOffset, buttonY + triangleBuffer);
  triangle( buttonBackX + triangleBuffer, buttonY + buttonMiddleOffset, buttonBackX + buttonW - triangleBuffer, buttonY + buttonMiddleOffset, buttonBackX + buttonMiddleOffset, buttonY + buttonW - triangleBuffer);
}
void mouseClicked() {
  if (mouseY > buttonY && mouseY < buttonY + buttonW) {
    // all buttons are in a row, so test for Y first
    if (mouseX > buttonLeftX && mouseX < buttonLeftX + buttonW) {
      println("turn left clicked!");
      carDirection.rotate(-turnSpeed);
    } else if (mouseX > buttonForwardX && mouseX < buttonForwardX + buttonW) {
      // forward clicked!
      speed += .2;
    } else if (mouseX > buttonBackX && mouseX < buttonBackX + buttonW) {
      // backward clicked!
      speed -= .2;
    } else if (mouseX > buttonRightX && mouseX < buttonRightX + buttonW) {
      // turn right clicked!
      carDirection.rotate(turnSpeed);
    }
  }
}
