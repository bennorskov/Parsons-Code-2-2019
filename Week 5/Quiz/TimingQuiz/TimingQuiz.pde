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
  buttons.add( new TimerButton(100, 200, 80, 'g'));
  TimerButton h = new TimerButton(200, 200, 50, 'h');
  h.totalTime = 230;
  buttons.add( h );
  buttons.add( new TimerButton(300, 210, 40, 'j'));
  TimerButton k = new TimerButton(400, 200, 50, 'k');
  k.buttonW = 100;
  k.totalTime = 800;
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
 
 The Basics: (70 points possible)
 5 points: Draw a square
 15 points: Draw a letter on top of the square
 5 points: Draw more than 3 squares
 20 points: Draw more than 3 squares with letters
 20 points: Use a class to draw more than 3 squares 
   +5 points:with different letters
 
 Mouse Interactions: (75 points possible)
 10 points: have a mouse rollover
 10 points: have the mouse click on the square and change color
 30 points: have the square change color back after a certain amount of time
 25 points: Make the square unclickable while the color has changed
 
 Keyboard Interactions: (85 points possible)
 30 points: if you type a letter, have only that square change color
 30 points: have the square change color back after a certain amount of time
 25 points: If you type the same letter while the color is changed, don't do anything

Timing UI:
 60 points: Indicate the square is "inactive" using an animation similar to the "filling up" animation I'm using

Each Additional Square with the same functionality: (each 30 total possible)
  +15 points per square
  +5 per square of different sizes
  +10 per square with different timings
 */
