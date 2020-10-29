void setup () {
  size(700, 700);
  background(180);
  smooth();
  stroke(255);
  strokeWeight(4);
  strokeCap(SQUARE);

  for (int h = 10; h < height - 15; h += 10) {
    stroke(0, 255 - h / 3);
    line(10, h, width - 20, h);
    stroke(255, h / 3);
    line(10, h + 4, width - 20, h + 4);
  }

  saveFrame("screen-####.jpg");
}