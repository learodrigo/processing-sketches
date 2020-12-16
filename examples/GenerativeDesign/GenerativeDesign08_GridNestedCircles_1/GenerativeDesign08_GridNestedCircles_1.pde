float tileWidth, tileHeight, endSize, endOffset;
int circleCount;

float tileCountX = 10;
float tileCountY = 10;

int actRandomSeed = 0;

void setup () {
  size(900, 900);
  stroke(255, 150);
  strokeWeight(0.1);
  noFill();

  tileWidth = width / tileCountX;
  tileHeight = height / tileCountY;
}

void draw () {
  background(0);
  randomSeed(actRandomSeed);

  if (mouseX > 0) {
    circleCount = mouseX / 30 + 1;
    endSize = map(mouseX, 0, width, tileWidth / 2, 0);
  }
  if (mouseY > 0) {
    endOffset = map(mouseY, 0, height, 0, (tileWidth - endSize) / 2);
  }

  for (int y = 0; y <= tileCountY; y++) {
    for (int x = 0; x <= tileCountX; x++) {
      push();
        translate(tileWidth * x, tileHeight * y);
        scale(1, tileHeight / tileWidth);
  
        int toggle = (int) random(0, 4);
        if (toggle == 0) rotate(-HALF_PI);
        if (toggle == 1) rotate(0);
        if (toggle == 2) rotate(HALF_PI);
        if (toggle == 3) rotate(PI);

        if (circleCount > 0) {
          for (int i = 0; i < circleCount; i++) {
            float diam = map(i, 0, circleCount - 1, tileWidth, endSize);
            float offset = map(i, 0, circleCount - 1, 0, endOffset);
    
            circle(offset, 0, sqrt(diam));
            circle(offset, 0, diam);
            circle(offset, 0, pow(diam, 3));
            
            rect(offset, 0, diam, diam);
            
            if (i == (int) random(circleCount)) rect(offset, 0, diam, diam);
          }
        }

      pop();
    }
  }
}

void actRandomSeed () {
  actRandomSeed = (int) random(100000);
}

void mousePressed () {
  actRandomSeed ();
}
