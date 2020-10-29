// https://timrodenbroeker.de/processing-tutorial-kinetic-typography-1/

PGraphics pg;
PFont font;

void setup () {
  font = createFont("RobotoMono-Regular.ttf", 600);
  size(900, 900, P2D);
  pg = createGraphics(900, 900, P2D);
}

void setPGTypo (PGraphics pg, char c) {
  pg.beginDraw();
    pg.background(0);
    pg.fill(255);
    pg.textFont(font);
    pg.textSize(800);

    pg.pushMatrix();
      pg.translate(width / 2, height / 2 - 215);
      pg.textAlign(CENTER, CENTER);
      pg.text(c, 0, 0);
    pg.popMatrix();
  pg.endDraw();
}

void copyFromTo (PGraphics pg, int tilesX, int tilesY) {
  int tileW = int(width / tilesX);
  int tileH = int(height / tilesY);
  
  for (int y = 0; y < tilesY; y++) {
    for (int x = 0; x < tilesX; x++) {
      // glitchy
      //int wave = int(sin(frameCount * (x * y)) * 10);
      // wave 1
      //int wave = int(sin(frameCount * 0.005 * (x * y)) * 100);
      // wave 2
      int wave = int(sin(frameCount * 0.1 + (x * y)) * 30);

      // Source point
      int sx = x * tileW + wave;
      int sy = y * tileH;
      int sw = tileW;
      int sh = tileH;
      
      // Destination point
      int dx = x * tileW;
      int dy = y * tileH;
      int dw = tileW;
      int dh = tileH;
      
      copy(pg, sx, sy, sw, sh, dx, dy, dw, dh);
    }
  }
}

void draw () {
  background(0);
  setPGTypo(pg, 'x');
  copyFromTo(pg, 8, 8);
}
