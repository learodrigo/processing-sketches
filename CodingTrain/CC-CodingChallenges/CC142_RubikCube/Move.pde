class Move {
  float angle = 0;
  int x = 0, y = 0, z = 0;
  int dir;
  boolean animating = false;
  boolean finished = false;

  Move (int x, int y, int z, int dir) {
    this.x = x;
    this.y = y;
    this.z = z;
    this.dir = dir;
  }

  Move copy () {
    return new Move(this.x, this.y, this.z, this.dir);
  }

  boolean finished () {
    return finished;
  }

  void start () {
    animating = true;
    finished = false;
    this.angle = 0;
  }

  void reverse () {
    this.dir *= -1;
  }

  void update () {
    if (this.animating) {
      this.angle += this.dir * speed;

      if (abs(this.angle) > HALF_PI) {
        this.angle = 0;
        this.animating = false;
        finished = true;

        if (abs(x) > 0) {
          turnX(this.x, this.dir);
        }
        else if (abs(y) > 0) {
          turnY(this.y, this.dir);
        }
        else if (abs(z) > 0) {
          turnZ(this.z, this.dir);
        }
      }
    }
  }
}
