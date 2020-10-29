void setup () {
  size(800, 800);
  background(0);
}

void drawCircle (float x, float y, float r) {
  if (r > 1) {
    stroke(255);
    noFill();
    ellipse(x, y, r, r);
    drawCircle(x - r, y - r, r / 2);
    drawCircle(x - r, y + r, r / 2);
    //drawCircle(x + r, y + r, r / 2);
    drawCircle(x + r, y - r, r / 2);
    
  }
}

void draw () {
  drawCircle(width / 2, height / 2, width);
}
