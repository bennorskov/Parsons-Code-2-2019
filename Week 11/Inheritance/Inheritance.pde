Triangle t;
Circle c;
Square s;
int numShapes = 42;
//Shape[] shapes = new Shape[numShapes];

ArrayList<Shape> polys = new ArrayList<Shape>();

void setup () {
  size(500, 500);
  
  for (int i = 0; i<numShapes; i++) {
    switch (i%3) {
      case 0:
      //shapes[i] = new Triangle(random(width), random(height), 40, 40);
      polys.add( new Triangle(random(width), random(height), 40, 40) );
      break;
      case 1:
      // shapes[i] = new Circle(random(width), random(height), random(10, 160));
      polys.add( new Circle(random(width), random(height), random(10, 160)) );
      break;
      case 2:
      //shapes[i] = new Square(random(width), random(height), 40, 60);
      polys.add( new Square(random(width), random(height), 40, 60) );
      break;
    }
  }
  noStroke();
  //t = new Triangle(50, 50, 40, 40);
  //c = new Circle( 100, 150, 40);
  //s = new Square( 300,200, 60, 30);
  //noStroke();
  //s.setColor( 180 );
}
void draw() {
  background(0);
  
  for (int i = 0; i < numShapes; i++ ) {
    Shape qw = shapes[i];
    qw.display();
  }
  // foreach ( Shape s in shapes ) {}
  for( Shape s : shapes ) {
    s.display();
  }
  
  //t.display();
  //c.display();
  //s.display();
}

void mousePressed() {
  for( Shape s : shapes ) {
    if (s.hitDetect(mouseX, mouseY)) { 
    println( "You got a " + s.type + "!" );
  }
  }
}
