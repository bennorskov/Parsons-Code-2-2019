void setup() {
  noLoop();
  size(500, 500);
}
void draw() {
  translate(width*.5, height*.5);
  line(0, 0, 0, 100);
  translate(0, 100);
  pushMatrix();
  rotate(HALF_PI*.5);
  line(0, 0, 0, 70);
 
  translate(0, 70);
    pushMatrix();
    rotate(HALF_PI*.5);
    line(0, 0, 0, 50);
    popMatrix();
    pushMatrix();
    rotate(HALF_PI*-.5);
    line(0, 0, 0, 50);
    popMatrix();
  popMatrix();
  
  pushMatrix();
    rotate(HALF_PI*-.5);
    line(0, 0, 0, 70);

    translate(0, 70);
    pushMatrix();
    rotate(HALF_PI*.5);
    line(0, 0, 0, 50);
    popMatrix();
    pushMatrix();
    rotate(HALF_PI*-.5);
    line(0, 0, 0, 50);
    popMatrix();
  
  popMatrix();
  
  
}
