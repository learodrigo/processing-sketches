void createDataSet(boolean create, int limit) {
  if (create) {
    background(255);

    float f = random(100, 200);

    strokeWeight(16);
    rectMode(CENTER);
    square(width / 2, height / 2, f);

    PImage img = get();

    img.resize(28, 28);
    img.save("data/square-" + nf(frameCount, 4) + ".png");

    if (frameCount == limit) {
      exit();
    }
  }
}
