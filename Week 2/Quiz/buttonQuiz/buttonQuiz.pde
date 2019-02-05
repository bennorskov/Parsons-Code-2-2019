float circleButtonX, circleButtonY, circleButtonD;
float squareButtonX, squareButtonY, squareButtonD;

boolean circleClick = false;
boolean squareClick = false;

color leftBgColor, rightBgColor, leftBgColorClick, rightBgColorClick;

String displayQuote = "No Buttons Clicked";

void setup() {
	size(600, 300);
	noStroke();

	circleButtonX = 150;
	circleButtonY = 150;
	circleButtonD = 80;

	squareButtonX = 400;
	squareButtonY = 100;
	squareButtonD = 100;

	leftBgColor = color(100, 100, 200);
	leftBgColorClick = color(255, 100, 200);
	rightBgColor = color(30, 20, 100);
	rightBgColorClick = color(30, 200, 150);
}
void draw() {
	//——— ——— ——— ——— ——— left side circle
	if (circleClick) {
		fill(leftBgColor);
	} else {
		fill(leftBgColorClick);
	}
	// this rectangle is the left background
	rect(0, 0, 300, 300);

	drawCircleButton();

	//——— ——— ——— ——— ——— right side square
	if (squareClick) {
		fill(rightBgColor);
	} else {
		fill(rightBgColorClick);
	}
	// this rectangle is the right background
	rect(300, 0, 300, 300);

	drawSquareButton();

	// keeping things in functions makes the code neater.
	drawText();
}

void drawCircleButton() {
	// this is the rollover code for a circle:
	if (dist(mouseX, mouseY, circleButtonX, circleButtonY) < circleButtonD*.5) {
		fill(255);
	} else {
		fill(200);
	}
	// change the fill, then draw the circle:
	ellipse(circleButtonX, circleButtonY, circleButtonD, circleButtonD);

}
void drawSquareButton() {
	// this is hit detection for a square:
	if (mouseX > squareButtonX &&
		mouseX < squareButtonX + squareButtonD &&
		mouseY > squareButtonY &&
		mouseY < squareButtonY + squareButtonD) {
		fill(255);
	} else {
		fill(200);
	}
	rect(squareButtonX, squareButtonY, squareButtonD, squareButtonD);
}

void drawText() {
	fill(255);
	textSize(32);
	// I could have done an array for text, then displayed it with textArray[index]
	// changing the index for each click, but thought this would be simpler
	text(displayQuote, 150, 250);
}
void mouseClicked() {
	// circle hit detection:
	if (dist(mouseX, mouseY, circleButtonX, circleButtonY) < circleButtonD*.5) {
		// if inside the circle, change the boolean to not false ("!" means "not" this)
		// note that this boolean is only changed on this line, and no where else in the code
		// it does not affect the rollover code
		circleClick = !circleClick;
	}

	// square hit detection:
	if (mouseX > squareButtonX &&
		mouseX < squareButtonX + squareButtonD &&
		mouseY > squareButtonY &&
		mouseY < squareButtonY + squareButtonD) {
		// same stuff, just for a square
		squareClick = !squareClick;
	}

	// after switching the booleans, change the text to reflect which has been clicked
	if (circleClick && squareClick) {
		displayQuote = "Both Buttons!";
	} else if (circleClick && !squareClick) {
		displayQuote = "Left Button";
	} else if (!circleClick && squareClick) {
		displayQuote = "Right Button";
	} else {
		displayQuote = "No Buttons Clicked";
	}
}
