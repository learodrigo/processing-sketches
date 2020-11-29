int f = 0, b = 600;

void setup () {
  size(900, 900);
  fill(0);
  stroke(255);
  strokeWeight(2);
}
  
void draw () {
  f++;
  background(0);

  for (int y = 100; y < b + 200; y += 15) {
    beginShape();

    for (int x = 0; x < width / 3; x++) {
      vertex(x + width / 3, y - 80 / (1 + pow(x - b / 4, 4) / 8e6) * noise(x / 10 + f * 0.6  + y));
    }

    endShape();
  }
}
