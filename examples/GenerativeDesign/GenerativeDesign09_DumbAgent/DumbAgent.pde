class DumbAgent {
  PVector pos;
  int dir, stepSize, diam;
  float op;
  color col;

  DumbAgent (PVector pos, int stepSize, int diam, float op) {
    this.pos = new PVector(pos.x, pos.y);
    this.dir = 0;
    this.stepSize = stepSize;
    this.diam = diam;
    this.op = op;
  }

  void agentMove (int dir) {
    switch (dir) {
        case 0:
          this.pos.y -= this.stepSize;
          break;
        case 1:
          this.pos.x += this.stepSize;
          this.pos.y -= this.stepSize;
          break;
        case 2:
          this.pos.x += this.stepSize;
          break;
        case 3:
          this.pos.x += this.stepSize;
          this.pos.y += this.stepSize;
          break;
        case 4:
          this.pos.y += this.stepSize;
          break;
        case 5:
          this.pos.x -= this.stepSize;
          this.pos.y += this.stepSize;
          break;
        case 6:
          this.pos.x -= this.stepSize;
          break;
        default:
          this.pos.x -= this.stepSize;
          this.pos.y -= this.stepSize;
          break;
      }
  }

  void edges () {
    if (this.pos.x > width) this.pos.x = 0;
    if (this.pos.x < 0) this.pos.x = width;
    if (this.pos.y > height) this.pos.y = 0;
    if (this.pos.y < 0) this.pos.y = height;
  }

  void show () {
    for (int i = 0; i <= width; i++) {
      this.dir = (int) random(8);
      this.agentMove(dir);
      this.edges();

      noStroke();
      fill(255, this.op / 2);
      circle(this.pos.x + this.stepSize / 2, this.pos.y + this.stepSize / 2, this.diam);
    }
  }
}
