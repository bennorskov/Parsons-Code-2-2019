Drop[] allDrops = new Drop[100];

Cloud[] allClouds = new Cloud[100];

void setup() {
  size(400, 800);

  for (int i = 0; i<allDrops.length; i++) {
    allDrops[i] = new Drop();
  }

  for (int i = 0; i<allClouds.length; i++) {
    allClouds[i] = new Cloud();
  }
  noStroke();
}
void draw() {
  drawSky();

  for (int i = 0; i<allClouds.length; i++) {
    allClouds[i].update();
    allClouds[i].display();
  }

  for (int i = 0; i<allDrops.length; i++) {
    allDrops[i].update();
    allDrops[i].display();
  }
}

void drawSky() {

  color skyStartColor = color(30, 50, 200);
  color skyEndColor = color( 20, 220, 230);
  float colorStep = 10;
  for (int y = 0; y < height; y += colorStep) {
    fill( lerpColor( skyStartColor, skyEndColor, float(y)/float(height) ) );
    rect(0, y, width, colorStep);
  }
}
