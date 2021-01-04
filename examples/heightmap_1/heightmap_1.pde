int cols, rows, scl = 2;
float[][] grid, terrain;
float offset = 0.1;
PImage heightmap;

void setup () {
  size(1200, 1200, P3D);
  smooth(8);
  fill(255);
  noStroke();

  rows = width / scl;
  cols = height / scl;

  grid = createsGrid(rows, cols);
  terrain = createsGrid(rows, cols);
  
  pickRandomHeightmap(false);
}

void draw () {
  background(0);
  lights();

  rotateX(PI / 8);
  translate(0, -100);
  
  for (int y = 0; y < cols; y++) {
    for (int x = 0; x < rows; x++) {
      int index = x * scl + y * scl * heightmap.width;
      color pix = heightmap.pixels[index];
      float oldG = red(pix);
      terrain[x][y] = map(oldG, 0, 255, -50, 100);
    }
  }

  for (int y = 0; y < cols - 1; y++) {
    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x < rows; x++) {
      float asd = map(terrain[x][y], -50, 100, 0, 250);
      fill(asd);
      vertex(x * scl, (y + 0) * scl, terrain[x][y]);
      vertex(x * scl, (y + 1) * scl, terrain[x][y+1]);
    }
    endShape();
  }
  
  if (frameCount % 100 == 0) {
    pickRandomHeightmap(true);
  }
}

void pickRandomHeightmap (boolean show) {
  heightmap = loadImage("frames/heightmap-" + floor(random(1, 4)) + ".jpg");
  heightmap.resize(width, height);
  heightmap.filter(GRAY);

  if (show) {
    redraw();
  }
}

float[][] createsGrid (int rows, int cols) {
  float[][] grid = new float[rows][cols];
  float yOff = 0;
  
  for (int y = 0; y < cols; y++) {
    float xOff = 0;

    for (int x = 0; x < rows; x++) {
      grid[x][y] = map(noise(xOff, yOff), 0, 1, 0, 255);
      xOff += offset;
    }
    
    yOff += offset;
  }
  
  return grid;
}

void keyPressed () {
  if (key == ' ') {
    pickRandomHeightmap(true);
  }
  if (key == 's') {
    saveFrame("heightmap-" + frameCount + ".png");
  }
}
