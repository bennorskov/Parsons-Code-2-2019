class Shape {
  PVector pos;
  float w, h; // width and height are reserved variables
  color fillColor = color(255);
  color rolloverColor = color(0);
  
  String type = "";
  Shape( float _x, float _y, float _w, float _h) {
    pos = new PVector(_x, _y);
    w = _w;
    h = _h;
  }
  void display() {
    fill(255);
    ellipse(pos.x, pos.y, 4, 4);
  }
  
  void setColor ( float _grey) {
    setColor( color( _grey, _grey, _grey ) );
  }
  void setColor( float _r, float _g, float _b) {
    setColor( color(_r, _g, _b) );
  }
  void setColor( color _c) {
    fillColor = _c;
  }
  
  void setType(String _s) {
    type = _s;
  }
  
  boolean hitDetect( float mX, float mY) {
    // standard circle hit detection
    return ( dist(mX, mY, pos.x, pos.y) < w * .5);
  }
}
