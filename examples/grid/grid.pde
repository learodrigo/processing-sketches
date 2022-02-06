int numTiles = 5;
ArrayList<Star> stars;
boolean cleanUp = false;

void setup () {
  size(1200, 1200);

  background(0);
  noFill();
  frameRate(15);
  
  stars = new ArrayList<Star>();

  float tileSize = width / numTiles;
  float length = sqrt((tileSize * tileSize) + (tileSize * tileSize));

  for (int x = 0; x < numTiles; x++) {
    for (int y = 0; y < numTiles; y++) {
      stars.add(new Star(tileSize * x, tileSize * y, length * 0.4));
    }
  }
}

boolean reprint = false;

void draw() {
  //new Star(mouseX, mouseY, 120).draw();
  
  if (cleanUp && frameCount % 5 == 0) background(0);

   for (Star star : stars) {
     star.draw();
   }
}

void keyPressed() {
  if (key == 'b') background(0);
  if (key == 'c') cleanUp = !cleanUp;
  if (key == 'r') redraw();
}
