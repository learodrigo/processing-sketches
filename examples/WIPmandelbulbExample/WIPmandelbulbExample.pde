ArrayList<PVector> points = new ArrayList();
float i;

void setup() {
  size(800, 800, P3D);
  colorMode(HSB);
  
  for (float i = -50; i <= 50; i += 0.01) {
    points.add(mandlebulb(i, i, i));
  } 
}

PVector mandlebulb(float x, float y, float z) {
  // Calculating spherical coordinates.
  // https://en.wikipedia.org/wiki/Mandelbulb
  
  float r = sqrt(pow(x, 2) + pow(y, 2) + pow(z, 2));
  float theta = atan(y / x);
  float phi = acos(z / r);
  
  PVector v = new PVector(r, theta, phi);
  
  return v;
}

void draw() {
  background(0);
  translate(width / 2, height / 2, - 850);

  float hu = 0;

  for (PVector v : points) {
    hu += 0.1;
    stroke(hu * (i * 0.1), 180, 170);
    strokeWeight(2);
    point(v.x * 10, v.y * 10, v.z * 10);

    if (hu > 255) {
      hu = 0;
    }
  }
}
