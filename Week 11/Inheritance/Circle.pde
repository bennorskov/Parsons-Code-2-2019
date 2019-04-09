class Circle extends Shape {
  Circle(float _x, float _y, float _w) {
    super( _x, _y, _w, _w);
    setColor(100, 50, 230);
    setType("Circle");
  }
  void display() {
    fill(fillColor);
    ellipse(pos.x, pos.y, w, h);
    super.display();
  }
}
