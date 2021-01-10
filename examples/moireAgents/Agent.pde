class Agent {
  boolean fixed, random;
  float x, y, radius, sw;
  
  Agent (boolean fixed, float x, float y, float sw) {
    this.x = x;
    this.y = y;
    this.sw = sw;
    this.fixed = fixed;
    this.radius = 2;
    this.random = random(1) > 0.5;
  }

  void edges () {
    if (this.x < 0) this.x = width;
    if (this.y < 0) this.y = height;
    if (this.x > width) this.x = 0;
    if (this.y > height) this.y = 0;
  }

  void update () {
    this.x += this.random ? sin(width) * frameCount : cos(width) * -frameCount;
    this.y += !this.random ? sin(width) * frameCount : 0;
  }

  void show () {
    noFill();
    stroke(255);
    strokeWeight(this.sw);

    for (int i = 1; i < width * 2; i += 10) {
      circle(this.x, this.y, i * this.radius);
    }
  }

  void run () {
    this.edges();
    if (!this.fixed) this.update();
    this.show();
  }
}
