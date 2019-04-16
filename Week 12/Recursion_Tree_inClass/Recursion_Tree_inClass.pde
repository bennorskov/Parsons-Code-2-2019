float rotation = radians(36);
float minBranchLength = 10;
void setup() {
  noLoop();
  size(500, 500);
}
void draw() {
  // move to bottom middle of the screen
  translate(width*.5, height);
  rotate(PI); // rotate up (branch goes down)
  branch(100);
}
void branch(float branchLength) {
  // make lower branches red, higher branches green
  color strokeC = color( map(branchLength, 100, minBranchLength, 255, 0), map(branchLength, 100, minBranchLength, 0, 255), 0);
  strokeWeight( branchLength*.25);
  stroke(strokeC);
  line(0, 0, 0, branchLength);
  
  // move to the end of the branch
  translate(0, branchLength);
  branchLength *= .75;// reduce branch length
  
  // draw new branch at different rotation
  pushMatrix();
  rotate(rotation + radians(random(-30, 30) ) );
  if (branchLength > minBranchLength) branch( branchLength);
  popMatrix();
  
  // draw new branch at different rotation
  pushMatrix();
  rotate(-rotation);
  if (branchLength > minBranchLength) branch( branchLength);
  popMatrix();
  
  // draw new branch at different rotation
  pushMatrix();
  if (branchLength > minBranchLength) branch( branchLength);
  popMatrix();
}

void nonRecursiveMethod() {

  line(0, 0, 0, 100);
  translate(0, 100);
  pushMatrix();
  rotate(HALF_PI*.5);
  line(0, 0, 0, 70);
  translate(0, 70);

  pushMatrix();
  rotate(HALF_PI*.5);
  line(0, 0, 0, 50);
  popMatrix();

  pushMatrix();
  rotate(HALF_PI*-.5);
  line(0, 0, 0, 50);
  popMatrix();
  popMatrix();

  pushMatrix();
  rotate(HALF_PI*-.5);
  line(0, 0, 0, 70);

  translate(0, 70);
  pushMatrix();
  rotate(HALF_PI*.5);
  line(0, 0, 0, 50);
  popMatrix();
  pushMatrix();
  rotate(HALF_PI*-.5);
  line(0, 0, 0, 50);
  popMatrix();

  popMatrix();
}
