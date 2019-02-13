class CircleButton {
  float x, y, w;
  int STATE = 0;
  CircleButton(float _x, float _y, float _w) {
    x = _x;
    y = _y;
    w = _w;
  }
  void display() {
    if (dist(mouseX, mouseY, x, y) < w/2) {
      stroke(200, 200, 0);
      strokeWeight(1);
    } else {
      noStroke();
    }
    if (STATE == 0) {
      fill(255, 0, 0);
    } else if (STATE == 1) {
      fill(0, 255, 0);
    } else if (STATE == 2) {
      fill( 0, 0, 255);
    }
    ellipse(x, y, w, w);
  }
  void handleClick() {
    if (dist(mouseX, mouseY, x, y) < w/2) {
      STATE++;
      if (STATE > 2) {
        STATE = 0;
      }
    }
  }
}
