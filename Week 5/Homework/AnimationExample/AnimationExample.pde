/*
  Animation source https://www.spriters-resource.com/playstation_2/unlimitedsaga/sheet/59358/
  Game: Unlimted Saga
  Character: Grace
*/
// Setup Punch Animation
int numPunchFrames = 4;
int punchAnimationSpeed = 8;
PImage[] punch = new PImage[numPunchFrames];

// Setup Kick Animation
int numKickFrames = 8;
int kickAnimationSpeed = 6;
PImage[] kick = new PImage[numKickFrames];

//standing
PImage stand = new PImage();

//animation handler
int frameNumber = 0;

int STAND = 0;
int KICK = 1;
int PUNCH = 2;
int STATE = STAND;
void setup() {
  size( 300, 300);
  stand = loadImage("stand.png");

  // load Kick!
  kick[0] = loadImage("kick_frame01.png");
  kick[1] = loadImage("kick_frame02.png");
  kick[2] = loadImage("kick_frame03.png");
  kick[3] = loadImage("kick_frame03.png"); // I put frame 3 twice to give it a slight pause. 
  kick[4] = loadImage("kick_frame04.png");
  kick[5] = loadImage("kick_frame03.png");
  kick[6] = loadImage("kick_frame02.png");
  kick[7] = loadImage("kick_frame01.png");

  // load punch!
  punch[0] = loadImage("ani1_frame01.png");
  punch[1] = loadImage("ani1_frame02.png");
  punch[2] = loadImage("ani1_frame03.png");
  punch[3] = loadImage("ani1_frame02.png");
}

void draw() {
  background(255);
  // DRAW BACKGROUND
  noStroke();
  fill(#D28BED);
  rect(0, 0, width, height);
  fill(#6D0D90);
  rect(0, 175, width, height);
  fill(#9412C4);
  rect(0, 190, width, height);
  fill(0, 20);
  ellipse(150, 215, 100, 30);
  // ANIMATION STATE MACHINE
  switch (STATE) {
  case 1: // KICK
    playKickAnimation();
    break;
  case 2: // PUNCH
    playPunchAnimation();
    break;
  case 0:
  default:
    image(stand, 75, 75);
    break;
  }
}
void playKickAnimation() {
  image(kick[frameNumber], 75, 75);
  if (frameCount%kickAnimationSpeed == 0) {
    frameNumber++;
    if (frameNumber>=numKickFrames) STATE = STAND;
  }
}
void playPunchAnimation() {
  image(punch[frameNumber], 75, 75);
  if (frameCount%punchAnimationSpeed == 0) {
    frameNumber++;
    if (frameNumber>=numPunchFrames) STATE = STAND;
  }
}
void keyPressed() {
  if (STATE == STAND) {
    if (key == 'p') {
      println( "P Pressed!");
      STATE = PUNCH;
      frameNumber = 0;
    }
    if (key == 'k') {
      println( "K Pressed!");
      STATE = KICK;
      frameNumber = 0;
    }
  }
}
