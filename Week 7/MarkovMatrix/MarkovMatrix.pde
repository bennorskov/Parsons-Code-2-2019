int BULL = 0;
int BEAR = 1;
int STAG = 2;
float[][] stateMatrix = {
//Bull Bear Stag
  {.8, .15, .05},
  {.2, .75, .05},
  {.2, .2,  .6}
};
int STATE = BULL;
void setup() {
  frameRate(5);
}
void draw() {
  float[] changeTo = stateMatrix[STATE];
  float sum = 0;
  float rand = random(1);
  for (int i = 0; i<changeTo.length; i++) {
    sum += changeTo[i];
    if (rand <= sum) {
      STATE = i;
      break;
    }
  }
  switch(STATE) {
    case 0:// BULL
      background(0, 200, 10);
      break;
    case 1: //BEAR
      background(210, 200, 10);
      break;
    case 2: //STAG
      background(0, 0, 210);
      break;
  }
  println(STATE);
}
