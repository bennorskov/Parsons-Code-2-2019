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
	//left side
	if (circleClick) {
		fill(leftBgColor);
	} else {
		fill(leftBgColorClick);
	}
	rect(0, 0, 300, 300);

	drawCircleButton();

	//right side
	if (squareClick) {
		fill(rightBgColor);
	} else {
		fill(rightBgColorClick);
	}
	rect(300, 0, 300, 300);

	drawSquareButton();

	drawText();
}

void drawCircleButton() {	
	if (dist(mouseX, mouseY, circleButtonX, circleButtonY) < circleButtonD*.5) {
		fill(255);
	} else {
		fill(200);
	}
	ellipse(circleButtonX, circleButtonY, circleButtonD, circleButtonD);

}
void drawSquareButton() {
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
	text(displayQuote, 150, 250);
}
void mouseClicked() {
	if (dist(mouseX, mouseY, circleButtonX, circleButtonY) < circleButtonD*.5) {
		circleClick = !circleClick;	
	}
	if (mouseX > squareButtonX && 
		mouseX < squareButtonX + squareButtonD && 
		mouseY > squareButtonY && 
		mouseY < squareButtonY + squareButtonD) {
		squareClick = !squareClick;
	}
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
