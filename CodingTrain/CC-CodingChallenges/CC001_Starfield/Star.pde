class Star {
  float x, y, z, pz, speed;

  Star() {
    this.x = random(-width, width);
    this.y = random(-height, height);
    this.z = random(width * 2);
    this.pz = z;
  }

  void update () {
    speed = mousePressed ? tan(frameCount) * mouseX : tan(frameCount);
    //speed = map(mouseX, 0, width, 0, 20);

    this.z -= speed;
    
    println(frameCount);

    if (this.z < 1) {
      this.x = random(-width, width);
      this.y = random(-height, height);
      this.z = random(width * 2);
      this.pz = this.z;
    }
  }

  void show () {
    stroke(255);
    strokeWeight(random(3));

    float sx = map(this.x / this.z, 0, 1, 0, width);
    float sy = map(this.y / this.z, 0, 1, 0, height);

    float r = random(map(this.z, 0, width, 16, 1));

    float px = map(this.x / this.pz, 0, 1, 0, width);
    float py = map(this.y / this.pz, 0, 1, 0, height);

    this.pz = this.z;

    ellipse(sx, sy, r, r);
    line(px, py, sx, sy);
  }
  
  void run () {
    update();
    show();
  }
}
