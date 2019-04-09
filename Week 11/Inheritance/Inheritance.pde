Triangle t;
Circle c;
Square s;
void setup () {
  size(500, 500);
  
  t = new Triangle(50, 50, 40, 40);
  c = new Circle( 100, 150, 40, 40);
  s = new Square( 300,200, 60, 30);
  noStroke();
}
void draw() {
  t.display();
  c.display();
  s.display();
  
  println( c.hitDetect(mouseX, mouseY) );
}
