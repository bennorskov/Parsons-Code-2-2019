float circ_x, circ_y;
float circ_speed = 1;
float easeAmount = .05;
float leftSide = 50;
float rightSide = 550;
void setup() {
  size(600, 400);
  circ_x = width*.5;
  circ_y = height*.5;
  noStroke();
}
void draw() {
  background(20, 120, 100);
  ellipse(circ_x, circ_y, 20, 20);

  float toMove = 0;
  if (circ_speed > 0) {
    toMove = (rightSide - circ_x) * easeAmount * circ_speed;
    if (circ_x >= rightSide - 1) {
      circ_speed = -1;
    }
  } else {
    toMove = (circ_x - leftSide) * easeAmount * circ_speed;
    if (circ_x <= leftSide + 1) {
      circ_speed = 1;
    }
  }
  circ_x += toMove;
}
