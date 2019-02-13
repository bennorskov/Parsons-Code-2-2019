int numButtons = 100;
CircleButton[] buttons = new CircleButton[numButtons];
void setup() {
  size(600, 400);
  float offset = 30;
  int numPerRow = 9;
  boolean drawRandom = true;
  for (int i = 0; i<numButtons; i++) {
    if (drawRandom) {
      buttons[i] = new CircleButton(random(width), random(height), random(30, 60));
    } else {
      buttons[i] = new CircleButton(i%numPerRow * width/numPerRow + offset, i/numPerRow*height/numPerRow + offset, random(30, 60) );
    }
  }
}
void draw() {
  background(#001935);
  for (int i = 0; i<numButtons; i++) {
    buttons[i].display();
  }
}
void mouseDragged() {
  for (int i = 0; i<numButtons; i++) {
    buttons[i].handleClick();
  }
}
void mouseClicked() {
  for (int i = 0; i<numButtons; i++) {
    buttons[i].handleClick();
  }
}
