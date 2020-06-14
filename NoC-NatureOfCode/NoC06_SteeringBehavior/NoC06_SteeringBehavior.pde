Vehicle[] vehicles = new Vehicle[40];
int rad = 8;

void setup () {
  size(1000, 800);

  for (int i = 0; i < vehicles.length; i++) {
    vehicles[i] = new Vehicle(random(width), random(height));
  }
}

void draw () {
  background(0);

  // Attractor
  PVector mouse = new PVector(mouseX, mouseY);
  noStroke();
  fill(255, 0, 0);
  ellipse(mouse.x, mouse.y, rad * 2, rad * 2);

  // Vehicle
  for (Vehicle v : vehicles) {
    v.seek(mouse);
    v.arrive(mouse);
    v.update();
    v.show();
  }
}
