float tileWidth, tileHeight, endSize, endOffset;
int circleCount;

float tileCountX = 10;
float tileCountY = 10;

int actRandomSeed = 0;

void setup () {
  size(900, 900);
  stroke(255);
  strokeWeight(1);

  tileWidth = width / tileCountX;
  tileHeight = height / tileCountY;
}

void draw () {
  background(0);
  randomSeed(actRandomSeed);

  circleCount = mouseX / 30 + 1;
  endSize = map(mouseX, 0, width, tileWidth / 2, 0);
  endOffset = map(mouseY, 0, height, 0, (tileWidth - endSize) / 2);

  for (int y = 0; y <= tileCountY; y++) {
    for (int x = 0; x <= tileCountX; x++) {
      pushMatrix();
        translate(tileWidth * x, tileHeight * y);
        scale(1, tileHeight / tileWidth);

        int toggle = (int) random(0,4);
        if (toggle == 0) rotate(-HALF_PI);
        if (toggle == 1) rotate(0);
        if (toggle == 2) rotate(HALF_PI);
        if (toggle == 3) rotate(PI);

        for(int i = 0; i < circleCount; i++) {
            float diam = map(i, 0, circleCount - 1, tileWidth, endSize);
            float offset = map(i, 0, circleCount - 1, 0, endOffset);

            circle(offset, 0, diam);
        }
      popMatrix();
    }
  }
}

void mousePressed() {
  actRandomSeed = (int) random(100000);
}
