float theta = random(PI);

void setup () {
  size(800, 800);
}

void draw () {
  background(0);
  
  theta = mouseX;

  // TRUNK
  translate(width * 0.5, height);
  stroke(255);
  branch(200, theta);
}

//void mousePressed () {
//  theta = random(PI);
//}

void branch (float len, float a) {  
  float sw = map(abs(len), 1, 120, 1, 10);
  strokeWeight(sw);
  line(0, 0, 0, -len);
  translate(0, -len);
  len *= 0.66;

  if (len > 1) {
    // Branch right
    pushMatrix();
    rotate(a);
    branch(len, theta);
    popMatrix();

    // Branch left
    pushMatrix();
    rotate(-a);
    branch(len, theta);
    popMatrix();
  }
}
