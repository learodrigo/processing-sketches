// !wikipedia mandelbulb - https://en.wikipedia.org/wiki/Mandelbulb
// MandelBulb 1/2 Mandelbulb showcase - https://www.skytopia.com/project/fractal/mandelbulb.html
// MandelBulb 2/2 Mandelbulb exploration - https://www.skytopia.com/project/fractal/2mandelbulb.html

import peasy.*;

PeasyCam cam;

int N = 4;
int DIM = 256;
int MAX_ITERATIONS = 10;

ArrayList<PVector> mandelBulbPoints = new ArrayList<PVector>();

void createMandelBuldPoints() {
  for (int i = 0; i < DIM; i++) {
    for (int j = 0; j < DIM; j++) {

      boolean edge = false;

      for (int k = 0; k < DIM; k++) {
        float x = map(i, 0, DIM, -1, 1);
        float y = map(j, 0, DIM, -1, 1);
        float z = map(k, 0, DIM, -1, 1);

        int iterations = 0;

        PVector zeta = new PVector(0, 0, 0);

        while (true) {
          Spherical spherical = spherical(zeta.x, zeta.y, zeta.z);

          float powrn = pow(spherical.r, N);
          float thetaByN = spherical.theta * N;
          float phiByN = spherical.phi * N;

          float newX = powrn * sin(thetaByN) * cos(phiByN);
          float newY = powrn * sin(thetaByN) * sin(phiByN);
          float newZ = powrn * cos(thetaByN);

          zeta.x = newX + x;
          zeta.y = newY + y;
          zeta.z = newZ + z;

          iterations++;

          if (spherical.r > 2) {
            if (edge) {
              edge = false;
            }
            break;
          }

          if (iterations > MAX_ITERATIONS) {
            if (!edge) {
              edge = true;
              mandelBulbPoints.add(new PVector(x * 100, y * 100, z * 100));
            }
            break;
          }
        }
      }
    }
  }
}

Spherical spherical(float x, float y, float z) {
  float powX = x * x;
  float powY = y * y;
  float powZ = z * z;

  float r = sqrt(powX + powY + powZ);
  float theta = atan2(sqrt(powX + powY), z);
  float phi = atan2(y, x);

  return new Spherical(r, theta, phi);
}

void setup() {
  size(600, 600, P3D);
  cam = new PeasyCam(this, 500);
  createMandelBuldPoints();
}

void draw() {
  background(0);
  stroke(255);

  for (PVector mb : mandelBulbPoints) {
    point(mb.x, mb.y, mb.z);
  }
}
