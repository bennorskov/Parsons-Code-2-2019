// HSB Color Wheel

float angle = 35;
float dist = 100;

void setup() {
  size(500, 500);
  noStroke();
}

void draw() {
  colorMode(RGB);
  background(0, 25, 51);
  colorMode(HSB, 360, 100, 100);
  
  float x = cos( radians(angle)) * dist;
  float y = sin( radians(angle)) * dist;
  
  fill(0, 0, 100);
  ellipse(250, 250, 3, 3);
  fill(angle, 100, 100);
  ellipse(x + 250, y + 250, 30, 30);
}

// Add in key presses to move the bigger circle
