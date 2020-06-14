background(0);
size(1000, 1000);
strokeWeight(0.5);
int x = width/2;
int y = height/2;
float radius = width/2;
int n = width;
float x1, y1, x2, y2, angle, c;

for (int i = 0; i < n; i++) {
  angle = random(TWO_PI);
  x1 = x + cos(angle) * radius;
  y1 = y + sin(angle) * radius;
  angle = random(TWO_PI);
  x2 = x + cos(angle) * radius;
  y2 = y + sin(angle) * radius;
  c = float(i) / float(n) * 255.0;
  stroke(0, c, c);
  line(x1, y1, x2, y2);
}
