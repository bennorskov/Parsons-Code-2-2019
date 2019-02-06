Button dragButton;

float dragZoneX, dragZoneY, dragZoneW, dragZoneH;
void setup() {
  size( 600, 400);

  dragButton = new Button( 30, 50, 60, 40);
  dragButton.isActive = false;

  dragZoneX = 450; 
  dragZoneY = 320;
  dragZoneW = 80;
  dragZoneH = 60;
}
void draw() {
  if (dragButton.isPressed) {
    background(240);
  } else {
    background(30);
  }
  dragButton.update();
  dragButton.display();

  dragZoneHandler();
}

void dragZoneHandler() {
  // draw active zone
  noFill();
  stroke(255, 255, 100);
  rect( dragZoneX, dragZoneY, dragZoneW, dragZoneH); 
  if ( !(dragButton.x < dragZoneX || dragButton.y < dragZoneY || dragButton.x + dragButton.w > dragZoneX + dragZoneW || dragButton.y + dragButton.h > dragZoneY + dragZoneH) ) {
    dragButton.isActive = true;
  } else {
    dragButton.isActive = false;
  }
}

void mouseDragged() {
}
void mouseClicked() {
  dragButton.click();
}
void mousePressed() {
  dragButton.pressed();
}
void mouseReleased() {
  dragButton.released();
}
