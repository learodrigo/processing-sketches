int amount = 100;
int ele = 64;

void setup () {
  size(64, 64);
  rectMode(CENTER);
}

void draw () {
  for (int i = 0; i < 3; i++) {
    background(255);
  
    strokeWeight(floor(random(1, 5)));
  
    float r = random(8, ele / 2 - 8);
    float x = random(r, width - r);
    float y = random(r, height - r);
  
    stroke(random(100), random(100), random(100));
  
    pushMatrix();
      translate(x, y);
  
      if (i == 0) {
        circle(0, 0, r);
        saveFrame("data/circle####.png");
      }
      else if (i == 1) {
        rotate(random(-0.1, 0.1));
        square(0, 0, r * 2);
        saveFrame("data/square####.png");
      }
      else {
        rotate(random(-0.2, 0.1));
        triangle(-r, -r, r, -r, 0, r);
        saveFrame("data/triangle####.png");
      }
    popMatrix();
  }

  if (frameCount == amount) exit();
}
