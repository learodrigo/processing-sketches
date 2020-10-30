import ddf.minim.*;
import ddf.minim.signals.*;
Minim minim;
AudioPlayer mySound;

float n4;
float n6;

void setup() {
  size(900, 900, P3D);
  noCursor();
  smooth();
  background(0);
  noStroke();
  frameRate(24);

  minim = new Minim(this);
  mySound = minim.loadFile("idk.mp3");
  mySound.play();
}

void draw() {
  fill(0,50);
  rect(0, 0, width, height);
  translate(width / 2, height / 2);

  for (int i = 0; i < mySound.bufferSize() - 1; i++) {
    float angle = sin(i + n4) * 10;
    float angle2 = sin(i + n6) * 300;

    float x = sin(radians(i)) * (angle2 + 30);
    float y = cos(radians(i)) * (angle2 + 30);

    float x3 = sin(radians(i)) * (500 / angle);
    float y3 = cos(radians(i)) * (500 / angle);

    fill(#000000, 90);
    ellipse(x, y, mySound.left.get(i) * 10, mySound.left.get(i) * 10);

    fill(#ffffff, 60);
    rect(x3, y3, mySound.left.get(i) * 20, mySound.left.get(i) * 10);

    fill(#ff9800  , 90);
    rect(x, y, mySound.right.get(i) * 10, mySound.left.get(i) * 10);

    fill(#ffffff , 70);
    rect(x3, y3, mySound.right.get(i) * 10, mySound.right.get(i) * 20);
  }

  n4 += 0.008;
  n6 += 0.06;
}
