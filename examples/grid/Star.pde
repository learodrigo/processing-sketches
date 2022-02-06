class Star {
  float x;
  float y;
  float radius;
 
  Star (float x, float y, float radius) {
    this.x = x;
    this.y = y;
    this.radius = radius;
  }

  void draw() {
    float margin = width / numTiles / 2;

    pushMatrix();
    translate(this.x + margin + random(5), this.y + margin +  random(5));

    for (int i = 0; i < this.radius; i++){
      pushMatrix();
        rotate(radians(i * random(70)));
        stroke(255);

        if (random(1) < 0.3) {
          strokeWeight(3);
        } else if (random(1) < 0.6) {
          strokeWeight(random(0.3, 1.1));
        } else if (random(1) > 0.6) {
          strokeWeight(2);
        }

        line(0, 0, i / 2, i / 2);
      popMatrix();
    }
    popMatrix();
  }
}
