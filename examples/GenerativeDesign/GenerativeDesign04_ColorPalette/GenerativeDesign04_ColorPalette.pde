int tileCountX = 50;
int tileCountY = 50;

// arrays for color components values
int[] hueValues = new int[tileCountX];
int[] satValues = new int[tileCountX];
int[] briValues = new int[tileCountX];


void setup() { 
  size(900, 900);
  colorMode(HSB, 360, 100, 100);
  noStroke();

  frameRate(10);

  for (int i = 0; i < tileCountX; i++) {
    hueValues[i] = (int) random(0, 360);
    satValues[i] = (int) random(0, 100);
    briValues[i] = (int) random(0, 100);
  }
}

void draw() { 
  background(51);
  strokeWeight(5);
  stroke(51);

  // count every tile
  int counter = 0;

  // map mouse to grid resolution
  int currentTileCountX = (int) random(2, tileCountX);
  int currentTileCountY = (int) random(2, tileCountY);

  float tileWidth = width / (int) random(2, currentTileCountX);
  float tileHeight = height / (int) random(2, currentTileCountY);

  for (int gridY = 0; gridY < tileCountY; gridY++) {
    for (int gridX = 0; gridX < tileCountX; gridX++) {  
      float posX = tileWidth * gridX;
      float posY = tileHeight * gridY;
      int index = counter % currentTileCountY;

      // get component color values
      fill(hueValues[index], satValues[index], briValues[index]);
      rect(posX, posY, tileWidth, tileHeight);
      counter++;
    }
  }

  noLoop();
}
