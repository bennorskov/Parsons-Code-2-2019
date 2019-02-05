float lineX = 100;

void setup() {
  size(300, 500);
}

void draw() {
  background( bgColor);
  
  
  if ( mouseX > lineX) {
    bgColor = color(0, 100, 200);
  } else {
    bgColor = color(220, 100, 200);
  }
}
