import peasy.*;
PeasyCam cam;

// Simulation box
int sSize = 120;
// Internal boxes size
int dim = 5;
// Raised size
int AS = sSize / dim;
// CA data
boolean [][][] CA;
// Keep track of z for layering
int z = 0;

// Resolution sSize = 120 and dim = 5, res = 12 is max
int res = 12;

// Recording purpose
boolean record = false;
boolean run = false;

void setup () {
  size(1000, 1000, P3D);

  cam = new PeasyCam(this, 100);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(500);
  cam.setSuppressRollRotationMode();

  // Initialization
  reset();
}

void reset () {
  CA = new boolean[AS][AS][AS];
  for (int i = AS / 2 - res; i < AS / 2 + res; i++) {
    for (int j = AS / 2 - res; j < AS / 2 + res; j++) {
      CA[i][j][0] = (random(1) < 0.5);
    }
  }
}

void draw () {
  background(51);

  lights();
  directionalLight(255, 0, 0, 1, 1, -1);
  directionalLight(0, 200, 50, -1, 1, -1);
  directionalLight(50, 50, 255, -1, -1, -1);
  ambientLight(200, 200, 255);
  pointLight(51, 102, 126, 35, 40, 500);

  if (run) {
    if (frameCount % 24 == 0) {
      z++;
      update();
    }
  }

  for (int i = 0; i < AS; i++) {
    for (int j = 0; j < AS; j++) {
      for (int k = 0; k < AS; k++) {
        if (CA[i][j][k]) {
          showBox(i, j, k);
        }
      }
    }
  }

  showSimulationBox();

  if (record) {
    saveFrame("3DCellulatAutomata-####.png");
  }
}

void update () {
  if (z >= AS) {
    return;
  }

  for (int i = 0; i < AS; i++) {
    for (int j = 0; j < AS; j++) {
      int c = getNeighborCount(i, j, z - 1);

      // If it's alived
      if (CA[i][j][z - 1]) {
        CA[i][j][z] = (c == 2 || c == 3);
        //if (c < 2 || c == 4) {
        //  CA[i][j][z] = false;
        //} else if (c == 2 || c == 3) {
        //  CA[i][j][z] = true;
        //} else {
        //  CA[i][j][z] = false;
        //}
      } else {
        CA[i][j][z] = (c == 3);
      }
    }
  }
}

// MOORE neighborhood checks 8 boxes
int getNeighborCount (int i, int j, int k) {
  int count = 0;
  // Left
  if (CA[(i - 1 + AS) % AS][j][k]) count++;
  // Left top
  if (CA[(i - 1 + AS) % AS][(j + 1) % AS][k]) count++;
  // Left bottom
  if (CA[(i - 1 + AS) % AS][(j - 1 + AS) % AS][k]) count++;
  // Top
  if (CA[(i) % AS][(j + 1) % AS][k]) count++;
  // Bottom
  if (CA[i][(j - 1 + AS) % AS][k]) count++;
  // Right
  if (CA[(i + 1) % AS][j][k]) count++;
  // Right top
  if (CA[(i + 1) % AS][(j + 1) % AS][k]) count++;
  // Right bottom
  if (CA[(i + 1) % AS][(j - 1 + AS) % AS][k]) count++;

  return count;
}

void showSimulationBox () {
  pushMatrix();
  translate(sSize * 0.5, sSize * 0.5, sSize * 0.5);
  scale(sSize, sSize, sSize);
  stroke(0);
  strokeWeight(0.9 / sSize);
  noFill();
  box(1, 1, 1);
  popMatrix();
}

void showBox (int x, int y, int z) {
  pushMatrix();
  translate(x * dim + dim * 0.5, y * dim + dim * 0.5, z * dim + dim * 0.5);
  scale(dim, dim, dim);
  fill(100);
  stroke(0);
  strokeWeight(1.0/dim);
  box(1, 1, 1);
  popMatrix();
}

void keyPressed () {
  switch (key) {
  case ' ':  
    z++;
    update();
    break;
  case 'x':  
    z = 0;
    reset();
    break;
  case 's':  
    if (record) {
      record = false;
      println("Stop recording");
    } else {
      record = true;
      println("Recording images");
    }
    break;
  case 'r':  
    if (run) {
      run = false;
      println("Stop running");
    } else {
      run = true;
      println("Running automatically");
    }
    break;
  }
}
