float angle = 0.0;
float counter = 0.0;
boolean rec = false;

void setup() {
  size(1800, 900);
  background(0);
}

void mousePressed () {
  println(frameCount);
  background(0);
}

void keyPressed() {
  if (key == ' ') {
    background(0);
  }
}

void draw() {
  strokeWeight(0.2 + counter);

  angle = sin(counter) * 100;
  counter += 0.0001;

  stroke(255, 100);

  push();
    translate(width * 0.25, height);
    branch(height * 0.4);
  pop();

  push();
    translate(width * 0.5, height);
    branch(height * 0.4);
  pop();

  push();
    translate(width * 0.75, height);
    branch(height * 0.4);
  pop();

  push();
    translate(width * 0.25, 0);
    rotate(radians(180));
    branch(height * 0.4);
  pop();

  push();
    translate(width * 0.5, 0);
    rotate(radians(180));
    branch(height * 0.4);
  pop();

  push();
    translate(width * 0.75, 0);
    rotate(radians(180));
    branch(height * 0.4);
  pop();

  push();
    translate(0, height * 0.4);
    rotate(radians(90));
    branch(width * 0.25);
  pop();

  push();
    translate(0, height * 0.6);
    rotate(radians(90));
    branch(width * 0.25);
  pop();

  push();
    translate(width, height * 0.4);
    rotate(radians(270));
    branch(width * 0.25);
  pop();

  push();
    translate(width, height * 0.6);
    rotate(radians(270));
    branch(width * 0.25);
  pop();
  
  if (rec) {
    rec();
  }
}

void branch (float len) {
  line(0, 0, 0, -len);
  translate(0, -len);

  if (len > 4) {
    push();
      rotate(angle);
      branch(len * 0.6);
    pop();

    push();
      rotate(-angle);
      branch(len * 0.6);
    pop();
  }
}
