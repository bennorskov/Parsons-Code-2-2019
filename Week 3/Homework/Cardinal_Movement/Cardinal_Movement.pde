// square variables:
float x, y, xSpeed, ySpeed, speed;
// button variables:
float buttonLeftX, buttonRightX, buttonForwardX, buttonBackX, buttonStopX, buttonY, buttonW;

void setup() {
  size(600, 500);

  x = width/2;
  y = height/2;
  xSpeed = 0;
  ySpeed = 0;

  speed = 2;

  buttonW = 47;
  buttonLeftX = buttonW;
  buttonY = 420;
  buttonForwardX = buttonW * 3;
  buttonBackX = buttonW * 5;
  buttonRightX = buttonW * 7;
  buttonStopX = buttonW * 9;
}

void draw() {
  background(100, 200, 144);

  drawSquare();

  drawButtons();
}
void drawSquare() {
  fill(230, 180, 10);
  rect(x, y, 40 ,40);

  x += xSpeed;
  y += ySpeed;
}
void drawButtons() {
  fill(40, 60, 200);
  rectMode(CORNER);
  rect( buttonLeftX, buttonY, buttonW, buttonW);
  rect( buttonForwardX, buttonY, buttonW, buttonW);
  rect( buttonBackX, buttonY, buttonW, buttonW);
  rect( buttonRightX, buttonY, buttonW, buttonW);
  rect( buttonStopX, buttonY, buttonW, buttonW);
  //draw arrows
  fill(255);
  float buttonMiddleOffset = buttonW * .5;
  float triangleBuffer = buttonW * .1;
  triangle( buttonLeftX + buttonMiddleOffset, buttonY + triangleBuffer, buttonLeftX + buttonMiddleOffset, buttonY + buttonW - triangleBuffer, buttonLeftX + triangleBuffer, buttonY + buttonMiddleOffset);
  triangle( buttonRightX + buttonMiddleOffset, buttonY + triangleBuffer, buttonRightX + buttonMiddleOffset, buttonY + buttonW - triangleBuffer, buttonRightX + buttonW - triangleBuffer, buttonY + buttonMiddleOffset);
  triangle( buttonForwardX + triangleBuffer, buttonY + buttonMiddleOffset, buttonForwardX + buttonW - triangleBuffer, buttonY + buttonMiddleOffset, buttonForwardX + buttonMiddleOffset, buttonY + triangleBuffer);
  triangle( buttonBackX + triangleBuffer, buttonY + buttonMiddleOffset, buttonBackX + buttonW - triangleBuffer, buttonY + buttonMiddleOffset, buttonBackX + buttonMiddleOffset, buttonY + buttonW - triangleBuffer);

  rect( buttonStopX + triangleBuffer*2, buttonY + triangleBuffer*2, buttonW - triangleBuffer*4, buttonW - triangleBuffer*4);
}
void mouseClicked() {
  if (mouseY > buttonY && mouseY < buttonY + buttonW) {
    // all buttons are in a row, so test for Y first
    if (mouseX > buttonLeftX && mouseX < buttonLeftX + buttonW) {
      println("turn left clicked!");
      xSpeed = -speed;
      ySpeed = 0;
    } else if (mouseX > buttonForwardX && mouseX < buttonForwardX + buttonW) {
      // forward clicked!
      ySpeed = -speed;
      xSpeed = 0;
    } else if (mouseX > buttonBackX && mouseX < buttonBackX + buttonW) {
      // backward clicked!
      ySpeed = speed;
      xSpeed = 0;
    } else if (mouseX > buttonRightX && mouseX < buttonRightX + buttonW) {
      // turn right clicked!
      xSpeed = speed;
      ySpeed = 0;
    } else if (mouseX > buttonStopX && mouseX < buttonStopX + buttonW) {
      xSpeed = 0;
      ySpeed = 0;
    }
  }
}
