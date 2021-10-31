

Starz[] starling;
double newX, newY;

boolean leftClick = false;

int pattern;
int sizePattern;
int patternUnderSizePattern=0;

int star5 = 0;
int star4 = 0;
int star3 = 0;

int increasingSize =0;

int helpButtonX =370;
int helpButtonY=30;
int helpButtonSize =20;
boolean helpOver;

int r = 0;
int g = 0;
int b = 0;

void setup() {
  size (400, 400);
  starling = new Starz[700];

  for (int i = 0; i < starling.length; i++) {
    starling[i] = new Starz(200, 200, 0, 0);
    starling[0] = new Oddity(200, 200, 0, 0);
  }
}



void draw() {
  background (0);

  update(mouseX, mouseY);
  if (helpOver) {
  }
  fill (255, 0, 0);
  ellipse (helpButtonX, helpButtonY, helpButtonSize, helpButtonSize);

  if (leftClick == false) {
    fill (255);
    textSize (20);
    text ("Welcome to Star Field!", 10, 30);
    textSize(13);
    text ("left click to move the starfield around", 40, 60);
    text ("right click to reverse", 40, 80);
    text ("click 'a' or 'd' to change the mode", 40, 100);
    text ("click 'w' or 's' to change the size", 40, 120);

    text ("there are currently four modes: ", 40, 140);
    text ("firework, target, grid, star ", 40, 160);

    text ("click to start", 40, 200);
  }
  //help button text
  fill (255);
  text ("?", 367, 35);

  text ("right click", 340, 50);

  if (mousePressed && mouseButton == LEFT) {
    for (int i = 0; i < starling.length; i++) {
      starling[i] = new Starz(newX, newY, pattern, increasingSize);
      starling[0] = new Oddity (newX, newY, pattern, increasingSize);
    }
  }

  fill (255);
  if (pattern == 0) {
    text("Pattern 1: firework", 40, 360);
    text ("default size: 5     current size: " + (5+increasingSize), 40, 380);
  } else if (pattern == 1) {
    text("Pattern 2: target", 40, 360);
    text ("default size: 5     current size: " + (5+increasingSize), 40, 380);
  } else if (pattern == 2) {
    text("Pattern 3: grid", 40, 360);
    text ("default size: 5     current size: " + (5+increasingSize), 40, 380);
  } else if (pattern == 3) {
    text("Pattern 4: star", 40, 360);
    text ("default size: 5     current size: " + (5+increasingSize), 40, 380);
  } else if (pattern == 4) {
    text("Pattern 5: ", 40, 360);
    text ("default size: 5     current size: " + (5+increasingSize), 40, 380);
  } else if (pattern == 5) {
    text("Pattern 6: ", 40, 360);
    text ("default size: 5     current size: " + (5+increasingSize), 40, 380);
  }

  for (int i = 0; i < starling.length; i++) {
    starling [i].show();
    starling[i].move();
  }


}
void mousePressed() {

  if (helpOver) {
    leftClick = false;
  }

  if (mouseButton == LEFT) {
    newX = mouseX;
    newY = mouseY;
    leftClick = true;
  }

  if (mouseButton == RIGHT){
    for (int i = 0; i < starling.length; i++){
      starling[i].mySpeed*=-1;
    }
    redraw();
  }
  /*
  if (mouseButton == RIGHT) {
   if (sizePattern == 4) {
   increasingSize++;
   } else if (sizePattern == 5) {
   if (increasingSize > 0) {
   increasingSize--;
   } else {
   increasingSize = 0;
   }
   }
   }
   
   
   if (sizePattern == 4 || sizePattern ==5) {
   
   if (mouseButton == CENTER && patternUnderSizePattern < 6) {
   
   patternUnderSizePattern++;
   println(patternUnderSizePattern);
   } else {
   patternUnderSizePattern =0;
   }
   }
   */
}

/*
void mouseWheel(MouseEvent event) {
 
 if (wheelCount < 12 && event.getCount()==1) {
 wheelCount+= event.getCount();
 } else if (wheelCount > 0 && event.getCount() == -1) {
 wheelCount+= event.getCount();
 }
 //println(wheelCount);
 
 for (int i = 0; i < 6; i++) {
 if (wheelCount/2 == i) {
 pattern = i;
 sizePattern = i;
 //  println(pattern);
 }
 }
 }
 */

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
  
  if (key == 'b' || key == 'B'){
  }
}


class Starz {
  double myX, myY, mySpeed, myAngle;
  int mySize, myColor;
  int pattern;
  int newPatternUnderSizePattern;
  double xInt, yInt;

  Starz(double x, double y, int chosenPattern, int newSize) {
    pattern = chosenPattern;
    if (pattern == 0) { //normal
      myX = x;
      myY = y;
      myAngle = (Math.random()*(2*Math.PI));
      mySpeed = (Math.random()*10);
      myColor = color((int)(Math.random()*235)+52, (int)(Math.random()*235)+52, (int)(Math.random()*235)+52);
      mySize = 5+newSize;
    } else if (pattern == 1) { // target
      myX = x;
      myY = y;
      myAngle = (Math.random()*(2*Math.PI));
      mySpeed = (int)(Math.random()*10);
      myColor = color((int)(Math.random()*235)+52, (int)(Math.random()*235)+52, (int)(Math.random()*235)+52);
      mySize = 5+newSize;
    } else if (pattern == 2) { // grid
      myX = x;
      myY = y;
      myAngle = (Math.random()*(2*Math.PI));
      mySpeed = (Math.random()*10);
      myColor = color((int)(Math.random()*235)+52, (int)(Math.random()*235)+52, (int)(Math.random()*235)+52);
      mySize = 5+newSize;
    } else if (pattern == 3) { //star
      myX = x;
      myY = y;
      myAngle = (int)(Math.random()*(2*Math.PI));
      mySpeed = (Math.random()*10);
      myColor = color((int)(Math.random()*235)+52, (int)(Math.random()*235)+52, (int)(Math.random()*235)+52);
      mySize = 5+newSize;
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
    fill (myColor);


    ellipse ((float)myX, (float) myY, mySize, mySize);
  }
}

class Oddity extends Starz {
  int rarityRNG;
  int RNG;
  Oddity (double x, double y, int chosenPattern, int newSize) {
    super(x, y, chosenPattern, newSize);
    pattern = chosenPattern;
    RNG = (int)(Math.random()*100); // RNG doesn't do anything

    if (RNG <= 10) {
      rarityRNG = 2; //3, 4, 5 star
      myColor = color(255, 238, 0);
    } else if (RNG <=40) {
      rarityRNG = 1;
      myColor = color(196, 59, 255);
    } else {
      rarityRNG = 0;
      myColor = color(0, 149, 235);
    }

    myX = x;
    myY = y;
    myAngle = (Math.random()*(2*Math.PI));
    mySpeed = (Math.random()*10);
    mySize = 30+newSize;
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

void update(int x, int y) {
  if (overHelp(helpButtonX, helpButtonY, helpButtonSize))
  {
    helpOver = true;
  } else {
    helpOver = false;
  }
}

boolean overHelp(int x, int y, int diameter) {
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } else {
    return false;
  }
}
