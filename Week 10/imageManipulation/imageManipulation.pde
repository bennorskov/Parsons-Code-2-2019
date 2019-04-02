import java.util.Arrays; 
// import the java Array handlers so I can use the sort() function

PImage dog, dogSorted;

int[] dogPixels;
void setup() {
  dog = loadImage("dogHat.png");
  
  println(dog.width, dog.height);
  size(922, 463); // twice the width of the image
  
  //copy the pixels of the first image into an integer array
  dogPixels = dog.pixels.clone();
  Arrays.sort(dogPixels);
  
  // create an empty image the same size as the original
  dogSorted = createImage(dog.width, dog.height, RGB);
  
  // assign the sorted pixels to it:
  dogSorted.loadPixels();
  dogSorted.pixels = dogPixels;
  dogSorted.updatePixels();
}
void draw() {
  image(dog, 0, 0);
  image(dogSorted, dog.width, 0);
}
