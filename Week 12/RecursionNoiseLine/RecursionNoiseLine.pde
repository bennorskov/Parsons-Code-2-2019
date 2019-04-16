float[] nums = new float[50];

void setup() {
  noLoop();
  strokeWeight(2);
}
void draw() {
  fillArray(0);
  println(nums);
  drawLine(14, 35);
}
void fillArray(int index) {
  if (index < nums.length) {
    nums[index] = noise(index * .1);
    index++;
    fillArray(index);
  }
}
void drawLine(int index, int end ) {
  if (index < end) {
    point(index*2, nums[index] * 20 + 20);
    index++;
    drawLine(index, end);
  }
}
