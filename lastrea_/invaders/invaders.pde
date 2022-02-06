int safeMargin = 20, n = 4;
float size, x, y;

void keyPressed() {
  if (key == ' ') {
  }

  if (key == 's') {
    saveFrame("invaders-output.jpg");
  }

  if (key == 'c') {
    background(0);
  }
}


void setup () {
  size(900, 900);
  noLoop();
  noStroke();

  size = width / (n * 2) - safeMargin;
}

void draw () {
  background(0);

  pushMatrix();
    translate(size / 2 + safeMargin, size / 2 + safeMargin);
    renderInvader();
  popMatrix();
}

void renderInvader () {
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n * 2; j++) {
      if (
        random(1) > 0.5 ||
        i == 0 && j == 0 ||
        i == 0 && j == n * 2 - 1 ||
        i == n * 2 - 1 && j == 0 ||
        i == n * 2 - 1 && j == n * 2 - 1
      ) {
        fill(255, 0, 0);
        rect(i * size, j * size, size, size);
        rect((n * 2 - 1) * size, j * size, size, size);
      }
    }
  }

  x = int(random(0, n));
  y = int(random(0, n));

  fill(0, 0, 255);
  rect(x * size, y * size, size, size);
  rect((n * 2 - 1 - x) * size, y * size, size, size);
}
