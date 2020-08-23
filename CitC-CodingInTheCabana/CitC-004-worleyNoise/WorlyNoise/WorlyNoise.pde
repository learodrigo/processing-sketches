/**
 * https://en.wikipedia.org/wiki/Worley_noise
 * http://www.rhythmiccanvas.com/research/papers/worley.pdf
 *
 * TODO: Add QuadTree
 */

PVector[] features;
float angle = 0;

void setup() {
  size(800, 800);
  //fullScreen();

  features = new PVector[100];

  for (int i = 0; i < features.length; i++) {
    features[i] = new PVector(
      random(width), 
      random(height), 
      random(-width, width)
    );
  }
}

void draw() {
  background(0);

  loadPixels();
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      int index = x + y * width;
      float[] distances = new float[features.length];

      for (int i = 0; i < features.length; i++) {
        PVector v = features[i];
        // 2D Features points
        distances[i] = dist(x, y, v.x, v.y);
      }

      distances = sort(distances);
      //int n = 0;
      //// Grayscale
      //float d = distances[n];
      //float b = map(d, 0, width / 8, 255, 0);
      //pixels[index] = color(b);

      // Color
      float d0 = distances[0];
      float d1 = distances[1];
      float d2 = distances[2];
      float r = map(d1, 0, width / 8, 255, 0);
      float g = map(d2, 0, width / 8, 255, 0);
      float b = map(d0, 0, width / 8, 255, 0);
      pixels[index] = color(r, g, b);
    }
  }
  updatePixels();

  for (PVector v : features) {
    v.x += random(-5, 5);
    v.y += random(-5, 5);
    v.z += random(-5, 5);
  }
 
  noLoop();

  angle += 0.1;
  //saveFrame("worley/worley.png");
}
