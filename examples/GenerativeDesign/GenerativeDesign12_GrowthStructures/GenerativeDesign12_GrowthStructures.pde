int
  currentCount = 20, 
  margin = 100, 
  maxCount = 5000;

float[]
  x = new float[maxCount], 
  y = new float[maxCount], 
  r = new float[maxCount];

void setup () {
  size(1200, 1200);
  background(0);

  for (int i = 0; i < currentCount; i++) {
    r[i] = random(1, 7);
    x[i] = random(margin, width - margin);
    y[i] = random(margin, height - margin);
  }
}

void draw () {
  //background(0);

  float newR = random(1, 7);
  float newX = random(margin, width - margin);
  float newY = random(margin, height - margin);

  // Longest distance is the diagonal
  float closestD = sqrt(width * width + height * height);
  int closestIn = 0;

  for (int i = 0; i < currentCount; i++) {
    float newD = dist(newX, newY, x[i], y[i]);

    if (newD < closestD) {
      closestD = newD;
      closestIn = i;
    }
  }

  noFill();
  stroke(255);
  strokeWeight(0.5);
  circle(newX, newY, newR * 2);
  line(newX, newY, x[closestIn], y[closestIn]);

  float angle = atan2(newY - y[closestIn], newX - x[closestIn]);
  int i = currentCount;

  x[i] = x[closestIn] + cos(angle) * (r[closestIn] + newR);
  y[i] = y[closestIn] + sin(angle) * (r[closestIn] + newR);
  r[i] = newR;

  fill(255);
  noStroke();
  circle(x[i], y[i], r[i] * 2);

  currentCount++;

  if (currentCount >= maxCount) {
    println("Limit reached: " + maxCount);
    noLoop();
  }
}

void keyReleased () {
  if (key == 's') {
    saveFrame("growthStructures-" + frameCount + ".png");
  }
}
