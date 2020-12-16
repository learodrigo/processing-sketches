void setup () {
  size(900, 900, P2D);
  background(0);
  frameRate(10);

  stroke(255, 50);
  noFill();
  smooth();
}

void draw () {
  translate(width / 2, height / 2);

  int circleResolution = (int) map(random(1, height), 0, height, 3, 12);
  float radius = abs(sin(frameCount) * width / 2) - 50;
  float angle = TWO_PI / circleResolution;

  int sw = (int) abs(sin(frameCount) * random(2, 8));
  strokeWeight(sw);

  beginShape();
    for (int i = 0; i <= circleResolution; i++) {
      float x = cos(angle * i) * radius;
      float y = sin(angle * i) * radius;

      //line(0, 0, x, y);
      vertex(x, y);
    }
  endShape();
}

void keyPressed () {
  if (key == ' ') {
    background(0);
  }
}
