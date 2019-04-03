import java.util.Arrays; 
// import the java Array handlers so I can use the sort() function

PImage dog, dogSorted;
int boop = 10;
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
  dogSorted.pixels = dogPixels;

  // put lines on top of the first image

  color fushia = color(255, 127, 255);
  color green = color(0, 255, 100);
  for (int i = 0; i<dog.pixels.length; i++) {
    // make horizontal fushia lines every 20 pixels
    if (i/dog.width % 20 == 0) {
      dog.pixels[i] = fushia;
    }

    // make green vertical lines every 35 pixels
    if (i / dog.height == 35){
      dog.pixels[i] = green;
    }
  }
}
void draw() {
  image(dog, 0, 0);
  image(dogSorted, dog.width, 0);
}
