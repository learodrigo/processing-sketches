// Taken from http://flong.com/archive/texts/lists/slit_scan/index.html

import processing.video.*;

Capture myCap;

int X = 0;

void setup() {
  myCap = new Capture(this, 640, 320);
  myCap.start();

  size(800, 320);
}

void draw() {
  if (myCap.available()) {
    myCap.read();
    myCap.loadPixels();
    copy(myCap, (myCap.width / 2), 0, 1, myCap.height, (X++ % width), 0, 1, height);
  }
}
