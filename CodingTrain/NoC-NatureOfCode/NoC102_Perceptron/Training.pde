float f (float x) {
  // y = mx + b
  return 0.89 * x - 0.2;
}

class Point {
  float x;
  float y;
  int label;
  float bias = 1;

  Point (float x_, float y_) {
    this.x = x_;
    this.y = y_;
  }

  Point () {
    this.x = random(-1, 1);
    this.y = random(-1, 1);

    float lineY = f(this.x);
    this.label = (y > lineY) ? 1 : -1;
  }

  float pixX () {
    return map(this.x, -1, 1, 0, width);
  }

  float pixY () {
    return map(this.y, -1, 1, height, 0);
  }

  void show () {
    float px = this.pixX();
    float py = this.pixY();

    stroke(255);
    strokeWeight(2);
    fill(this.label == 1 ? 255 : 0);
    ellipse(px, py, 16, 16);
  }
}
