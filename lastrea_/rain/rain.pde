int n;
float w, space;
color c1, c2;
boolean isNegative = false;

void keyPressed() {
  if (key == 's')  {
    save("rain-output.jpg");
  }
  if (key == 'r')  {
    redraw();
  }
  if (key == 'i')  {
    isNegative = !isNegative;
  }
}

void setup () {
  size(1000, 1000);
  noLoop();
  noStroke();

  c1 = color(#C950AD);
  c2 = color(#1162F2);

  space = 1.5;
  n = 80;
  w = width / n;
}

void draw () {
  background(0);
  translate((-w / space), (-w / space));

  for (int j = 0; j < height; j += w) {
    for (int i = 0; i < width; i += w) {
      float r = random(map(j, 0, height, 0, 1), 1) * (isNegative ? -1 : 1);

      if (random(1) > 0.5) {
        float red = red(c1) * r;
        float green = green(c1) * r;
        float blue = blue(c1) * r;

        fill(red(c1) - red, green(c1) - green, blue(c1) - blue);
      }
      else {
        float red = red(c2) * r;
        float green = green(c2) * r;
        float blue = blue(c2) * r;

        fill(red(c2) - red, green(c2) - green, blue(c2) - blue);
      }

      rect(i + w / space, j + w / space, w / space, w / space);
    }
  }
}
