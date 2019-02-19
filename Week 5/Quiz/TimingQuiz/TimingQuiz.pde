ArrayList<TimerButton> buttons = new ArrayList<TimerButton>();
PFont avantGarde;
void setup() {
  smooth();
  size(550, 350);
  avantGarde = loadFont("ITCAvantGardeStd-Demi-16.vlw");
  TimerButton a = new TimerButton(100, 100, 75, 'a');
  a.totalTime = 1200;
  buttons.add(a);
  buttons.add( new TimerButton(200, 100, 50, 's'));
  TimerButton d = new TimerButton(300, 100, 80, 'd');
  d.totalTime = 4320;
  d.buttonH = 100;
  buttons.add(d);
  buttons.add( new TimerButton(400, 100, 20, 'f'));
  TimerButton g = new TimerButton(140, 240, 80, 'g');
  g.isRectangle = false;
  buttons.add( g );
  TimerButton h = new TimerButton(200, 200, 50, 'h');
  h.totalTime = 230;
  buttons.add( h );
  buttons.add( new TimerButton(300, 210, 40, 'j'));
  TimerButton k = new TimerButton(425, 225, 50, 'k');
  k.totalTime = 800;
  k.isRectangle = false;
  buttons.add( k );
}
void draw() {
  background(#001935);
  for (TimerButton t : buttons) {
    t.drawButton();
    t.checkState();
  }
}

void keyTyped() {
  for (TimerButton t : buttons) {
    t.handleKey(key);
  }
}
void mouseClicked() {
  for (TimerButton t : buttons) {
    t.handleClick();
  }
}
/*
This week's quiz tests your knowledge of STATES, classes, and timing. 
 You also could do some normalization work.
 
 The Basics: (45 points possible)
 5 points: Draw a square
 10 points: Draw a letter on top of the square
 5 points: Draw more than 3 squares
 10 points: Draw more than 3 squares with letters
 10 points: Use a class to draw more than 3 squares 
   +5 points:with different letters
 
 Mouse Interactions: (45 points possible)
 5 points: have a mouse rollover
 5 points: have the mouse click on the square and change color
 15 points: have the square change color back after a certain amount of time
 20 points: Make the square unclickable while the color has changed
 
 Keyboard Interactions: (45 points possible)
 15 points: if you type a letter, have only that square change color
 15 points: have the square change color back after a certain amount of time
 15 points: If you type the same letter while the color is changed, don't do anything

Timing UI:
 40 points: Indicate the square is "inactive" using an animation similar to the "filling up" animation I'm using

Each Additional Square with the same functionality: (each 15 total possible)
  +5 points per square with the same functionality
  +5 per square of different sizes
  +5 per square with different timings
 */
