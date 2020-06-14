/**
 * Sketch that draws a black rectagle and a red circle that rounds it
 *
 */

float t = 0;
float step = 3;
float radius = 250;
float ellipseSize = 50;

void setup () {
  size(700, 700);
  smooth();
  rectMode(CENTER);
}

void draw () {
  background(51);
  fill(150);
  noStroke();
  // Central rectangle
  rect(width / 2, height / 2, 150, 300);

  // Draws a circle that moves round the rect
  pushMatrix();
    translate(width / 2, height / 2);
    rotate(radians(t));
    fill(255, 0, 0);
    ellipse(radius, 0, ellipseSize, ellipseSize);
  popMatrix();

  // Step is the velocity which the circle moves
  t += step;
}
