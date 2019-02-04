/*
# Quiz Raindrops
 This quiz tests your knowledge of making a class, and lightly about code structures. 
 100 points is 100%. Extra is extra!
 * 10 Points: Make a Drop
 * 10 Points: Move your drop down over time
 * 15 Points: Have your drop reset at the top of the screen after moving offscreen. +5 for randomly
 * 15 Points: Make more than 10 drops
 * 15 Points: Make more than 50 drops
 * 30 Points: Have the drop smoothly change color as it falls
 * 15 Points: Have a gradient background
 * 10 Points: Have a cloud
 * 10 Points: Move your cloud horizontally
 * 20 Points: Reset your cloud when it moves offscreen
 * 15 Points: Have more than 20 clouds
 * 10 Points: Make your cloud transparent
 */

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
