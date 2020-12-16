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
  fill(random(360), 100, 100);
  rect(x, y, 90, 90);

  float rdn = random(60, 80);
  fill(360 - random(360) / 2, 100, 100);
  rect(x, y, rdn, rdn);

  fill(360 - random(360) / 2, 100, 100);
  rect(x, y, rdn / 1.5, rdn / 1.5);

  fill(360 - random(360) / 2, 100, 100);
  rect(x, y, rdn / 2.5, rdn / 2.5);
}
