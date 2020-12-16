int stepSize, diam;
ArrayList<DumbAgent> das;

void setup () {
  size(900, 900);
  background(0, 40);

  das = new ArrayList<DumbAgent>();

  PVector pos = new PVector(width / 2, height / 2);
  stepSize = 3;
  diam = 5;

  for (int i = 0; i < 5; i++) {
    das.add(new DumbAgent(pos, (int) random(stepSize), (int) random(diam), random(50, 150)));
  }  
}

void draw () {
  for (DumbAgent da : das) {
    da.show();
  }
}
