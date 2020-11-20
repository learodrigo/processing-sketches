class Face {
  PVector normal;
  color c;

  Face (PVector normal, color c) {
    this.normal = normal;
    this.c = c;
  }

  void turnX (float angle) {
    PVector v2 = new PVector();
    v2.x = round(this.normal.x);
    v2.y = round(this.normal.y * cos(angle) - this.normal.z * sin(angle));
    v2.z = round(this.normal.y * sin(angle) + this.normal.z * cos(angle));
    this.normal = v2;
  }

  void turnY (float angle) {
    PVector v2 = new PVector();
    v2.x = round(this.normal.x * cos(angle) - this.normal.z * sin(angle));
    v2.y = round(this.normal.y);
    v2.z = round(this.normal.x * sin(angle) + this.normal.z * cos(angle));
    this.normal = v2;
  }

  void turnZ (float angle) {
    PVector v2 = new PVector();
    v2.x = round(this.normal.x * cos(angle) - this.normal.y * sin(angle));
    v2.y = round(this.normal.x * sin(angle) + this.normal.y * cos(angle));
    v2.z = round(this.normal.z);
    this.normal = v2;
  }

  void show () {
    push();
      fill(this.c);
      noStroke();
      rectMode(CENTER);
      translate(this.normal.x * 0.5, this.normal.y * 0.5, this.normal.z * 0.5);

      if (abs(this.normal.x) > 0) {
        rotateY(HALF_PI);
      } else if (abs(this.normal.y) > 0) {
        rotateX(HALF_PI);
      }
      square(0, 0, 1);
    pop();
  }
}
