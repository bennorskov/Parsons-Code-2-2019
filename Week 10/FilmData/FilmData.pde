/*
  A small visualization of the number of places had film locations
*/
Table filmData;

int manhattanLocCount = 0;
int brooklynLocCount = 0;
int queensLocCount = 0;
int bronxLocCount = 0;
int statenLocCount = 0;

int barheight = 50;
float barXScaler = 10;
float barYScaler = .8;

void setup() {
  size(600, 500);
  filmData = loadTable("Film_Permits_small.csv", "header");

  println(filmData.getRowCount() + " total rows in table"); 
  
  /*
    get row 4
    TableRow row = filmData.getRow(4);
    row = {
      EventID: 234102,
      EventType: Shooting Permit,
      EndDateTime: 12/12/2012 10:00 AM
    }
    row.getInt("EventID");
  */
  
  //for (int i = 0; i<filmData.getRowCount(); i++) {
  //  TableRow row = filmData.row(i);
  //  row.getString("");
  
  for (TableRow row : filmData.rows()) {

    int id = row.getInt("EventID");
    String where = row.getString("Borough");
    String cat = row.getString("Category");
    String startTime = row.getString("StartDateTime");

    switch(where) {
    case "Manhattan":
      manhattanLocCount++;
      break;
    case "Brooklyn":
      brooklynLocCount++;
      break;
    case "Queens":
      queensLocCount++;
      break;
    case "Bronx":
      bronxLocCount++;
      break;
    case "Staten Island":
      statenLocCount++;
      break;
    }

    // println("A " + cat + " show is shooting in " + where + " starting at " + startTime);
  }
}
void draw() {
  background(1, 25, 52);
  
  // draw background grid:
  fill(255);
  stroke(255);
  for (int i = 0; i<width; i+= barXScaler * 5) {
    line(i, 0, i, height);
    text(int(i/barXScaler), i+5, 20);
  }
  
  // draw bar graph:
  fill(252, 144, 37);
  noStroke();
  pushMatrix();
  translate(0, 50);
  // I'm translating here because I realized later that I needed to move everything down and I didn't want to re-type an offset manually
  text("Manhattan Locations:", 10, barheight - 5);
  rect(0, barheight, manhattanLocCount * barXScaler, barheight*barYScaler);

  text("Brooklyn Locations:", 10, barheight*2.5 - 5);
  rect(0, barheight * 2.5, brooklynLocCount * barXScaler, barheight * barYScaler);

  text("Queens Locations:", 10, barheight * 4 - 5);
  rect(0, barheight * 4, queensLocCount * barXScaler, barheight * barYScaler);
  
  text("Bronx Locations:", 10, barheight * 5.5 - 5);
  rect(0, barheight * 5.5, bronxLocCount * barXScaler, barheight * barYScaler);
  
  text("Staten Island Locations:", 10, barheight * 7 - 5);
  rect(0, barheight*7, statenLocCount * barXScaler, barheight * barYScaler);
  popMatrix();
}
