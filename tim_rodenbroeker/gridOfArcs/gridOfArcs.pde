color bg = #000000;
color fg = #ff0000;

void setup () {
  size(900, 900);
  //frameRate(5);
}

void draw () {
  background(bg);
  fill(fg);
  noStroke();

  float tileX = 4;
  float tileY = tileX;

  float tileW = width / tileX;
  float tileH = height / tileY;

  for (int x = 0; x < tileX; x++) {
    for (int y = 0; y < tileY; y++) {
      float posX = tileW * x;
      float posY = tileH * y;

      float wave = sin(radians(frameCount + x * 10 + y * 10));
      float mappedWave = map(wave, -1, 1, 0, 5);
      int selector = int(mappedWave);

      pushMatrix();

      translate(posX, posY);

      if (selector == 0) {
        arc(0, 0, tileW * 2, tileH * 2, radians(0), radians(90));
      } else if (selector == 1) {
        arc(tileW, 0, tileW * 2, tileH * 2, radians(90), radians(180));
      } else if (selector == 3) {
        arc(tileW, tileH, tileW * 2, tileH * 2, radians(180), radians(270));
      } else if (selector == 4) {
        arc(0, tileH, tileW * 2, tileH * 2, radians(270), radians(360));
      } else {
        rect(0, 0, tileW, tileH);
      }

      popMatrix();
    }
  }
}
