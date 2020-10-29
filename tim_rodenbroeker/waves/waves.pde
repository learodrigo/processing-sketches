void setup () {
  size(900, 900);
}

void draw () {
  background(0);
  fill(255);
  noStroke();
  
  // sin & cos expect rage 0 - PI
  float wave = sin(radians(frameCount)) * 300;
  float wave2 = cos(radians(frameCount)) * 300;
  
  ellipse(width / 2 + wave, height * 0.25, 100, 100);
  ellipse(width / 2 + wave2, height * 0.75, 100, 100);
}
