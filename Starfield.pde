Starz[] starling;
double newX, newY;

boolean leftClick = false;
boolean cClick = false;

int pattern;
int sizePattern;
int patternUnderSizePattern=0;

int increasingSize =0;

int r = 0;
int g = 0;
int b = 0;

void setup() {
  size (400, 400);
  starling = new Starz[700];

  for (int i = 0; i < starling.length; i++) {
    starling[i] = new Starz(200, 200, 0, 0, 0, 0, 0);
    starling[0] = new Oddity(200, 200, 0, 0);
  }
}

void draw() {
  background (0);

  update(mouseX, mouseY);

  helpDisplay();
  helpOpen(); //showing instructions

  fill (255);
  if (pattern == 0) {
    text("Pattern 1: firework", 40, 360);
    info();
  } else if (pattern == 1) {
    text("Pattern 2: target", 40, 360);
     info();
  } else if (pattern == 2) {
    text("Pattern 3: grid", 40, 360);
     info();
  } else if (pattern == 3) {
    text("Pattern 4: star", 40, 360);
     info();
  } else if (pattern == 4) {
    text("Pattern 5: ", 40, 360);
     info();
  } else if (pattern == 5) {
    text("Pattern 6: ", 40, 360);
     info();
  } //patterns 4 and 5 aren't doing anything

  if (mousePressed && mouseButton == LEFT) {
    for (int i = 0; i < starling.length; i++) {
      starling[i] = new Starz(newX, newY, pattern, increasingSize, r, g, b);
      starling[0] = new Oddity (newX, newY, pattern, increasingSize);
     
    }
  }

  for (int i = 0; i < starling.length; i++) {
    starling [i].show();
    starling[i].move();
    
  }
   
 
}

void info(){
    text ("default size: 5     current size: " + (5+increasingSize), 40, 380);

    if (cClick){
        text ("Rainbow?: No", 240, 360);
    } else {
        text ("Rainbow?: Yes", 240, 360);
    }
}



//classes
class Oddity extends Starz {
  Oddity (double x, double y, int chosenPattern, int newSize) {
    super(x, y, chosenPattern, newSize, r, g, b);
    pattern = chosenPattern;
    
    myX = x;
    myY = y;
    myAngle = (Math.random()*(2*Math.PI));
    mySpeed = (Math.random()*10);
    mySize = 30+newSize;
    
    //
  }
  void move() {
    //maybe make it "walk" or rotate
    myX = myX+(int)(Math.random()*5)-2;
    myY = myY+(int)(Math.random()*5)-2;
  }

  void show() {
    myColor = color((int)(Math.random()*235)+52, (int)(Math.random()*235)+52, (int)(Math.random()*235)+52);
    fill (myColor);
    noStroke();
    ellipse ((float)myX, (float)myY, mySize, mySize);
  }
}


class Starz {
  double myX, myY, mySpeed, myAngle;
  int mySize, myColor;
  int pattern;
  int newPatternUnderSizePattern;
  double xInt, yInt;

