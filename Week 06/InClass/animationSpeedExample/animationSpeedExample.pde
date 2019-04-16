int numFrames = 4;
PImage[] cats = new PImage[numFrames];
int[] kickFrames = {0, 1, 2, 2, 3, 3, 2, 1, 0};
int animationSpeed = 6;

void setup() {

  size( 500, 400);
  cats[0] = loadImage("kick_frame01.png");
  cats[1] = loadImage("kick_frame02.png");
  cats[2] = loadImage("kick_frame03.png");
  cats[3] = loadImage("kick_frame04.png");

  frameRate(60);
}
void draw() {
  background(200);
  int fC = frameCount/animationSpeed;
  int nextFrame = kickFrames[fC % kickFrames.length];
  image( cats[ nextFrame ], 30, 30);
}
