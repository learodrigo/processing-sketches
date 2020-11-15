int num = 100;
ArrayList<Star> stars = new ArrayList();

void setup() {
  size(1200, 1200);

  for (int i = 0; i < num; i++) {
    stars.add(new Star());
  }
}

void draw() {
  background(0);

  translate(width / 2, height / 2);

  for (Star s : stars) {
    s.run();
  }
  
  rec();
  
  if (frameCount == 360) {
    exit();
  }
}

void mouseReleased () {
  exit();
}   
