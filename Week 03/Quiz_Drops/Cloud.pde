class Cloud {
  float x, y;
  float xSpeed;
  color fillColor;
  Cloud() {
    x = random(width);
    y = random(height/3 * 2);
    xSpeed = random(.1, 2);
    xSpeed = (random(2) > 1) ? xSpeed : xSpeed*-1;
    fillColor = color(240, 240, 240, 20);
  }
  void update(){
    x += xSpeed;
    if (x > width || x < -100) {
      x = random(width);
      y = random(height/2);
    }
  }
  void display() {
    fill(fillColor);
    ellipse(x, y, 20, 20);
    ellipse(x + 20, y-10, 40, 40);
    ellipse(x + 40, y, 20, 20);
  }
}
