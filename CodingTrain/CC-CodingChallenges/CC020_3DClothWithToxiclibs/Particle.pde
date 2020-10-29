class Particle extends VerletParticle3D {

  Particle (float x, float y, float z) {
    super(x, y, z);
  }

  void show () {
    pushMatrix();
    fill(255);
    noStroke();
    translate(x, y, z);
    ellipse(this.x, this.y, 10, 10);
    popMatrix();
  }
}
