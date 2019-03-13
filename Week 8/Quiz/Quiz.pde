//float[] values = {0.6862242, 0.6548779, 0.61844003, 0.48806936, 0.7128785, 0.39805183, 0.368907, 0.7253837, 0.6638596, 0.5047743, 0.2589076, 0.6413174, 0.4530434, 0.5306238, 0.38646686, 0.65531445, 0.7022964, 0.43304935, 0.51725006, 0.43724763, 0.60850686, 0.24738209, 0.3953956, 0.5390752, 0.32107228, 0.42027545, 0.7795959, 0.36715147, 0.53201604, 0.48227456, 0.69436294, 0.5795696, 0.33521953, 0.45374683, 0.6865499, 0.43220675, 0.5923915, 0.22914335, 0.69579697, 0.37703025, 0.6787783, 0.37712955, 0.36598018, 0.4661237, 0.3627664, 0.60244423, 0.4133684, 0.78449064, 0.40599206, 0.3836592, 0.5480211, 0.30652797, 0.2489982, 0.63136494, 0.35400635, 0.3354509, 0.15554224, 0.2760702, 0.44640172, 0.32754564, 0.6866252, 0.5494424, 0.27790168, 0.65488505, 0.28749073, 0.24192931, 0.40593186, 0.20982751, 0.2481188, 0.41258085, 0.31973758, 0.51132077, 0.28004485, 0.34665912, 0.38482547, 0.45364243, 0.6061878, 0.65229535, 0.63479835, 0.117426805, 0.42882174, 0.41577572, 0.42501414, 0.53568953, 0.29351604, 0.4605617, 0.29464188, 0.31437966, 0.48748386, 0.5877275, 0.61370045, 0.3959247, 0.2720738, 0.3328229, 0.6086811, 0.7562341, 0.18793087, 0.69421124, 0.7176242, 0.49196425}; 
float[] values = {0.691985, 0.795794, 0.6617521, 0.8133859, 0.46798468, 0.8840414, 0.1441027, 0.14055121, 0.6550779, 0.6083902, 0.08358055, 0.38085133, 0.94942605, 0.9181809, 0.08933967, 0.7113727, 0.9127236, 0.7946792, 0.73184305, 0.48032027, 0.19331998, 0.96156573, 0.8092235, 0.89406, 0.7124853, 0.25608963, 0.81280166, 0.594475, 0.4475516, 0.6568898, 0.6606834, 0.9705857, 0.9898095, 0.594049, 0.24849492, 0.8422875, 0.6198024, 0.9193797, 0.45735377, 0.3799066, 0.2582633, 0.8029286, 0.8448993, 0.61408013, 0.61523986, 0.8110541, 0.10003924, 0.55735385, 0.9864199, 0.6811253, 0.3810436, 0.04112482, 0.013410926, 0.45997918, 0.18539858, 0.68651795, 0.92846656, 0.042951107, 0.3647117, 0.620978, 0.2042427, 0.015881836, 0.13584733, 0.34742516, 0.5015801, 0.5454508, 0.42790967, 0.6215074, 0.49465632, 0.8180565, 0.011841655, 0.92468226, 0.7103479, 0.8319569, 0.5940603, 0.5945724, 0.37014925, 0.79231834, 0.31712145, 0.4254008, 0.30698246, 0.73814327, 0.9389292, 0.44458085, 0.049805462, 0.5908275, 0.7881539, 0.049094856, 0.8458095, 0.5065281, 0.4885738, 0.017648816, 0.7085428, 0.14193028, 0.37093294, 0.45037812, 0.041483343, 0.3118266, 0.5501475, 0.10385203};
float barW;
PVector turtPosition, turtVelo;
float turtSpeed = 3;
int turtArrayPosition = 0;
float hitDetectionDistance = turtSpeed*2;
void setup() {
  size(600, 350);
  noStroke();

  barW = float(width)/values.length;

  turtPosition = new PVector(0, height - values[0] * height);
  turtVelo = new PVector(barW, (height-values[1]*height)-(height-values[0]*height) ); 
  turtVelo.normalize().mult(turtSpeed);
}

void draw() {
  background(#001935);
  
  for (int i = 0; i<values.length; i++) {
    fill( map(values[i], 0, 1, 255, 0), 0, map(values[i], 0, 1, 0, 255));
    rect(i*barW, height-values[i]*height, barW, values[i]*height);
  }
  turtPosition.add(turtVelo);
  if (turtArrayPosition+1 >= values.length) { // reset!
    turtArrayPosition = 0;
    turtPosition = new PVector(0, height - values[0] * height);
    turtVelo = new PVector(barW, (height-values[1]*height)-(height-values[0]*height)); 
    turtVelo.normalize().mult(turtSpeed);
  } else if (dist(turtPosition.x, turtPosition.y, barW * turtArrayPosition, height-values[turtArrayPosition]*height) < hitDetectionDistance) {
    turtArrayPosition++;
    turtVelo = new PVector(barW*turtArrayPosition - turtPosition.x, (height-values[turtArrayPosition]*height) - turtPosition.y); 
    turtVelo.normalize().mult(turtSpeed);
  }

  fill(255, 0, 0);
  ellipse(turtPosition.x, turtPosition.y, 10, 10);
}
/*
5 points: Draw a rectangle
 25 points: for each normalized value
 30 points: sized larger for larger values, and smaller for smaller ones
 25 points: No matter what the size of sketch, always fill the screen
 10 points: Move a circle across the screen
 35 points: Move a circle along the top of the rectangles you've drawn. 
 15 points: When the circle gets to the end of a line, start over at the beginning
 5 points: Use better colors than ben
 10 points: generate your own values using random()
 20 points: generate your own values using noise()
 */
