class Spring extends VerletSpring3D {

  Spring (Particle a, Particle b) {
    super(a, b, w, 0.8);
  }

  void show () {
    stroke(255);
    strokeWeight(2);
    line(this.a.x, this.a.y, this.a.z, this.b.x, this.b.y, this.a.z);
  }
}
