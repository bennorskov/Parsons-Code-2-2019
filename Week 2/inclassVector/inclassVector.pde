PVector pos1, pos2, distanceVec1, distanceVec2;
void setup() {
  size(400, 500);

  pos1 = new PVector(20, 200);
  pos2 = new PVector(280, 150);
}

void draw() {
  background(20, 240, 203);
  line(pos1.x, pos1.y, pos2.x, pos2.y);
  
  // get the distance on x and y
  float distX = pos2.x - pos1.x;
  float distY = pos2.y - pos1.y;
  
  //move the end of the second point up and down
  pos2.y = mouseY;
  pos2.x = mouseX;
  
  distanceVec1 = new PVector( distX, distY);

  distanceVec1.normalize(); // make the vector 1 pixel long
  distanceVec1.mult(100); // make the vector 100 pixels long

  float circPosX = distanceVec1.x + pos1.x;
  float circPosY = distanceVec1.y + pos1.y;
  fill(0);
  ellipse(circPosX, circPosY, 10, 10);

  distanceVec2 = new PVector( distX, distY);
  distanceVec2.mult(.75); // make the vector 3/4 of it's original length
  
  float circPosX2 = distanceVec2.x + pos1.x;
  float circPosY2 = distanceVec2.y + pos1.y;
  fill(255);
  ellipse(circPosX2, circPosY2, 10, 10);
}
