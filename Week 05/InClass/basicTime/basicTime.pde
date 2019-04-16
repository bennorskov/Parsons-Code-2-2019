// switch the background to green after so many seconds
float totalTime = 3;
int startTime;
void setup() {
  size(400, 600);
  totalTime = totalTime * 1000; // convert to milliseconds!
  startTime = millis();
}
void draw() {
  demo1();
  //demo2();
  //demo3();
}
void demo1() {
  if (millis() > 3000) {
    background(0, 200, 20);
  }
}
void demo2() {
  if (millis() > totalTime) {
    background(0, 200, 20);
  }
}
void demo3() {
  if (millis() > totalTime + startTime) {
    background(0, 200, 20);
  }
}
