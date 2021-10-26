Starz[] starling;
boolean rightClick, leftClick = false;

void setup() {
  size (400, 400);
  starling = new Starz[100];
  for (int i = 0; i < starling.length; i++) {
    starling[i] = new Starz();
  }
}

void draw() {
  background (0);
  for (int i = 0; i < starling.length; i++) {
    starling [i].show();
    starling[i].move();
  }
  
}

void mousePressed(){
 if (mouseButton == LEFT){
  if (leftClick == false){
    leftClick = true;
  } else {
    leftClick = false;
  }
 }
 
 if (mouseButton == RIGHT){
  if (rightClick == false){
    rightClick = true;
  } else {
    rightClick = false;
  }
 }
}

class Starz {
  double myX, myY, mySpeed, myAngle;
  int mySize, myColor;
  Starz() {
    myX = 200;
    myY = 200;
    myAngle = (Math.random()*(2*Math.PI));
    mySpeed = (Math.random()*10);
    mySize = 5 ;
  }
  void move() {
    myX = (myX+Math.cos(myAngle)*mySpeed);
    myY = (myY+Math.sin(myAngle)*mySpeed);
  }
  void show() {
    myColor = color((int)(Math.random()*235)+52, (int)(Math.random()*235)+52, (int)(Math.random()*235)+52);
    noStroke();
    fill (myColor);
    ellipse ((float)myX, (float) myY, mySize, mySize);
  }
}
