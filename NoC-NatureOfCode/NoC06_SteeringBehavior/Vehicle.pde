class Vehicle {
  PVector pos;
  PVector acc;
  PVector vel;
  float r;
  float maxforce;
  float maxspeed;

  Vehicle (float x, float y) {
    this.pos = new PVector(x, y);
    this.vel = new PVector(0, -2);
    this.acc = new PVector(0, 0);
    this.r = rad;
    this.maxspeed = 8;
    this.maxforce = 0.1;
  }

  void applyForce (PVector force) {
    this.acc.add(force);
  }

  void arrive (PVector target) {
    PVector desired = PVector.sub(target, this.pos);
    float d = desired.mag();

    if (d < 100) {
      float m = map(d, this.r * 4, 100, 0, this.maxspeed);
      desired.setMag(m);
    } else {
      desired.setMag(this.maxspeed);
    }

    PVector steer = PVector.sub(desired, this.vel);
    steer.limit(this.maxforce);
    applyForce(steer);
  }

  void seek (PVector target) {
    PVector desired = PVector.sub(target, this.pos);
    desired.setMag(this.maxspeed);

    PVector steer = PVector.sub(desired, this.vel);
    steer.limit(this.maxforce);
    applyForce(steer);
  }

  void update () {
    this.vel.add(this.acc);
    this.vel.limit(this.maxspeed);
    this.pos.add(this.vel);
    this.acc.mult(0);
  }

  void show () {
    float theta = this.vel.heading() + PI/2;
    fill(0, 255, 0);
    noStroke();
    pushMatrix();
      translate(this.pos.x,this.pos.y);
      rotate(theta);
      beginShape();
        vertex(0, -this.r*2);
        vertex(-this.r, this.r*2);
        vertex(this.r, this.r*2);
      endShape(CLOSE);
    popMatrix();
  }
}
