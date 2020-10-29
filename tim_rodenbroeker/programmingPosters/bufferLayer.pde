void drawBufferLayer () {
  buffer.beginDraw();
    buffer.background(#f1f1f1, 0);
    buffer.noStroke();
    
    PImage flPix = firstLayer.get();
    PImage slPix = secondLayer.get();
    
    float tilesX = 61.8;//cos(radians(frameCount)) * 100;//map(mouseX, 0, width, 2, 500);
    float tilesY = tilesX * 1.618;
    float tileW = firstLayer.width / tilesX;
    float tileH = firstLayer.height / tilesY;
    
    for (int x = 0; x < tilesX; x++) {
      for (int y = 0; y < tilesY; y++) {
        int _x = int(x * tileW);
        int _y = int(y * tileH);

        color c1 = flPix.get(_x, _y);
        color c2 = slPix.get(_x, _y);
    
        float colorWave = map(cos(radians(frameCount + x * 0.25 + y * 0.25)), -1, 1, 0, 1);
        color c3 = lerpColor(c1, c2, colorWave);
        float bri = brightness(c3);

        float sizeW = map(bri, 0, 255, 0, tileW);
        float sizeH = map(bri, 0, 255, 0, tileH);

        buffer.fill(bri / 2);
        buffer.rect(x * tileW, y * tileH, sizeW, sizeH);
      }
    }
  buffer.endDraw();
}
