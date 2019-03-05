StringDict wordPairs = new StringDict();
String trainingText = "Discover a new kind of university in New York City, one where scholars, artists, and designers come together to challenge convention and create positive change. Our university takes full advantage of its location in one of the most vibrant and diverse cities in the world. Our colleges include Parsons School of Design, Eugene Lang College of Liberal Arts, the College of Performing Arts, The New School for Social Research, the Schools of Public Engagement, and Parsons Paris. Since our founding in 1919, The New School has redrawn and redefined the boundaries of intellectual and creative thought as a preeminent academic center. Our rigorous, multidimensional approach to education dissolves walls between disciplines and helps nurture progressive minds. At our university, students have the academic freedom to shape their unique, individual paths for a complex and rapidly changing world. With leading-edge faculty and world-renowned alumni, we are committed to developing students who will have an impact on the world and solve the most pressing social issues of our time.";
int fragLength = 6;
void setup() {
  for (int i = 0; i<trainingText.length()-fragLength+1; i++ ) {
    String frag = trainingText.substring(i, i+fragLength);
    String letters = wordPairs.get(frag);
    if (letters == null && i+fragLength < trainingText.length()) {
      wordPairs.set(frag, ""+trainingText.charAt(i+fragLength));
    } else if (i+fragLength+1 < trainingText.length()) {
      letters += trainingText.charAt(i+fragLength);
      wordPairs.set(frag, letters);
    }
  }
  //println(wordPairs);
}
void draw() {
}
void mousePressed() {
  int numLetters = 100;
  int randomStart = int(random(trainingText.length()-fragLength));
  String toWrite = trainingText.substring(randomStart, randomStart+fragLength);
  for (int i = 0; i<numLetters; i++) {
    String frag = toWrite.substring( toWrite.length()-fragLength, toWrite.length());
    String possibleLetters = wordPairs.get(frag);
    //println(frag, possibleLetters);
    if (possibleLetters == null) break;
    toWrite += ""+possibleLetters.charAt( int(random(possibleLetters.length())) );
  }
  println(toWrite);
}
