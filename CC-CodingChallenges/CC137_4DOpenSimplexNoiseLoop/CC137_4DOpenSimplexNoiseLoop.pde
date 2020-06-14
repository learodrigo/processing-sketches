/**
 * 4D OpenSimplex noise loop based on Noise3D example. 
 */

int totalFrames = 120;
int counter = 0;
boolean record = false;

float increment = 0.03;

// Just for non-looping demo
float zoff = 0;

OpenSimplexNoise noise;
void setup() {
  size(800, 800);
  noise = new OpenSimplexNoise();
}

void draw() {
  float percent = 0;
  if (record) {
    percent = float(counter) / totalFrames;
  } else {
    percent = float(counter % totalFrames) / totalFrames;
  }
  render(percent);
  if (record) {
    saveFrame("output/gif-" + nf(counter, 3) + ".png");
    if (counter == totalFrames - 1) {
      exit();
    }
  }
  counter++;
}

void render(float percent) {
  float angle = map(percent, 0, 1, 0, TWO_PI);
  float uoff = map(sin(angle), -1, 1, 0, 2);
  float voff = map(sin(angle), -1, 1, 0, 2);

  float xoff = 0;
  loadPixels();
  for (int x = 0; x < width; x++) {
    float yoff = 0;

    for (int y = 0; y < height; y++) {
      float n;

      // 4D Open Simplex Noise is very slow!
      if (record) {
        n = (float) noise.eval(xoff, yoff, uoff, voff);
      } else {
        n = (float) noise.eval(xoff, yoff, zoff);
      }

      float bright = n > 0 ? 255 : 0;
      pixels[x + y * width] = color(bright);
      yoff += increment;
    }
    xoff += increment;
  }
  updatePixels();

  zoff += increment;
}
