class Bolt {
  float xPos, yPos;
  Bolt(float _startX, float _startY) {
    xPos = _startX;
    yPos = _startY;
  }
  void move() {
    xPos += 1;
  }
  void display() {
    float _x = xPos;
    float _y = yPos;
    noStroke();
    fill(240, 230, 10);
    beginShape();
    vertex(_x, _y);
    vertex(_x+15, _y+60);
    vertex(_x+3, _y+50);
    vertex(_x+10, _y+100);
    vertex(_x-8, _y+33);
    vertex(_x+5, _y+45);
    endShape();
  }
}
