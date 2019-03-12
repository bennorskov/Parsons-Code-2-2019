class Grace {
  // STATES
  int STAND = 0;
  int KICK = 1;
  int PUNCH = 2;
  int JUMP = 3;
  int MOVE = 4;
  int STATE = STAND;
  // Setup Choice Matrix
  String[] stateNames = {"STAND", "KICK", "PUNCH", "JUMP", "MOVE"};
  float[][] choices = {
    // "STAND","KICK","PUNCH","JUMP","MOVE"
    { .4, .1, .1, .01, .39}, 
    { .45, .05, .1, 0, .4}, 
    { .4, .05, .2, 0, .35 }, 
    { .4, .1, .1, 0, .4}, 
    { .1, 0, 0, .01, .89}
  };

  // movement variables
  PVector velo, pos;
  int facingDirection = 1;
  float speed = 3;
  float jumpSpeed = 5;

  // Setup Punch Animation
  int numPunchFrames = 4;
  int punchAnimationSpeed = 8;
  PImage[] punch = new PImage[numPunchFrames];

  // Setup Kick Animation
  int numKickFrames = 8;
  int kickAnimationSpeed = 6;
  PImage[] kick = new PImage[numKickFrames];

  int numJumpFrames = 5;
  int jumpAnimationSpeed = 6;
  PImage[] jump = new PImage[numJumpFrames];

  //standing
  PImage stand = new PImage();
  boolean chooseNewDirection = true;

  //animation handler
  int frameNumber = 0;
  Grace() {
    velo = new PVector(0, 0);
    pos = new PVector(random(width), random(height));
    
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

    // load jump!
    for (int i = 1; i<=numJumpFrames; i++) {
      jump[i-1] = loadImage("Jump_0"+i+".png");
    }
  }
  //
  // ———————— ———————— ———————— ———————— ———————— ———————— ———————— MOVEMENT
  void update() {
    pos.add(velo);
    if (pos.y < 0) {
      pos.y = height;
    }
    if (pos.x > width) {
      pos.x = 0;
    } else if (pos.x < 0) {
      pos.x = width;
    }
    if (chooseNewDirection) {
      facingDirection = (random(1) < .5) ? 1 : -1;
      chooseNewDirection = false;
    }
    switch (STATE) {
    case 1: // KICK
    case 2: // PUNCH
      velo = new PVector(0, 0);
      break;
    case 4: // MOVE
      velo = new PVector(-facingDirection * speed, 0);
    case 0: // STAND
    default:
      STATE = changeState();
      break;
    case 3: // JUMP
      velo = new PVector(-facingDirection * speed * .4, -jumpSpeed);
      break;
    }
  }
  //
  // ———————— ———————— ———————— ———————— ———————— ———————— ———————— ANIMATION HANDLERS
  //
  void displayCharacter() {
    pushMatrix();
    translate(pos.x, pos.y);
    scale(facingDirection, 1); // face left or right
    fill(0, 20);
    ellipse(0, 65, 100, 30);
    // ANIMATION STATE MACHINE
    switch (STATE) {
    case 1: // KICK
      playKickAnimation();
      break;
    case 2: // PUNCH
      playPunchAnimation();
      break;
    case 3: // JUMP
      playJumpAnimation();
      break;
    case 4: // MOVE (there's no walk animation)
    case 0: // STAND
    default:
      image(stand, 0, 0);
      break;
    }
    popMatrix();
  }
  void playJumpAnimation() {
    image(jump[frameNumber], 0, 0);
    if (frameCount%jumpAnimationSpeed == 0) {
      frameNumber++;
      if (frameNumber>=numJumpFrames) {
        STATE = changeState();
        chooseNewDirection = true;
      };
    }
  }
  void playKickAnimation() {
    image(kick[frameNumber], 0, 0);
    if (frameCount%kickAnimationSpeed == 0) {
      frameNumber++;
      if (frameNumber>=numKickFrames) {
        STATE = changeState();
        chooseNewDirection = true;
      };
    }
  }
  void playPunchAnimation() {
    image(punch[frameNumber], 0, 0);
    if (frameCount%punchAnimationSpeed == 0) {
      frameNumber++;
      if (frameNumber>=numPunchFrames) {
        STATE = changeState();
        chooseNewDirection = true;
      };
    }
  }
  int changeState() {
    frameNumber = 0;
    float rand = random(1);
    float currentTotal = 0;
    float[] range = choices[STATE];
    for (int i = 0; i<range.length; i++) {
      // cycle through every range value
      currentTotal += range[i];
      if (rand < currentTotal) {
        return i;
      }
    }
    return 0;
  }
}
