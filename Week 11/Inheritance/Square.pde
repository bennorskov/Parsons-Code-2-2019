class Square extends Shape {
  Square(float _x, float _y, float _w, float _h) {
    super( _x, _y,_w, _h);
    
    setColor( color(25, 230, 80) );
    setType("Square");
  }
  void display() {
    fill(fillColor);
    rect(pos.x, pos.y, w, h);
  }
  boolean hitDetect( float mX, float mY) {
    return ( !( (mX < pos.x) || (mX > pos.x + w) || (mY < pos.y) || (mY > pos.y + h) ) );
    
    //if ( (mX > pos.x) && (mX < pos.x + w) && ..
  }
}
