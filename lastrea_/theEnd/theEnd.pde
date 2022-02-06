int n = 250;
float noiseMax = 0;
color bgColor = #0073B1;
color fgColor = #ffffff;

void keyReleased () {
  if (key == 'r') {
    redraw();
  }

  if (key == 's') {
    String msg = "images/theEnd_########.png";
    saveFrame(msg);
    println("Saved: " + msg);
  }
}

void setup () {
  size(600, 800);

  background(bgColor);
  stroke(fgColor);
  fill(fgColor);
}

void draw() {
  background(bgColor);

  pushMatrix();
    translate(width / 2, height / 3.1);
    scale(0.5);
    drawCloth();
  popMatrix();


 pushMatrix();
    translate(width / 2, height / 3.1);
    scale(0.2);
    drawCloth();
  popMatrix();

  noLoop();
}

void drawCloth() {
  for (int i = 0; i < n; i++) {
    for (float angle = 0; angle < TWO_PI; angle += 0.02) {
      float xoff = map(cos(angle), -1, 1, 0, noiseMax);
      float yoff = map(sin(angle), -1, 1, 0, noiseMax);

      float r = map(noise(xoff + frameCount, yoff + frameCount), 0, 1, width / 4, width);

      float x = r * cos(angle);
      float y = r * sin(angle) + i * 2.5;

      point(x, y);
    }

    noiseMax += 0.03;
  }
}
