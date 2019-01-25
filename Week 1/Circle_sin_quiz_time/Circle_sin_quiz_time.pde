float circ_x, circ_y;
float ampl = 250;
float timer;
float period = 4;
void setup(){
  size(600, 400);
  circ_x = width*.5;
  circ_y = height*.5;
  timer = millis();
  period *= 1000;
  noStroke();
}
void draw() {
  background(30, 20, 240);
  ellipse(circ_x, circ_y, 20, 20);
  
  timer = millis()%period * (TWO_PI/period);
  circ_x = sin(timer) * ampl + 300;
}
