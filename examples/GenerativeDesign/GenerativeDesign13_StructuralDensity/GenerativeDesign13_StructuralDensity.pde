int
  margin = 50, 
  minRadius = 1, 
  maxRadius = 50, 
  maxCount = 1000, 
  currentCount = 1;

float
  mouseRect = 20;

int[]
  closestIndex = new int[maxCount];

float[]
  x = new float[maxCount], 
  y = new float[maxCount], 
  r = new float[maxCount];

void setup () {
  size(1200, 1200);
  background(0);
  smooth();
  rectMode(CENTER);

  x[0] = random(maxRadius + margin, width - maxRadius - margin);
  y[0] = random(maxRadius + margin, height - maxRadius - margin);
  r[0] = random(minRadius, maxRadius);

  closestIndex[0] = 0;
}

void draw () {
  float newX = random((maxRadius * 2) + margin, width - (maxRadius * 2) - margin);
  float newY = random((maxRadius * 2) + margin, height - (maxRadius * 2) - margin);
  float newR = minRadius;
  boolean intersect = false;

  if (mousePressed) {
    newX = random(mouseX - mouseRect / 2 - margin, mouseX + mouseRect / 2 + margin);
    newY = random(mouseY - mouseRect / 2 - margin, mouseY + mouseRect / 2 + margin);
    newR = 1;
  }

  for (int i = 0; i < currentCount; i++) {
    float d = dist(newX, newY, x[i], y[i]);

    if (d < (newR + r[i])) {
      intersect = true;
      break;
    }
  }

  if (!intersect) {
    float newRadius = width;

    for (int i = 0; i < currentCount; i++) {
      float d = dist(newX, newY, x[i], y[i]);

      if (newRadius > d - r[i]) {
        newRadius = d - r[i];
        closestIndex[currentCount] = i;
      }
    }

    if (newRadius > maxRadius) newRadius = maxRadius;

    x[currentCount] = newX;
    y[currentCount] = newY;
    r[currentCount] = newRadius;
    currentCount++;
  }

  for (int i = 0; i < currentCount; i++) {
    noFill();
    stroke(255, 10);
    strokeWeight(1);
    circle(x[i], y[i], r[i] * 2);

    rotate(HALF_PI);
    //if (random(1) > 0.8) {
    //  fill(255, 1);
    //  stroke(255, 1);
    //}
    strokeWeight(2);
    rect(x[i], y[i], r[i], r[i]);

    int n = closestIndex[i];
    strokeWeight(0.5);
    line(x[i], y[i], x[n], y[n]);
  }

  if (currentCount >= maxCount) {
    println("Hello world");
    noLoop();
  }
}

// timestamp
import java.util.Calendar;
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}

void keyReleased () {
  if (key == 's') {
    String msg = "structuralDensity-" + timestamp() + "-" + frameCount + ".png";
    saveFrame(msg);
    println("Saved: " + msg);
  }
}
