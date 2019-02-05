float lineX = 100;
float rectX = 150;
float rectWidth = 40;
float rectHeight = 60;
float rectY = 120;
color bgColor = color(220, 100, 200);

boolean buttonIsClicked = false;
void setup() {
  size(300, 500);
}

void draw() {
  if (buttonIsClicked) {
    bgColor = color(0, 100, 200);
  } else {
    bgColor = color(220, 100, 200);
  }
  
  background( bgColor);

  line(lineX, 0, lineX, height);
  // otherHitDetection();
  // bensHitDetection();

  rect(rectX, rectY, rectWidth, rectHeight);
}
void mouseClicked() {
  if ( mouseX > rectX && 
       mouseX < rectX + rectWidth && 
       mouseY > rectY && 
       mouseY < rectY + rectHeight) {
     
     if (buttonIsClicked) {
       buttonIsClicked = false;
     } else {
       buttonIsClicked = true;
     }
     
     // shorthand: buttonIsClicked = !buttonIsClicked;
   } 
   println(buttonIsClicked);
}
void bensHitDetection() {
  if ( mouseX > rectX && 
       mouseX < rectX + rectWidth && 
       mouseY > rectY && 
       mouseY < rectY + rectHeight) {
    bgColor = color(0, 100, 200);
  } else {
    bgColor = color(220, 100, 200);
  }
}
void otherHitDetection() {
  if ( mouseX > rectX) {
    if (mouseX < rectX + rectWidth) {
      if (mouseY > rectY) {
        if (mouseY < rectY + rectHeight) {
          bgColor = color(0, 100, 200);
        }
      }
    }
  } else {
    bgColor = color(220, 100, 200);
  }
}
