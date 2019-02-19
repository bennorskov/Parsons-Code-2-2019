//when I press a key, change the background for 3 seconds, then change it back
float startTime, endTime;
float totalTime = 3;
color normalColor, activeColor;
boolean isActive = false;
void setup() {
  size(600, 300);
  normalColor = color(230, 10, 30);
  activeColor = color(130, 100, 230);
  totalTime *= 1000; // switch to milliseconds
}
void draw() {
  if (isActive) {
    background(activeColor);
    //switchBackEndTime();
    switchBackStartTime();
  } else {
    background(normalColor);
  }
}
void keyTyped() {
  println(millis());
  isActive = true;
  // Timing variables below
  startTime = millis();
  endTime = millis() + totalTime;
}
void switchBackEndTime() {
  if (millis() > endTime) {
    isActive = false;
  }
}
void switchBackStartTime() {
  if (millis() - startTime > totalTime) {
  // option as well:
  // if (millis() > totalTime + startTime) {
    isActive = false;
  }
}