  Starz(double x, double y, int chosenPattern, int newSize, int r, int g, int b) {
    pattern = chosenPattern;

    if (pattern == 0) { //normal
      myX = x;
      myY = y;
      myAngle = (Math.random()*(2*Math.PI));
      mySpeed = (Math.random()*10);
      if (cClick) {
        myColor = color (r, g, b);
      } else {
        myColor = color((int)(Math.random()*235)+52, (int)(Math.random()*235)+52, (int)(Math.random()*235)+52);
      }  
      mySize = 5+newSize;
    } else if (pattern == 1) { // target
      myX = x;
      myY = y;
      myAngle = (Math.random()*(2*Math.PI));
      mySpeed = (int)(Math.random()*10);
        if (cClick) {
        myColor = color (r, g, b);
      } else {
        myColor = color((int)(Math.random()*235)+52, (int)(Math.random()*235)+52, (int)(Math.random()*235)+52);
      }  mySize = 5+newSize;
    } else if (pattern == 2) { // grid
      myX = x;
      myY = y;
      myAngle = (Math.random()*(2*Math.PI));
      mySpeed = (Math.random()*10);
        if (cClick) {
        myColor = color (r, g, b);
      } else {
        myColor = color((int)(Math.random()*235)+52, (int)(Math.random()*235)+52, (int)(Math.random()*235)+52);
      } mySize = 5+newSize;
    } else if (pattern == 3) { //star
      myX = x;
      myY = y;
      myAngle = (int)(Math.random()*(2*Math.PI));
      mySpeed = (Math.random()*10);
        if (cClick) {
        myColor = color (r, g, b);
      } else {
        myColor = color((int)(Math.random()*235)+52, (int)(Math.random()*235)+52, (int)(Math.random()*235)+52);
      } mySize = 5+newSize;
    }
  }
  void move() {
    if (pattern == 2) {
      myX = (int)(myX+Math.cos(myAngle)*mySpeed);
      myY = (int)(myY+Math.sin(myAngle)*mySpeed);
    } else {
      myX = (myX+Math.cos(myAngle)*mySpeed);
      myY = (myY+Math.sin(myAngle)*mySpeed);
    }
  }

  void show() {

    noStroke();
    println (cClick);

    fill (myColor);
    ellipse ((float)myX, (float) myY, mySize, mySize);
  }
}



//help button
boolean overHelp(int x, int y, int diameter) {
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } else {
    return false;
  }
}

void update(int x, int y) {
  if (overHelp(helpButtonX, helpButtonY, helpButtonSize))
  {
    helpOver = true;
  } else {
    helpOver = false;
  }
}

void helpOpen() {
  if (leftClick == false) {
    fill (255);
    textSize (20);
    text ("Welcome to Star Field!", 10, 30);
    textSize(13);
    text ("left click to move the starfield around", 40, 60);
    text ("right click to reverse", 40, 80);
    text ("click 'a' or 'd' to change the mode", 40, 100);
    text ("click 'w' or 's' to change the size", 40, 120);
    text ("click 'f' to have a rainbow color and 'c' to have one color", 40, 140);

    text ("there are currently four modes: ", 40, 160);
    text ("firework, target, grid, star ", 40, 180);

    text ("click to start", 40, 220);
  }
}

int helpButtonX =360;
int helpButtonY=30;
int helpButtonSize =20;
boolean helpOver;

void helpDisplay() {
  //help button look
  fill (255, 0, 0);
  ellipse (helpButtonX, helpButtonY, helpButtonSize, helpButtonSize);
  //help button text
  fill (255);
  text ("?", 357, 35);
  text ("right click", 330, 50);
}


//keyboard inputs
float wheelCount = 0;
void keyPressed() {


  // click A or D to change mode
  if ((key == 'D' || key == 'd')&& wheelCount < 6) {
    wheelCount++;
  } else if ((key =='A' || key == 'a')&& wheelCount > 0) {
    wheelCount--;
  }

  for (int i = 0; i < 4; i++) {
    if (wheelCount == i) {
      pattern = i;
      sizePattern = i;
      //println(pattern);
    }
  }

  // click W or S to change size
  if ((key == 'W' || key == 'w')) {
    increasingSize++;
  } else if ((key =='S' || key == 's')) {
    if (increasingSize > 0) {
      increasingSize--;
    } else {
      increasingSize = 0;
    }
  }

  if ((key == 'c' || key == 'C')) {
    r = (int)(Math.random()*235)+52;
    g = (int)(Math.random()*235)+52;
    b = (int)(Math.random()*235)+52;
    cClick = true;
  }
  if ((key == 'f' || key == 'F')) {
    cClick = false;
   
  }
  if ((key == 'b' || key == 'B') && b < 256) {
     
  }
}


//mouse inputs
void mousePressed() {

  if (helpOver) {
    leftClick = false;
  }

  if (mouseButton == LEFT) {
    newX = mouseX;
    newY = mouseY;
    leftClick = true;
    
  }

  if (mouseButton == RIGHT) {
    for (int i = 0; i < starling.length; i++) {
      starling[i].mySpeed*=-1;
    }
    redraw();
  }
}
