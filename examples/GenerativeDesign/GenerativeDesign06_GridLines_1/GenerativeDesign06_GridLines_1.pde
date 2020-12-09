int tileCount;
boolean toggleStrokeCap = true;

int actStrokeCap = ROUND;
int tileS = 45;

void setup () {
  size(900, 900, P2D);
  
  tileCount = width / tileS;

  println("To start, pressed the mouse anywhere on the screen");
  println("Press 1 to round 2 to square, 3 to project, spacebar to random the edges. Any other key will re draw");
  println("Stroke weights vary depending on mouse position");
}

void draw () {
  background(0);
  strokeCap(actStrokeCap);

  for (int y = 0; y < tileCount; y++) {
    for (int x = 0; x < tileCount; x++) {
      int tileX = width / tileCount * x;
      int tileY = height / tileCount * y;

      if (toggleStrokeCap) {
        if (toggle(0.6)) {
          strokeCap(ROUND);
        } else {
          strokeCap(PROJECT);
        }
      }

      if (toggle(0.3)) {
        strokeWeight(mouseX / tileS);
        stroke(30, 0, 255, 150);
        line(tileX, tileY, tileX + width / tileCount, tileY  + height / tileCount);
      }
      else {
        strokeWeight(mouseY / (tileS / 2));
        stroke(255, 50, 20, 100);
        line(tileX + width / tileCount, tileY, tileX, tileY  + height / tileCount);
      }
    }
  }

  noLoop();
}

boolean toggle (float probability) {
  return random(1) < probability;
}

void keyReleased () {
  if (key == '1') {
    actStrokeCap = ROUND;
    toggleStrokeCap = false;
  }
  else if (key == '2') {
    actStrokeCap = SQUARE;
    toggleStrokeCap = false;
  }
  else if (key == '3') {
    actStrokeCap = PROJECT;
    toggleStrokeCap = false;
  }
  else if (key == ' ') {
    toggleStrokeCap = true;
  }
  

  redraw();
}

void mouseReleased () {
  redraw();
}
