float circ_x, circ_y;
float ampl = 250;
void setup(){
  size(600, 400);
  circ_x = width*.5;
  circ_y = height*.5;
  noStroke();
}
void draw() {
  background(30, 220, 100);
  ellipse(circ_x, circ_y, 20, 20);
  
  circ_x = sin(millis() * .002) * ampl + 300;
}
