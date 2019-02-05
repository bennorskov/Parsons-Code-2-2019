float lineX = 100;
color bgColor = color(220, 100, 200);
void setup() {
  size(300, 500);
}

void draw() {
  background( bgColor);
  
  line(lineX, 0, lineX, height);
  if ( mouseX > lineX) {
    bgColor = color(0, 100, 200);
  } else {
    bgColor = color(220, 100, 200);
  }
}
