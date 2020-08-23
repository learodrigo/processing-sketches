/** //<>//
 * https://en.wikipedia.org/wiki/Worley_noise
 * http://www.rhythmiccanvas.com/research/papers/worley.pdf
 *
 * TODO: Add QuadTree
 */
 
PVector[] features;
float angle = 0;

void setup() {
  size(800, 800);

  features = new PVector[50];

  for (int i = 0; i < features.length; i++) {
    features[i] = new PVector(
      random(width), 
      random(height), 
      random(-width/2, width/2)
      );
  }
}

void draw() {
  background(0);

  int skip = 25;
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      for (int z = 0; z < -width/2; z+=skip) {
        float[] distances = new float[features.length];

        for (int i = 0; i < distances.length; i++) {
          // 3D Features points
          float depth = sin(angle) * (width / 2);
          distances[i] = dist(x, y, depth, v.x, v.y, v.z);
        }

        distances = sort(distances);
        int n = 0;
        // Grayscale
        float d = distances[n];
        float b = map(d, 0, width / 4, 255, 0);

        // Color
        //float d0 = distances[0];
        //float d1 = distances[1];
        //float d2 = distances[2];
        //float r = map(d1, 0, width / 4, 255, 20) * 2;
        //float g = map(d2, 0, width / 4, 255, 20) * 2;
        //float b = map(d0, 0, width / 4, 255, 20) * 2;
        //pixels[index] = color(r, g, b);

        pushMatrix();
        translate(x, y, z);
        noStroke();
        fill(255, b);
        box(skip);
        popMatrix();
      }
    }
  }

  for (PVector v : features) {
    v.x += random(-5, 5);
    v.y += random(-5, 5);
    v.z += random(-5, 5);
  }

  angle += 0.1;
  //saveFrame("worley/worley####.png");

  //noLoop();
}
