color GREY = #f1f1f1;
color RED = #ff0000;
color GREEN = #10E09C;

int amount = 5;
int[][] state = new int[amount][amount];

int mx, my;
PImage image1, image2, image3;

void setup() {
  size(750, 750);
  noStroke();

  for (int x = 0; x < amount; x++) {
    for (int y = 0; y < amount; y++) {
      state[x][y] = int(random(0, 6));
    }
  }

  image1 = loadImage("images/1.jpeg");
  image1.resize(width, height);

  image2 = loadImage("images/2.jpeg");
  image2.resize(width, height);

  image3 = loadImage("images/3.jpeg");
  image3.resize(width, height);
}

void drawShape(int state, float tileW, float tileH, int x, int y) {
  // copy method variables
  int sx = int(tileW * x);
  int sy = int(tileH * y);
  int sw = int(tileW);
  int sh = int(tileH);

  int dx = sx;
  int dy = sy;
  int dw = sw;
  int dh = sh;

  if (state == 0) {
    pushMatrix();
    translate(x * tileW, y * tileH);
    ellipse(0, 0, tileW, tileH);
    popMatrix();

  } else if (state == 1) {
    pushMatrix();
    translate(x * tileW, y * tileH);
    rect(0, 0, tileW, tileH);
    popMatrix();

  } else if (state == 2) {
    pushMatrix();
    translate(x * tileW, y * tileH);
    triangle(0, 0, tileW, tileH, 0, tileW);
    popMatrix();

  } else if (state == 3) {
    copy(image1, sx, sy, sw, sh, dx, dy, dw, dh);

  } else if (state == 4) {
    copy(image2, sx, sy, sw, sh, dx, dy, dw, dh);

  } else if (state == 5) {
    pushMatrix();
    translate(x * tileW, y * tileH);
    triangle(0, 0, tileW / 2, tileH, tileW, 0);
    popMatrix();
  }
}

void draw() {
  background(GREY);

  image(image3, 0, 0);

  float tileW = width / amount;
  float tileH = height / amount;

  fill(GREEN);
  noStroke();
  ellipseMode(CORNER);

  // Checks where the mouse is
  mx = int(map(mouseX, 0, width, 0, amount));
  my = int(map(mouseY, 0, height, 0, amount));

  for (int x = 0; x < amount; x++) {
    for (int y = 0; y < amount; y++) {
      drawShape(state[x][y], tileW, tileH, x, y);
    }
  }
}

void countUp(int x, int y) {
  if (state[x][y] < 5) {
    state[x][y]++;
  } else {
    state[x][y] = 0;
  }
}

void mouseReleased() {
  countUp(mx,my);
  saveFrame("output/interactiveGrisSystem-####.png");
}
