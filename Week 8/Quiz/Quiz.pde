float[] values = {0.691985, 0.795794, 0.6617521, 0.8133859, 0.46798468, 0.8840414, 0.1441027, 0.14055121, 0.6550779, 0.6083902, 0.08358055, 0.38085133, 0.94942605, 0.9181809, 0.08933967, 0.7113727, 0.9127236, 0.7946792, 0.73184305, 0.48032027, 0.19331998, 0.96156573, 0.8092235, 0.89406, 0.7124853, 0.25608963, 0.81280166, 0.594475, 0.4475516, 0.6568898, 0.6606834, 0.9705857, 0.9898095, 0.594049, 0.24849492, 0.8422875, 0.6198024, 0.9193797, 0.45735377, 0.3799066, 0.2582633, 0.8029286, 0.8448993, 0.61408013, 0.61523986, 0.8110541, 0.10003924, 0.55735385, 0.9864199, 0.6811253, 0.3810436, 0.04112482, 0.013410926, 0.45997918, 0.18539858, 0.68651795, 0.92846656, 0.042951107, 0.3647117, 0.620978, 0.2042427, 0.015881836, 0.13584733, 0.34742516, 0.5015801, 0.5454508, 0.42790967, 0.6215074, 0.49465632, 0.8180565, 0.011841655, 0.92468226, 0.7103479, 0.8319569, 0.5940603, 0.5945724, 0.37014925, 0.79231834, 0.31712145, 0.4254008, 0.30698246, 0.73814327, 0.9389292, 0.44458085, 0.049805462, 0.5908275, 0.7881539, 0.049094856, 0.8458095, 0.5065281, 0.4885738, 0.017648816, 0.7085428, 0.14193028, 0.37093294, 0.45037812, 0.041483343, 0.3118266, 0.5501475, 0.10385203};
float barW;
PVector turtPosition, turtVelo;
float turtSpeed = 10;
int turtArrayPosition = 0;
float hitDetectionDistance = turtSpeed*2;
void setup() {
  size(800, 400);
  noStroke();

  barW = float(width)/values.length;

  turtPosition = new PVector(0, height - values[0] * height);
  turtVelo = new PVector(barW, (height-values[1]*height)-(height-values[0]*height) ); 
  turtVelo.normalize().mult(turtSpeed);
}

void draw() {
  background(200);
  fill(255);
  for (int i = 0; i<values.length; i++) {
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
