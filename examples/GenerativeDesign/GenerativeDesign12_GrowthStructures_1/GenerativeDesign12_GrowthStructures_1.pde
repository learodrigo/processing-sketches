int
  currentCount = 5, 
  margin = 100, 
  maxCount = currentCount * 200;

PGraphics
  hexx;

float[]
  x = new float[maxCount], 
  y = new float[maxCount], 
  r = new float[maxCount];

float randomR () {
  return random(1, 7);
}
float randomX () {
  return random(margin, width - margin);
}
float randomY() {
  return random(margin, height - margin);
}

void setup () {
  size(1200, 1200);
  background(0);

  for (int i = 0; i < currentCount; i++) {
    r[i] = randomR();
    x[i] = randomX();
    y[i] = randomY();
  }
}

void polygon(float x, float y, float radius, int npoints) {
  float angle = TWO_PI / npoints;

  beginShape();
    for (float a = 0; a < TWO_PI; a += angle) {
      float sx = x + cos(a) * radius;
      float sy = y + sin(a) * radius;
      vertex(sx, sy);
    }
  endShape(CLOSE);
}

void draw () {
  float newR = randomR();
  float newX = randomX();
  float newY = randomY();

  // Longest distance is the diagonal
  float closestD = sqrt(width * width + height * height);
  int closestIn = 0;

  for (int i = 0; i < currentCount; i++) {
    float newD = dist(newX, newY, x[i] - 1, y[i] - 1);

    if (newD < closestD) {
      closestD = newD;
      closestIn = i;
    }
  }

  float angle = atan2(newY - y[closestIn], newX - x[closestIn]);
  int i = currentCount;
  currentCount++;

  x[i] = x[closestIn] + cos(angle) * (r[closestIn] + newR);
  y[i] = y[closestIn] + sin(angle) * (r[closestIn] + newR);
  r[i] = newR;

  //if (frameCount % 3 == 0) {
    showHistoryPath(newX, newY, newR, closestIn);
  //}

  //stroke(255, 150);
  //strokeWeight(r[i] / 2);
  //fill(255);
  noStroke();

  //if (frameCount % 5 == 0) {
    noFill();
    stroke(255, 100);
    strokeWeight(2);
  //}

  circle(x[i], y[i], r[i] * 4);
  circle(x[i], y[i], r[i] * 3);
  circle(x[i], y[i], r[i] * 2);
  circle(x[i], y[i], r[i] * 1);
  stroke(255, 100);
  polygon(x[i], y[i], r[i] * 5, (int) random(5, 7));
  stroke(255, 50);
  polygon(x[i], y[i], r[i] * 7, (int) random(6, 8));
  stroke(255, 40);
  polygon(x[i], y[i], r[i] * 9, (int) random(7, 9));

  if (currentCount >= maxCount) {
    println("Limit reached: " + maxCount);
    noLoop();
  }
}

void showHistoryPath (float _x, float _y, float _r, int inx) {
  noFill();
  stroke(255);
  strokeWeight(0.1);
  circle(_x, _y, _r * 2);
  line(_x, _y, x[inx], y[inx]);
}

// timestamp
import java.util.Calendar;
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}

void keyReleased () {
  if (key == 's') {
    String msg = "growthStructures-" + timestamp() + "-" + frameCount + ".png";
    saveFrame(msg);
    println("Saved: " + msg);
  }
}
