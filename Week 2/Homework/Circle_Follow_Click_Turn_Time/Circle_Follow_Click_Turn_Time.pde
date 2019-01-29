PVector pos, startPos, velocity, target;
boolean isMoving = false;

float seconds = 1;

float endDistance = 3;

float xDistTotal, yDistTotal;

float clickTime = 0;
float endTime = 0;

void setup() {
  size(600, 400);
  noStroke();
  pos = new PVector( 200, 300 );
  target = new PVector();
  velocity = new PVector();
}
void draw() {
  background(213, 89, 120);
  fill(255);
  pushMatrix();
  translate(pos.x, pos.y);
  rotate( velocity.heading() );
  triangle(0, 0, -20, 5, -20, -5);
  popMatrix();

  if (isMoving == true) {
    
    // take the current time and divide it by the total time
    float normalizedTime = (millis() - clickTime)/(endTime-clickTime); 
    
    // percentage of the total distance based on percentage of time
    pos.x = startPos.x + xDistTotal*normalizedTime;
    pos.y = startPos.y + yDistTotal*normalizedTime;
    
    fill(0);
    ellipse(target.x, target.y, 5, 5);
    
    if (normalizedTime >= 1) {
      isMoving = false;
    }
  }
}

void mouseReleased() {
  target.x = mouseX;
  target.y = mouseY;
  startPos = new PVector(pos.x, pos.y);
  velocity = new PVector(target.x - pos.x, target.y - pos.y);
  xDistTotal = target.x - startPos.x;
  yDistTotal = target.y - startPos.y;
  isMoving = true;
  clickTime = millis();
  endTime = clickTime + seconds * 1000;
}
