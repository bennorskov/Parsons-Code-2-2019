class Button {
  float x, y, w, h;
  float dragOffsetX, dragOffsetY;
  boolean isActive = true;
  boolean isPressed = false;
  boolean isHover = false;
  boolean isFollowMouse = false;
  
  color upColor, hoverColor, pressedColor, inactiveColor;
  Button(float _x, float _y, float _w, float _h) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    
    upColor = color(100, 100, 200);
    hoverColor = color(200, 200, 100);
    pressedColor = color(250, 50, 200);
    inactiveColor = color(60);
  } 
  
  void display() {
    if (isActive) {
      if (isPressed) {
        fill(pressedColor);
      } else if (isHover) {
        fill(hoverColor);
      } else {
        fill(upColor);
      }
    } else {
      fill(inactiveColor);
    }
    noStroke();
    rect(x, y, w, h);
  }
  void update() {
    if (isFollowMouse) {
      x = mouseX - dragOffsetX;
      y = mouseY - dragOffsetY;
    } else {
      isHover = isMouseInside();
    }
  }
  // ——————— Mouse Events
  void setupForDrag(){
    dragOffsetX = mouseX - x;
    dragOffsetY = mouseY - y;
    isFollowMouse = true;
  }
  void click(){
    if (isActive) {
      isPressed = !isPressed;
    }
  }
  void pressed(){
    if (isHover) {
      setupForDrag();
    }
  }
  void released(){
    if (isFollowMouse) {
      isFollowMouse = false;
    }
  }
  // ————————————   // ————————————   // ————————————  Hit Detection
  boolean isMouseInside() {
    boolean toReturn = false;
    if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
      toReturn = true;
    }
    return toReturn;
  }
}
