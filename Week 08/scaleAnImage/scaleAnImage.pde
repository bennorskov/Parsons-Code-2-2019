PImage goats;
void setup() {
  size( 500, 500);
  goats = loadImage("goats.jpg");
}
void draw() {
  background(200);
  pushMatrix();
  translate(250, 250);
  scale( sin(frameCount *.02), 1);
  imageMode(CORNER);
  image(goats, 0, 0);

  imageMode(CENTER);
  image(goats, 0, 0);
  popMatrix();
  println(sin(frameCount *.02));
}
