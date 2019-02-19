ArrayList<TimerButton> buttons = new ArrayList<TimerButton>();
PFont avantGarde;
void setup() {
  smooth();
  size(550, 350);
  avantGarde = loadFont("ITCAvantGardeStd-Demi-16.vlw");
  TimerButton a = new TimerButton(100, 100, 50, 'a');
  a.totalTime = 1200;
  buttons.add(a);
  buttons.add( new TimerButton(200, 100, 50, 's'));
  TimerButton d = new TimerButton(300, 100, 50, 'd');
  d.totalTime = 4320;
  buttons.add(d);
  buttons.add( new TimerButton(400, 100, 50, 'f'));
  buttons.add( new TimerButton(100, 200, 50, 'g'));
  TimerButton h = new TimerButton(200, 200, 50, 'h');
  h.totalTime = 230;
  buttons.add( h );
  buttons.add( new TimerButton(300, 200, 50, 'j'));
  TimerButton k = new TimerButton(400, 200, 50, 'k');
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
