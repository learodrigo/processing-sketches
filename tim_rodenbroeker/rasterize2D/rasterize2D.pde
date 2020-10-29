PImage img;

void setup () {
  size(900, 900);
  img = loadImage("venus.jpg");
  img.resize(900, 900);
  fill(0);
  noStroke();
}

void draw () {
  background(255);
  
  float tiles = mouseX / 4;
  float tileSize = width / tiles;

  for (int x = 0; x < tiles; x++) {
    for (int y = 0; y < tiles; y++) {
      color c = img.get(int(x * tileSize), int(y * tileSize));
      float size = map(brightness(c), 0, 255, tileSize, tileSize * 2);
      fill(c);
      //rect(x * tileSize, y * tileSize, size, size);
      ellipse(x * tileSize, y * tileSize, size, size);
    }
  }
  
}
