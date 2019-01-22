float circ_x, circ_y;
float circ_speed = 2;
void setup(){
  size(600, 400);
  circ_x = width*.5;
  circ_y = height*.5;
  noStroke();
}
void draw() {
  background(240, 20, 100);
  ellipse(circ_x, circ_y, 20, 20);
  
  circ_x += circ_speed;
  if (circ_x > 550) {
    circ_speed = -2;
  }
  if (circ_x < 50) {
    circ_speed = 2;
  }
}
