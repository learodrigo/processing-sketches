class Particle {
  PVector pos, vel, acc, prevPos;
  int maxSpeed;

  Particle () {
    this.pos = new PVector(random(width), random(height));
    this.vel = new PVector(0, 0);
    this.acc = new PVector(0, 0);
    this.maxSpeed = 2;
    this.prevPos = this.pos.copy();
  }

  void update () {
    this.vel.add(this.acc);
    this.vel.limit(this.maxSpeed);
    this.pos.add(this.vel);
    this.acc.mult(0);
  }

  void updatePrev () {
    this.prevPos.x = this.pos.x;
    this.prevPos.y = this.pos.y;
  }

  void edges () {
    if (this.pos.x > width) this.pos.x = 0;
    if (this.pos.x < 0) this.pos.x = width;
    if (this.pos.y > height) this.pos.y = 0;
    if (this.pos.y < 0) this.pos.y = height;
    this.updatePrev();
  }

  void applyForce (PVector force) {
    this.acc.add(force);
  }

  PVector lookup(PVector pos, PVector[][] vectors) {
    int column = int(constrain(pos.x / scl, 0, cols-1));
    int row = int(constrain(pos.y / scl, 0, rows-1));
    return vectors[column][row].copy();
  }

  void follow (PVector[][] flowField) {
    int x = int(constrain(this.pos.x / scl, 0, cols - 1));
    int y = int(constrain(this.pos.y / scl, 0, rows - 1));
    PVector force = flowField[x][y].copy();
    this.applyForce(force);
  }

  void show () {
    stroke(255);
    strokeWeight(1);
    line(this.pos.x, this.pos.y, this.prevPos.x, this.prevPos.y);
    this.updatePrev();
  }
}
