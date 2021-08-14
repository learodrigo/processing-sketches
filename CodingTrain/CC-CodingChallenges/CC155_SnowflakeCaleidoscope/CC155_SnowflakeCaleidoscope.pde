boolean withHue = false;

int symmetry = 6;
int angle = 360 / symmetry;

float xoff = 0;

void setup () {
  size(900, 900);
  background(0);

  if (withHue) colorMode(HSB, 255, 255, 255);
}

void draw () {
  translate(width / 2, height / 2);
  stroke(255, 50);

  float mx = mouseX - width / 2;
  float my = mouseY - height / 2;
  float pmx = pmouseX - width / 2;
  float pmy = pmouseY - height / 2;

  scale(0.75);
  rotate(PI * 0.33);

  if (mousePressed) {
    if (withHue) {
      float hu = noise(xoff) * 255;
      stroke(hu, 255, 255);
      xoff += 0.1;
    }

    for (int i = 0; i < symmetry; i++) {
        float d = dist(mx, my, pmx, pmy);
        float sw = map(d, 0, 5, 1, 5);

        rotate(PI * 0.33);

        strokeWeight(sw);
        line(mx, my, pmx, pmy);

        push();
          scale(-1, 1);
          line(mx, my, pmx, pmy);
        pop();
    }
  }
}

void keyPressed () {
  if (key == 's' || key == 'S') {
    saveFrame("snowflake.png");
  }
  else if (key == ' ') {
    background(0);
  }
}
