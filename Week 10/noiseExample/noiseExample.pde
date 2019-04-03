void setup() {
}
void draw() {
  for (float x = 0; x<100; x++) {
    for (float y = 0; y<100; y++) {
      float n = noise((frameCount+x)/30, y/30);
      stroke(int(map(n, 0, 1, 0, 255)) );
      point(x, y);
    }
  }
}
