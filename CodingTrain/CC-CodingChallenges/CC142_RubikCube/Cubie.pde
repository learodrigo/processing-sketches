class Cubie {
  PMatrix matrix;
  boolean highlight = false;
  int x = 0, y = 0, z = 0;
  color c;
  Face[] faces = new Face[6];

  Cubie (PMatrix3D m, int x, int y, int z) {
    this.matrix = m;
    this.x = x;
    this.y = y;
    this.z = z;
    this.c = this.highlight ? color(255, 100, 200) : 255;

    faces[0] = new Face(new PVector(0, 0, -1), color(0, 0, 255));
    faces[1] = new Face(new PVector(0, 0, 1), color(0, 255, 0));
    faces[2] = new Face(new PVector(0, 1, 0), color(255, 255, 255));
    faces[3] = new Face(new PVector(0, -1, 0), color(255, 255, 0));
    faces[4] = new Face(new PVector(1, 0, 0), color(255, 150, 0));
    faces[5] = new Face(new PVector(-1, 0, 0), color(255, 0, 0));
  }

  void turnFacesX (int dir) {
    for (Face f : this.faces) {
      f.turnX(dir * HALF_PI);
    }
  }

  void turnFacesY (int dir) {
    for (Face f : this.faces) {
      f.turnY(dir * HALF_PI);
    }
  }

  void turnFacesZ (int dir) {
    for (Face f : this.faces) {
      f.turnZ(dir * HALF_PI);
    }
  }

  void update (int x, int y, int z) {
    this.matrix.reset();
    this.matrix.translate(x, y, z);
    this.x = x;
    this.y = y;
    this.z = z;
  }
  
  void show () {
    //fill(this.c);
    noFill();

    stroke(0);
    strokeWeight(0.1);

    push();
      applyMatrix(this.matrix);
      for (Face f : faces) {
        f.show();
      }
      box(1);
    pop();
  }
}
