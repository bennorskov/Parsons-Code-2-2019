class Drop {
  float x, y;
  float ySpeed;
  color startColor, endColor;
  Drop() {
  	x = random(width);
  	y = -random(height);
  	ySpeed = random(2, 8);

  	startColor = color(100, 140, 250);
  	endColor = startColor/3;

  }
  void update(){
  	y+=ySpeed;
  	if (y > height) {
  		// reset if offscreen
  		y = -random(height);
  	}
  }
  void display() {
  	// lerpColor returns a value between two colors based on a normalized number
  	// lerpColor( first color, second color, normalized number (between 0 and 1) );
  	// first color is when you're at 0
  	// second color is when you're at 1
  	// a value exactly inbetween is .5
  	fill( lerpColor(startColor, endColor, y/float(height) ));
  	ellipse(x, y, 10, 10);
  }
}
