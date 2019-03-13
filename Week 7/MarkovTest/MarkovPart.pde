class MarkovPart {
  PVector turtle;
  PVector direction;
  float turnAngle = radians(4);
  float speed = 2;
  int STATE = 0;
  float[] transit = new float[4];
  MarkovPart(float _x, float _y) {
    turtle = new PVector(_x, _y);
    direction = new PVector(2, 0);
    transit[0] = .70;
    transit[1] = .145;
    transit[2] = .145;
    transit[3] = .01;
  }
  void calc() {
    wrapScreen();
    float percent = random(1);
    if (percent < transit[0]) {
      STATE = 0;
    } else if (percent > transit[0] && percent < transit[0]+transit[1]) {
      STATE = 1;
    } else if (percent < transit[0]+transit[1]+transit[2] && percent > transit[0]+transit[1]) {
      STATE = 2;
    } else {
      STATE = 3;
    }
  }
  void display() {

    strokeWeight(3);
    switch(STATE) {
    case 0:
      stroke(0);
      break;
    case 1:
      stroke(0, 255, 0);
      direction.rotate(turnAngle);
      break;
    case 2:
      stroke( 0, 0, 255);
      direction.rotate(-turnAngle);
      break;
    case 3:
      stroke(255, 25, 50);
      direction.rotate(random(PI) - HALF_PI);
    break;
    }
    point(turtle.x, turtle.y);
    turtle.add(direction);
  }
  void wrapScreen() {
    if (turtle.x > width) {
      turtle.x = 0;
    }
    if (turtle.x < 0) {
      turtle.x = width;
    }
    if (turtle.y > height) {
      turtle.y = 0;
    }
    if (turtle.y < 0) {
      turtle.y = height;
    }
  }  
}
