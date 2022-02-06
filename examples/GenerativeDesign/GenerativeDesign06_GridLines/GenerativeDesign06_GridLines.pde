int tileCount;
boolean toggleStrokeCap = true;

int actStrokeCap = ROUND;
int tileS = 45;

void setup () {
  size(600, 600, P2D);
  stroke(255, 100);
  
  tileCount = width / tileS;

  println("To start, pressed the mouse anywhere on the screen");
  println("Press 1 to round the edges");
  println("Press 2 to square the edges");
  println("Press 3 to project the edges");
  println("Press spacebar to random the edges");
  println("Any other key will re draw");
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
        line(tileX, tileY, tileX + width / tileCount, tileY  + height / tileCount);
      }
      else {
        strokeWeight(mouseY / (tileS / 2));
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
