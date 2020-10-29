class Spring extends VerletSpring2D {

  Spring (Particle a, Particle b) {
    super(a, b, w, 0.8);
  }

  void show () {
    stroke(255);
    strokeWeight(2);
    line(this.a.x, this.a.y, this.b.x, this.b.y);
  }
}
