float[] nums = new float[50];

void setup() {
  noLoop();
  strokeWeight(2);
}
void draw() {
  fillArray(0);
  println(nums);
  drawLine(10, 40);
}
void fillArray(int index) {
  // fill nums from 0 index to the end with noise
  nums[index] = noise(index * .1);
  index++;
  if (index < nums.length) {
    fillArray(index);
  }
}
void drawLine(int start, int end ) {
  point(start * 2, nums[start] * 20 + 30);
  start++;
  if (start < end) {
    drawLine(start, end);
  }
}
