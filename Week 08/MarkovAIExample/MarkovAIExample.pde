/*
  Animation source https://www.spriters-resource.com/playstation_2/unlimitedsaga/sheet/59358/
 Game: Unlimted Saga
 Character: Grace
 */
Grace g;

Grace g2;

void setup() {
  size( 800, 600);
  g = new Grace();
  g2 = new Grace();
  imageMode(CENTER);
}

void draw() {
  drawBackground();
  g.displayCharacter();
  g.update();
  g2.displayCharacter();
  g2.update();
}
void drawBackground() {
  background(255);
  // DRAW BACKGROUND
  noStroke();
  fill(#D28BED);
  rect(0, 0, width, height);
  fill(#6D0D90);
  rect(0, height*.75, width, height);
  fill(#9412C4);
  rect(0, height*.8, width, height);
  
}
/*
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
}*/
