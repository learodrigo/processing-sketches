float
angle,
posX,
posY,
posXcross,
posYcross;

int
NORTH = 0,
EAST = 1,
SOUTH = 2,
WEST = 3,
angleCount = 50,
lineWeight = 50,
direction = SOUTH,
margin = 100,
minLength = 5,
stepSize = 3;

boolean
showLines = false;

void setup () {
  size(1200, 1200);
  background(0);
  smooth();

  angle = getRandomAngle(direction);

  posX = random(width);
  posY = random(height);
  posXcross = random(posX);
  posYcross = random(posY);

  println("Press space bar to reset");
  println("Click to toggle lines drawing");
}

void draw () {
  for (int i = 0; i <= 20; i++) {
    stroke(255);
    strokeWeight(0.1);
    point(posX, posY);

    posX += cos(radians(angle)) * stepSize * (random(1) > 0.5 ? 1 : 2);
    posY += sin(radians(angle)) * stepSize;

    boolean reachedBorder = false;
  
    if (posY <= margin) {
      direction = SOUTH;
      reachedBorder = true;
    }
    else if (posX >= width - margin) {
      direction = WEST;
      reachedBorder = true;
    }
    else if (posY >= height - margin) {
        direction = NORTH;
      reachedBorder = true;
    }
    else if (posX <= margin) {
      direction = EAST;
      reachedBorder = true;
    }
  
    int px = (int) posX;
    int py = (int) posY;
  
    if (get(px, py) != color(0) || reachedBorder) {
      float distance = dist(posX, posY, posXcross, posYcross);
  
      if (distance >= minLength) {
        float sw = distance / lineWeight;

        strokeWeight(sw);
        stroke(255, 100);

        if (showLines) line(posX, posY, posXcross, posYcross);

        circle(posX, posY, sw);
        circle(posXcross, posYcross, sw / 2);
      }
  
      posXcross = posX;
      posYcross = posY;
      angle = getRandomAngle(direction);
    }
  }
}

float getRandomAngle (int dir) {
  float a = (floor(random(-angleCount, angleCount)) + 1) * (90 / angleCount);

  if (dir == NORTH) return a - 90;
  if (dir == EAST)  return a;
  if (dir == SOUTH) return a + 90;
  if (dir == WEST)  return a + 180;

  return 0;
}

void keyReleased () {
  if (key == ' ') {
    background(0);
  }
}

void mouseReleased () {
  showLines = !showLines;
}
