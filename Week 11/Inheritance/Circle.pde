class Circle extends Shape {
  Circle(float _x, float _y, float _w, float _h) {
    super( _x, _y,_w, _h);
    setColor(100, 50, 230);
  }
  void display() {
    fill(fillColor);
    ellipse(pos.x, pos.y, w, h);
  }
}
