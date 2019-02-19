Button dragButton, fireWorksButton;
Fireworks theFire;

float dragZoneX, dragZoneY, dragZoneW, dragZoneH;
void setup() {
  size( 600, 400);

  dragButton = new Button( 30, 50, 60, 40);
  dragButton.isActive = false;

  fireWorksButton = new Button(175, 350, 50, 50);

  dragZoneX = 450; 
  dragZoneY = 320;
  dragZoneW = 80;
  dragZoneH = 60;
  
  theFire = new Fireworks(200, 350);
}
void draw() {
  if (dragButton.isPressed) {
    background(180);
  } else {
    background(30);
  }
  dragButton.update();
  dragButton.display();

  fireWorksButton.update();
  fireWorksButton.display();

  dragZoneHandler();
  
  if (fireWorksButton.isPressed) {
    theFire.fire();
    fireWorksButton.isPressed = false;
  }
  theFire.update();
  theFire.display();
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
  fireWorksButton.click();
}
void mousePressed() {
  dragButton.pressed();
  fireWorksButton.pressed();
}
void mouseReleased() {
  dragButton.released();
  fireWorksButton.released();
}
