class Triangle extends Shape {
  Triangle( float _x, float _y, float _w, float _h) {
    super( _x, _y,_w, _h);
    setColor( color(200, 30, 130) );
    setType("Triangle");
  }
  void display() {
    fill( fillColor );
    triangle( pos.x, pos.y - h * .5, pos.x + w*.5, pos.y + h * .3, pos.x - w*.5, pos.y + h * .3); 
    super.display();
  }
}
