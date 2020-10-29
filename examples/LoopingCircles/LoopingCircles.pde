int diam = 10;
float centX, centY;

void setup () {
  size(600, 400);
  frameRate(24);
  smooth();
  background(180);
  centX = width/2;
  centY = height/2;
  stroke(0);
  strokeWeight(0);
  noFill();
}

void draw () {
  if (diam <= width - 100) {
    //background(180);
    
    fill(255, 100);
    ellipse(centX, centY, diam, diam);
    
    strokeWeight(0);
    noFill();
    int tempDiam = diam;
    while (tempDiam > 10) {
      ellipse(centX, centY, tempDiam, tempDiam);
      tempDiam -= 10;
    }
    
    diam += 10;
  }
}
