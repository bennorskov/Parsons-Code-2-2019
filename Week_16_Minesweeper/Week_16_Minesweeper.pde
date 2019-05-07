import java.util.Arrays; 
// setup board logic structure:
int boardRows = 32;
int boardCols = 18;

int[][] boardLayout = new int[boardRows][boardCols];
boolean[][] hasBeenClicked = new boolean[boardRows][boardCols];

// display variables
int cellWidth, cellHeight;
color cellColor = color(60, 60, 60);
color revealedCellColor = color( 200, 200, 200);

void setup() {
  size( 1200, 600);
  
  // setup Board
  setupBoardLayout( 50 );

  // setup Display Variables
  cellWidth = width/boardRows;
  cellHeight = height/boardCols;
  textAlign(CENTER);
  // If you don't display the text in setup, there's a lag as the program loads the default font.
  // this is the stupidest hacky way of getting around this, but it works:
  text("display text offscreen to load the font", -1000, -1000);
}

void draw() {
  background(27, 54, 100);
  for (int x = 0; x<boardRows; x++) {
    for (int y = 0; y<boardCols; y++) {
      if (hasBeenClicked[x][y]) {
        switch(boardLayout[x][y]) {
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:
        case 6:
        case 7:
        case 8:
          // display the cell
          drawCell( boardLayout[x][y], x, y );
          break;
        case 9: 
          // draw a red square for a mine
          fill(255, 0, 0);
          rect(x * cellWidth, y * cellHeight, cellWidth, cellHeight);
          break;
        case 0:
        default:
          // don't draw anything
          break;
        }
      } else {
        // display an unclicked square
        fill(cellColor);
        rect(x * cellWidth, y * cellHeight, cellWidth, cellHeight);
      }
    }
  }
}

void drawCell( int cellContents, int x, int y ) {
  fill( revealedCellColor);  
  rect(x * cellWidth, y * cellHeight, cellWidth, cellHeight);
  fill(20);
  text(cellContents, x * cellWidth + cellWidth/2, y * cellHeight + cellHeight*.75);
}
//
// ============================================================ Interaction Handlers
//
void mouseClicked() {
  int normalizedX = mouseX/cellWidth;
  int normalizedY = mouseY/cellHeight;
  
  normalizedX = min(normalizedX, boardRows-1);
  normalizedY = min(normalizedY, boardCols-1);

  if (!hasBeenClicked[normalizedX][normalizedY]) {
    if (boardLayout[normalizedX][normalizedY] == 0) {
      openAdjacentSquares(normalizedX, normalizedY);
    } else {
      hasBeenClicked[normalizedX][normalizedY] = true;
    }
  }
}

void openAdjacentSquares(int _x, int _y) {
  // index protection:
  if ( _y < 0 || _x >= boardRows || _y >= boardCols || _x < 0) {
    return;
  }
  // don't check squares that you've already checked!
  if ( hasBeenClicked[_x][_y] ) { 
    return;
  } else {
    hasBeenClicked[_x][_y] = true;
    if (boardLayout[_x][_y] == 0) {
      // if zero, open adjacent squares
      // check squares starting from top in a clockwise rotation
      openAdjacentSquares(_x, _y-1);
      openAdjacentSquares(_x+1, _y-1);
      openAdjacentSquares(_x+1, _y);
      openAdjacentSquares(_x+1, _y+1);
      openAdjacentSquares(_x, _y+1);
      openAdjacentSquares(_x-1, _y+1);
      openAdjacentSquares(_x-1, _y);
      openAdjacentSquares(_x-1, _y-1);
    }
  }
}
//
// ============================================================ Setup Functions
//
void setupBoardLayout(int _numMines) {
  int[] minePosition = new int[_numMines];

  // fill with mines
  for (int i = 0; i<_numMines; i++) {
    minePosition[i] = int(random(boardCols * boardRows));
  }

  //sort mine array to be in order
  Arrays.sort(minePosition);
  // Assign Mines Randomly  
  int index = 0;
  int positionIndex = 0;
  for (int x = 0; x<boardRows; x++) {
    for (int y = 0; y<boardCols; y++) {
      // array index protection && if a repeated position, just draw one in the next position
      if ( positionIndex < minePosition.length && index >= minePosition[positionIndex]) {
        // make a mine!
        boardLayout[x][y] = 9;
        positionIndex++;
        // add one to all cells surounding this one:
        addToSurroundingCells(x, y-1);
        addToSurroundingCells(x+1, y-1);
        addToSurroundingCells(x+1, y);
        addToSurroundingCells(x+1, y+1);
        addToSurroundingCells(x, y+1);
        addToSurroundingCells(x-1, y+1);
        addToSurroundingCells(x-1, y);
        addToSurroundingCells(x-1, y-1);
      }
      index++; // continue to next cell keeping a global cell count
    }
  }
}

void addToSurroundingCells(int _x, int _y) {
  // if we're off the board, stop to avoid index error:
  if ( _y < 0 || _x >= boardRows || _y >= boardCols || _x < 0) return;
  // if not a mine, add one:
  if (boardLayout[_x][_y] != 9) {
    boardLayout[_x][_y]++;
  }
}
