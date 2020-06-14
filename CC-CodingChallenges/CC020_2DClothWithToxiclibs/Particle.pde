class Particle extends VerletParticle2D {

  Particle (float x, float y) {
    super(x, y);
  }

  void show () {
    fill(255);
    noStroke();
    ellipse(this.x, this.y, 10, 10);
  }
}
