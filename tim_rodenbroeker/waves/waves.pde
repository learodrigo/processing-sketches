void setup () {
  size(1200, 900);
}

void draw () {
  background(0);
  fill(255);
  noStroke();

  ellipse(width / 2, height / 2, 100, 100);

  // sin & cos expect rage 0 - PI
  float wave = sin(radians(frameCount)) * 300;
  float wave2 = cos(radians(frameCount)) * 300;

  strokeWeight(1);
  stroke(255);
  line(290, 0, 290, height);
  line(910, 0, 910, height);

  fill(255);
  ellipse(width / 2 + wave, height * 0.25, 20, 20);

  fill(255);
  ellipse(width / 2 + wave2, height * 0.75, 20, 20);
}
