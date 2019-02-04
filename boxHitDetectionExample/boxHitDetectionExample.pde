float line1X = 185;
float line2X = 256;
float line1Y = 15;
float line2Y = 160;
void setup() {
  size( 400, 300);
}
void draw() {
  background(180);
  // vertical lines
  line(line1X, 15, line1X, 160);
  line(line2X, 15, line2X, 160);

  // horizontal lines
  line(185, line1Y, 256, line1Y);
  line(185, line2Y, 256, line2Y);

  // mouse between line 1 and line 2 on the X axis
  // if ( mouse inbetween lines) {
  //if ( mouseX is greater than left line and less than right line)
  if (mouseX > line1X && mouseX < line2X) {
    if (mouseY > line1Y && mouseY < line2Y) {  
      ellipse(30, 30, 10, 10);
    }
  }
}
