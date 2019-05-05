// HSB Color Wheel
/*
Hue: 0 => 360
 Saturation: 0 => 100
 Brightness: 0 => 100
 */
int angle = 118;
float dist = 100;

void setup() {
  size(500, 500);
  noStroke();
  colorMode(RGB);
  background(0, 25, 51);
}

void draw() {
  //colorMode(RGB, 1000, 1000, 2);
  //background(0, 200, .4);
  colorMode(HSB, 360, 100, 100);

  dist = pow(cos( radians(angle * 3)), 3) * 100 + 50;

  float x = cos( radians(angle)) * dist;
  float y = sin( radians(angle)) * dist;

  fill(0, 0, 100);
  ellipse(250, 250, 3, 3);
  fill(angle, 100, 100);
  ellipse(x + 250, y + 250, 30, 30);

  //angle += 1;
  //385 / 360 = 1 r 25 
  //println(angle, angle/360, angle % 360);
  //angle = int( atan(( mouseY - 250)/(mouseX - 250) ));
  //angle = int( degrees( atan2( mouseY - 250, mouseX - 250) ) );

  angle %= 360;
  if (angle < 0) angle+= 360;
}
void keyPressed() {
  if (key == '=') {
    angle += 3;
  }
  if (key == '-') {
    angle-=5;
  }
}

// Add in key presses to move the bigger circle
