class TimerButton {
  float buttonX, buttonY, buttonW, buttonH;
  color normal, rollover, inactive, timerColor;
  int STATE = 0;
  int ACTIVE_STATE = 0;
  int INACTIVE_STATE = 1;
  int ROLLOVER_STATE = 2;
  int startTime, endTime, totalTime;
  char characterCode;
  boolean isRectangle = true;
  TimerButton (float _x, float _y, float _w, char _charCode) {
    buttonX = _x;
    buttonY = _y;
    buttonW = _w;
    buttonH = _w;
    normal = color(109, 100, 230);
    rollover = color(230, 10, 130);
    inactive = color(100);
    timerColor = color(70, 70, 80);
    totalTime = 2500;
    characterCode = _charCode;
  }
  void drawButton() {
    switch (STATE) {
    case 0: // ACTIVE
      fill(normal);
      break;
    case 1: //INACTIVE
      fill(inactive);
      break;
    case 2: // ROLLOVER
      fill(rollover);
      break;
    }
    if (isRectangle) {
      rect(buttonX, buttonY, buttonW, buttonH);
    } else {
      ellipse(buttonX, buttonY, buttonW, buttonH);
    }
    drawTimerShape();
    textAlign(CENTER);
    textSize(16);
    textFont(avantGarde);
    fill(0);
    if (isRectangle) {
      text(characterCode, buttonX + buttonW*.5, buttonY + buttonH*.6);
    } else {
      text(characterCode, buttonX + buttonW * .01, buttonY + buttonH * .1);
    }
  }
  void drawTimerShape() {
    if (STATE == INACTIVE_STATE) {
      fill(timerColor);
      float percent = float(millis() - startTime)/float(totalTime);
      if (isRectangle) {
        rect(buttonX, buttonY, buttonW, buttonH * percent);
      } else {
        ellipse(buttonX, buttonY, buttonW * percent, buttonH * percent);
      }
    }
  }
  void checkState() {
    // rollover handler:
    if (STATE != INACTIVE_STATE) {
      if (isRectangle) {
        if (mouseX > buttonX && mouseX < buttonX + buttonW 
          && mouseY > buttonY && mouseY < buttonY + buttonH) {
          STATE = ROLLOVER_STATE;
        } else {
          STATE = ACTIVE_STATE;
        }
      } else {
        if (dist(mouseX, mouseY, buttonX, buttonY) < buttonW*.5) {
          STATE = ROLLOVER_STATE;
        } else {
          STATE = ACTIVE_STATE;
        }
      }
    } else {
      if (millis() > endTime) {
        STATE = ACTIVE_STATE;
      }
    }
  }
  void activateButton() {
    if (STATE != INACTIVE_STATE) {
      startTime = millis();
      endTime = millis() + totalTime;
      STATE = INACTIVE_STATE;
    }
  }
  void handleKey(char typed) {
    if (typed == characterCode) {
      activateButton();
    }
  }
  void handleClick() {
    if (STATE == ROLLOVER_STATE) {
      // if the mouse is over the button
      activateButton();
    }
  }
}
