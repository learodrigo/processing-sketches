float amount = 100;
float mag = 400;
float particleSize = 15;

void setup() {
  size(1200, 600);
  background(0);
}

void draw() {
  translate(width / 2, height / 2);

  for (int i = 0; i < amount; i++) {
    float offset = map(sin(radians(frameCount)), -1, 1, -100, 100);
    float posX = map(tan(radians(frameCount * 0.8 + i + offset)), -1, 1, -100, 100);
    float posY = map(tan(radians(frameCount + i)), -1, 1, -mag, mag);

    float col = map(sin(radians(frameCount * 5 + i)), -1, 1, 0, 255);

    fill(col);
    noStroke();
    rect(posX, posY, particleSize, particleSize);
  }
}
