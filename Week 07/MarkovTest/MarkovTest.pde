ArrayList<MarkovPart> mks;
float speed = 2;
void setup() {
  size(800, 800);
  setupTurts();
}
void draw() {
  //background(200);
  fill(255, 40);
  noStroke();
  rect(0, 0, width, height);
  for (MarkovPart mk : mks) {
    mk.calc();
    mk.display();
  }
}
void setupTurts() {
  background(255);
  mks = new ArrayList<MarkovPart>();
  for (int i = 0; i<20; i++) {
    mks.add(new MarkovPart(5, random(height)));
  }
}
void keyPressed() {
  setupTurts();
}
