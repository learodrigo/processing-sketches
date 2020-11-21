int cols, rows;

float inc = 0.1;
float zoff = 0.0;

int scl = 20;

boolean debug = false;

ArrayList<Particle> particles = new ArrayList<Particle>();
PVector[][] flowFields;

void setup() {
  size(900, 900);
  background(0);

  cols = floor(width / scl);
  rows = floor(height / scl);

  for (int i = 0; i < 100000; i++) {
    particles.add(new Particle());
  }
  
  flowFields = new PVector[cols][rows];
}

void draw() {
  background(0, 5);

  float yoff = 0;
  for(int y = 0; y < rows; y++) {
    float xoff = 0;

    for(int x = 0; x < cols; x++) {
      int index = x + y * cols;
      float angle = noise(xoff, yoff, zoff) * TWO_PI * 4;
      PVector v = PVector.fromAngle(angle);

      v.setMag(1);
      flowFields[y][x] = v;

      xoff += inc;

      if (debug) {
         stroke(0, 100);
         strokeWeight(1);
         push();
           translate(x * scl, y * scl);
           rotate(v.heading());
           line(0, 0, scl, 0);
         pop();
      }
    }

    yoff += inc;
    zoff += 0.00003;
  }

  for (Particle p : particles) {
    p.follow(flowFields);
    p.update();
    p.edges();
    p.show();
  }
}
