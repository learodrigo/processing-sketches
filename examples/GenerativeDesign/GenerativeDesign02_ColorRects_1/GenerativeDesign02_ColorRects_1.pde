boolean r = false;

void setup () {
  size(900, 900, P2D);
  noCursor();
  colorMode(HSB, 360, 100, 100);
  rectMode(CENTER);
  noStroke();
  background(51);
  frameRate(10);
}

void draw () {
  background(51);
  drawRects();

  if (r) {
    rec();
    if (frameCount == 360) {
      exit();
    }
  }
}

void drawRects () {
  for (int y = 0; y < 9; y++) {
    for (int x = 0; x < 9; x++) {
      drawRect(x * 90 + 90, y * 90 + 90);
    }
  }
}

void drawRect (int x, int y) {
  push();
  translate(x, y);
  rotate(-0.2);
  fill(random(360), 100, 100);
  rect(0, 0, 90, 90);
  pop();

  float rdn = random(50, 80);
  
  push();
  translate(x, y);
  rotate(0.3);
  fill(360 - random(360) / 2, 100, 100);
  rect(0, 0, rdn, rdn);
  pop();

  push();
  translate(x, y);
  rotate(0.6);
  fill(360 - random(360) / 2, 100, 100);
  rect(0, 0, rdn / 1.5, rdn / 1.5);
  pop();

  push();
  translate(x, y);
  rotate(0.9);
  fill(360 - random(360) / 2, 100, 100);
  rect(0, 0, rdn / 2.5, rdn / 2.5);
  pop();
}
