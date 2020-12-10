int tileCount = 10;
boolean hideGrid = false;

void setup () {
  size(900, 900);
  smooth();

  frameRate(15);

  println("Click anywhere to start");
  println("Y mouse axis controls shape's ratio and stroke weight");
  println("X mouse axis controls shape's random position");
  println("Space bar or click to re draw");
  println("B to hide/show grid");
}

float shiftPos (int ratio) {
  return random(-mouseX, mouseX) / ratio;
}

void draw () {
  background(0);
  translate((width / tileCount) / 2, (height / tileCount) / 2);

  for (int y = 0; y < tileCount; y++) {
    for (int x = 0; x < tileCount; x++) {

      int posX = width / tileCount * x;
      int posY = height / tileCount * y;

      float shiftX = shiftPos((int) mouseX / tileCount);
      float shiftY = shiftPos((int) mouseX / tileCount * 2);

      strokeWeight((mouseY + 10) / 60);

      noFill();
      stroke(255, 50);
      circle(posX + shiftX, posY + shiftY, mouseY / 15);

      fill(255);
      noStroke();
      shiftX = shiftPos(20);
      shiftY = shiftPos(40);
      circle(posX + shiftX, posY + shiftY, mouseY / 15 / random(4, 8));

      if (hideGrid && y <= tileCount - 2 && x <= tileCount - 2) {
        noFill();
        stroke(255, 50);
        strokeWeight(0.5);
        rect(posX, posY, width/tileCount, width/tileCount);
      }
    }
  }

  noLoop();
}

void mouseReleased () {
  redraw();
}

void keyReleased () {
  if (key == ' ') {
    redraw();
  }
  else if (key == 'b' || key == 'B') {
    hideGrid = !hideGrid;
    redraw();
  }
}
