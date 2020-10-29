PImage img;
float tiles, tileSize;

void setup () {
  size(900, 900, P3D);
  
  tiles = 90;
  tileSize = width / tiles;

  // Trick: use aspect ratio = 0
  img = loadImage("venus.png");
  img.resize(900, 900);

  noStroke();
  fill(0);
  sphereDetail(3);
}

void draw () {
  background(#ffffff);
  
  push();
    translate(width / 2, height / 2);
    rotateY(radians(frameCount));
    for (int x = 0; x < tiles; x++) {
      for (int y = 0; y < tiles; y++) {
        color c = img.get(int(x * tileSize), int(y * tileSize));
        float b = map(brightness(c), 0, 255, 1, 0);
        
        float z = map(b, 0, 1, -100, 100);
        
        push();
          translate(x * tileSize - width / 2, y * tileSize - height / 2, z);
          sphere(tileSize * b * 0.8);
        pop();
  
      }
    }
  pop();
}
