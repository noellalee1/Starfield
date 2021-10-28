Starz[] starling;
boolean rightClick;
boolean leftClick;
double newX, newY;
int pattern;

void setup() {
  size (400, 400);
  starling = new Starz[700];

  for (int i = 0; i < starling.length; i++) {
    starling[i] = new Starz(200, 200, 0);
  }
}



void draw() {
  background (0);
  //pattern = (int)(Math.random()*3);

  if (mousePressed && mouseButton == LEFT) {
    for (int i = 0; i < starling.length; i++) {
      starling[i] = new Starz(newX, newY, pattern);
    }
  }

  for (int i = 0; i < starling.length; i++) {
    starling [i].show();
    starling[i].move();
  }

  fill (255);
  if (pattern == 0) {
    text("Pattern: firework", 40, 360);
  } else if (pattern == 1) {
    text("Pattern: target", 40, 360);
  } else if (pattern == 2) {
    text("Pattern: grid", 40, 360);
  } else if (pattern == 3) {
    text("Pattern: ", 40, 360);
  }
}
void mousePressed() {
  if (mouseButton == LEFT) {
    newX = mouseX;
    newY = mouseY;
    //leftClick = true;
  }

  if (mouseButton == RIGHT) {
  }
}

float wheelCount = 0;

void mouseWheel(MouseEvent event) {

  if (wheelCount < 12 && event.getCount()==1) {
    wheelCount+= event.getCount();
  } else if (wheelCount > 0 && event.getCount() == -1) {
    wheelCount+= event.getCount();
  } 
  //println(wheelCount);

  for (int i = 0; i < 3; i++) {
    if (wheelCount/2 == i) {
      pattern = i;
      println(pattern);
    }
  }
}


class Starz {
  double myX, myY, mySpeed, myAngle;
  int mySize, myColor;
  int pattern;

  Starz(double x, double y, int chosenPattern) {
    pattern = chosenPattern;
    if (pattern == 0) { //normal
      myX = x;
      myY = y;
      myAngle = (Math.random()*(2*Math.PI));
      mySpeed = (Math.random()*10);
      mySize = 5 ;
    } else if (pattern == 1) { // target
      myX = x;
      myY = y;
      myAngle = (Math.random()*(2*Math.PI));
      mySpeed = (int)(Math.random()*10);
      mySize = 5 ;
    } else if (pattern == 2) { // grid
      myX = x;
      myY = y;
      myAngle = (Math.random()*(2*Math.PI));
      mySpeed = (Math.random()*10);
      mySize = 5 ;
    } else if (pattern == 3) {
    } else if (pattern == 4) {
    } else if (pattern == 5) {
    } else if (pattern == 6) {
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
    myColor = color((int)(Math.random()*235)+52, (int)(Math.random()*235)+52, (int)(Math.random()*235)+52);
    noStroke();
    fill (myColor);
    ellipse ((float)myX, (float) myY, mySize, mySize);
  }
}

class Oddity extends Starz {
  Oddity (double x, double y, int chosenPattern) {
  }
}
