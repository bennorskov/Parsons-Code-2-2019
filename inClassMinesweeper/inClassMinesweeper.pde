int numCols = 12;
int numRows = 10;

int cellW = 50;
int cellH = 50;

int[][] mineField = new int[numCols][numRows]; 

boolean[][] isRevealed = new boolean[numCols][numRows];

void setup() {
  size(150, 200);

  setupMineField( 4 );

  text("it's stupid how the font won't load", -10000, 10000);
}
void draw() {
  background(12, 40, 80);
  drawCells();
}
void drawCells() {
  for (int y = 0; y< numCols; y++) {
    for (int x = 0; x < numRows; x++) {
      if (isRevealed[y][x] == true) {
        if (mineField[y][x] >= 9 ) {
          fill(255, 0, 0);
          rect(x * cellW, y * cellH, cellW, cellH);
        } else if (mineField[y][x] != 0) {
          fill(255);
          rect(x * cellW, y * cellH, cellW, cellH);
          fill(0);
          text(mineField[y][x], x * cellW + cellW/2, y * cellH+cellH/2);
        }
      } else {
        fill(80, 100, 120);
        rect(x * cellW, y * cellH, cellW, cellH);
      }
    }
  }
}
void mousePressed() {
  println("omg mouse?");
  // setup something where you click one square
  //mouseX, mouseY

  int gridX = int( map( mouseX, 0, width, 0, numRows));
  int gridY = mouseY/cellH;
  println(gridX, gridY);
  // reveal that square
  isRevealed[gridY][gridX] = true;
}

void setupMineField( int numMines ) {
  int[][] minePositions = new int[numMines][2]; 
  for (int i = 0; i<numMines; i++) {
    int[] pos = { int(random(numRows)), int(random(numCols)) };

    println(pos);
    minePositions[i] = pos;
  }
  for (int i = 0; i<numMines; i++) {
    // put mine into mineField
    int y = minePositions[i][1];
    int x = minePositions[i][0]; 
    mineField[ y ][ x ] = 9;
    // assign numbers based on mine positions
    addOneToCell(y - 1, x);
    addOneToCell(y - 1, x + 1);
    addOneToCell(y + 0, x + 1);
    addOneToCell(y + 1, x + 1);
    addOneToCell(y + 1, x);
    addOneToCell(y + 1, x - 1);
    addOneToCell(y, x - 1);
    addOneToCell(y - 1, x - 1);
  }
  println(mineField);
}
void addOneToCell(int y, int x) {
  if (y < 0 || y >= numCols || x < 0 || x >= numRows) return;
  mineField[y][x]++;
  /* if (y >= 0 && y < numCols && x >= 0 && x < numRows) {
    mineField[y][x]++;
  } */
}
