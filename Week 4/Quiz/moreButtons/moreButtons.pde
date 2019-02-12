/*
* 10 Points: Make a circle
 * 20 Points: Click the circle and change color
 * 30 Points: Cycle colors when clicked from red, green, blue, and back again (or any three colors)
 * 5 Points: Each extra color beyond three (repeatable) (The colors still have to be in a specific order)
 * 20 Points: Have a rollover that changes the stroke
 * 25 Points: Put this button in a class
 * 25 Points: Have more than 10 buttons
 * 10 Points: Have each button have a random size
 * 30 Points: Line up your circles in a grid
 * 20 Points: Have the mouse Drag over the circles to change them in addition to click
 */

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
