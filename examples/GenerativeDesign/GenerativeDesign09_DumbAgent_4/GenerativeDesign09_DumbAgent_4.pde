int stepSize, diam;
ArrayList<DumbAgent> das;

void setup () {
  size(900, 900);
  background(0, 40);

  das = new ArrayList<DumbAgent>();

  PVector pos = new PVector(random(width), random(height));
  stepSize = (int) random(1, 5);
  diam = (int) random(2, 8);
  float op = random(20, 100);

  for (int i = 0; i < 1; i++) {
    das.add(new DumbAgent(pos, stepSize, diam, op));
  }
}

void draw () {
  for (DumbAgent da : das) {
    da.show();
  }
}

void keyReleased () {
  if (key == ' ') {
    background(0);
  }
}
