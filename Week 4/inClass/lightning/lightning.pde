void setup() {
  size(400, 750);
}
void draw() {
  background(0, 30, 100);
  drawLightningBolt(50, 200);
  int numBolts = 200;
  for (int i = 0; i < numBolts; i++) {
    drawLightningBolt(random(width), random(height));
    //drawLightningBolt(i, i);
    //drawLightningBolt(i%10*width/10, i/30 * height/6);
  }
}
void drawLightningBolt(float _x, float _y) {
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
