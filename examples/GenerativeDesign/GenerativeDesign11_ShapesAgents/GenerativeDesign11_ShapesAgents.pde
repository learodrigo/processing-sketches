int
  formRes = 15, 
  stepSize = 2;

float
  centerX, 
  centerY, 
  shapeRadius = 50;

float[]
  x = new float[formRes], 
  y = new float[formRes];

boolean
  filled = false, 
  freeze = false,
  noLines = true;

void setup () {
  size(900, 900);
  smooth();

  background(0);

  centerX = width / 2; 
  centerY = height / 2;

  float angle = radians(360 / float(formRes));

  for (int i = 0; i < formRes; i++) {
    x[i] = cos(angle * i) * shapeRadius;
    y[i] = sin(angle * i) * shapeRadius;
  }
}

void draw () {
  if (mouseX != 0 || mouseY != 0) {
    centerX += (mouseX - centerX) * 0.01;
    centerY += (mouseY - centerY) * 0.01;
  }

  for (int i = 0; i < formRes; i++) {
    x[i] += random(-stepSize, stepSize);
    y[i] += random(-stepSize, stepSize);
    //circle(x[i] + width / 2, y[i] + height / 2, 20);
  }

  noFill();
  if (filled) fill(random(255));

  stroke(255, 50);
  if (noLines) noStroke();

  beginShape();
    curveVertex(
      x[formRes - 1] + centerX, 
      y[formRes - 1] + centerY
    );

    for (int i = 0; i < formRes; i++) {
      curveVertex(
        x[i] + centerX, 
        y[i] + centerY
      );
    }

    curveVertex(
      x[0] + centerX, 
      y[0] + centerY
    );
  
    curveVertex(
      x[1] + centerX, 
      y[1] + centerY
    );
  endShape();
}

void mousePressed() {
  centerX = mouseX; 
  centerY = mouseY;

  float angle = radians(360 / float(formRes));
  float radius = shapeRadius * random(0.5, 2);

  for (int i = 0; i < formRes; i++) {
    x[i] = cos(angle * i) * radius;
    y[i] = sin(angle * i) * radius;
  }
}

void keyReleased() {
  if (key == ' ') background(0);
  if (key == 'f') filled = !filled;
  if (key == 'n') noLines = !noLines;
}
