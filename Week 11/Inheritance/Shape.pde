class Shape {
  PVector pos;
  float w, h; // width and height are reserved variables
  color fillColor = color(255);
  color rolloverColor = color(0);
  Shape( float _x, float _y, float _w, float _h) {
    pos = new PVector(_x, _y);
    w = _w;
    h = _h;
  }
  void display() {}
  void setColor( float r, float g, float b) {
    setColor( color(r, g, b) );
  }
  void setColor( color _c) {
    fillColor = _c;
  }
  boolean hitDetect( float mX, float mY) {
    // standard circle hit detection
    return ( dist(mX, mY, pos.x, pos.y) < w * .5);
  }
}
