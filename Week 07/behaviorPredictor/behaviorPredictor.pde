/*      home  school  work  boo's house
 Home    .3    .3      .2    .2 
 School  .3    .1      .3    .3  
 Work    .7    0       .15   .15
 Boo's   .1    .2      .3    .4
 */
String[] places = { "Home", "School", "work", "boos"};
int STATE = 1; // 1 is school
float[][] movementChance = {
  {.3, .3, .2, .2 }, 
  {.3, .1, .3, .3 }, 
  {.7, 0, .15, .15}, 
  {.1, .2, .3, .4}, 
};
//println(movementChance[0][1]);
for (int hours = 0; hours<24; hours++) {
  float rand = random(1);
  float current = 0;
  float[] whereToGoPercent = movementChance[STATE];
  for (int i = 0; i<whereToGoPercent.length; i++) {
    current += whereToGoPercent[i];
    if (rand < current) {
      STATE = i;
      break;
    }
  }
  println(hours+1, places[STATE]);
}
