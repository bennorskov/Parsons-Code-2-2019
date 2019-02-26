

float x, y, time;
float speed = 1;
float waveHeight = 30;
void setup() {
  size(600, 200);
  y = height/2;
}

void draw() {
  //background(200);
  x += speed; 
  point(x, y + sin(x*.05) * waveHeight);
  //point(x, y + cos(x*.05) * waveHeight);
}
