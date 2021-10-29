

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

void setup() {
  size (400, 400);
  starling = new Starz[700];

  for (int i = 0; i < starling.length; i++) {
    starling[i] = new Starz(200, 200, 0, 0, 0, 0);
    starling[0] = new Oddity(200, 200, 0, 0, 0, 0);
  }
}



void draw() {
  background (0);
  //pattern = (int)(Math.random()*3);

  if (mousePressed && mouseButton == LEFT) {
    for (int i = 0; i < starling.length; i++) {
      starling[i] = new Starz(newX, newY, pattern, increasingSize, sizePattern, patternUnderSizePattern);
      starling[0] = new Oddity (newX, newY, pattern, increasingSize, sizePattern, patternUnderSizePattern);
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
    text("Pattern: star", 40, 360);
  } else if (sizePattern == 4) {
    text("Pattern: increasing size", 40, 360);
    text ("increasing by: " + increasingSize, 40, 380);
    if (patternUnderSizePattern == 0) {
      text("Pattern: firework", 40, 340);
    } else if (patternUnderSizePattern == 1) {
      text("Pattern: target", 40, 340);
    } else if (patternUnderSizePattern == 2) {
      text("Pattern: grid", 40, 340);
    } else if (patternUnderSizePattern == 3) {
      text("Pattern: star", 40, 340);
    }
  } else if (sizePattern == 5) {
    text("Pattern: decreasing size", 40, 360);
    text ("decreasing by: " + increasingSize, 40, 380);
  }
}
void mousePressed() {
  if (mouseButton == LEFT) {
    newX = mouseX;
    newY = mouseY;
    
  }

  if (mouseButton == RIGHT) {
    if (sizePattern == 4) {
      increasingSize++;
    } else if (sizePattern == 5) {
      increasingSize--;
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
}
float wheelCount = 0;
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
      println(pattern);
    }
  }
}


class Starz {
  double myX, myY, mySpeed, myAngle;
  int mySize, myColor;
  int pattern;
  int newPatternUnderSizePattern;

  Starz(double x, double y, int chosenPattern, int newSize, int newSizePattern, int newPatternUnderSizePattern) {
    myColor = color((int)(Math.random()*235)+52, (int)(Math.random()*235)+52, (int)(Math.random()*235)+52);
    pattern = chosenPattern;
    newPatternUnderSizePattern = newPatternUnderSizePattern;
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
      myX = x;
      myY = y;
      myAngle = (int)(Math.random()*(2*Math.PI));
      mySpeed = (Math.random()*10);
      mySize = 5 ;
    } else if (sizePattern == 4) {

      if (newPatternUnderSizePattern ==3) {
        myX = x;
        myY = y;
        myAngle = (int)(Math.random()*(2*Math.PI));
        mySpeed = (Math.random()*10);
        mySize = 5+newSize;
      } else if (newPatternUnderSizePattern ==2) {
        myX = x;
        myY = y;
        myAngle = (Math.random()*(2*Math.PI));
        mySpeed = (Math.random()*10);
        mySize = 5+newSize ;
      } else if (newPatternUnderSizePattern ==1) {
        myX = x;
        myY = y;
        myAngle = (Math.random()*(2*Math.PI));
        mySpeed = (int)(Math.random()*10);
        mySize = 5+newSize ;
      } else if (newPatternUnderSizePattern ==0) {
        myX = x;
        myY = y;
        myAngle = (Math.random()*(2*Math.PI));
        mySpeed = (Math.random()*10);
        mySize = 5+newSize ;
      }
    } else if (sizePattern == 5) {
      if (newPatternUnderSizePattern ==3) {
        myX = x;
        myY = y;
        myAngle = (int)(Math.random()*(2*Math.PI));
        mySpeed = (Math.random()*10);
        mySize = 5+newSize;
      } else if (newPatternUnderSizePattern ==2) {
        myX = x;
        myY = y;
        myAngle = (Math.random()*(2*Math.PI));
        mySpeed = (Math.random()*10);
        mySize = 5+newSize ;
      } else if (newPatternUnderSizePattern ==1) {
        myX = x;
        myY = y;
        myAngle = (Math.random()*(2*Math.PI));
        mySpeed = (int)(Math.random()*10);
        mySize = 5+newSize ;
      } else if (newPatternUnderSizePattern ==0) {
        myX = x;
        myY = y;
        myAngle = (Math.random()*(2*Math.PI));
        mySpeed = (Math.random()*10);
        mySize = 5+newSize ;
      }
    } else if (pattern == 6) {
    }
  }
  void move() {
    if (pattern == 2 || newPatternUnderSizePattern == 2) {
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
  Oddity (double x, double y, int chosenPattern, int newSize, int newSizePattern, int newPatternUnderSizePattern) {
    super(x, y, chosenPattern, newSize, newSizePattern, newPatternUnderSizePattern);
    pattern = chosenPattern;
    RNG = (int)(Math.random()*100);

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
    mySize = 40+newSize;
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
    ellipse ((float)myX, (float)myY, 20, 20);
  }
}
