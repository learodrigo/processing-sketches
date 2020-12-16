void setup () {
  frameRate(30);
  size(600, 600, P2D);

  ellipse(50, 50, 60, 60);
  strokeWeight(4);
  fill(128);
  rect(50, 50, 40, 30);

  stroke(0);
  translate(150, 100);
  drawStar();
  translate(120, 150);
  drawStar();
}

void drawStar () {
  line(0, -10, 0, 10);
  line(-8, -5, 8, 5);
  line(-8, 5, 8, -5);
}

void draw () {
  if (frameCount % 30 == 0) {
    println(frameCount);
  }
}
