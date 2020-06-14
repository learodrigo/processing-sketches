/**
 * Machine learning series and build a simple Perceptron
 * aka statistical approach
 *
 * https://github.com/nature-of-code/NOC-S17-2-Intelligence-Learning/tree/master/week4-neural-networks
 * https://en.wikipedia.org/wiki/Perceptron
 * https://www.ling.upenn.edu/courses/cogs501/Rosenblatt1958.pdf
 * https://www.youtube.com/watch?v=L-Lsfu4ab74
 */

Perceptron brain;
Point[] points = new Point[1000];

int trainingIndex = 0;

void setup () {
  size(1000, 1000);

  for (int i = 0; i < points.length; i++) {
    points[i] = new Point();
  }

  brain = new Perceptron(3);
}

void draw () {
  background(0);

  // Separation line
  stroke(255);
  strokeWeight(8);
  Point p1 = new Point(-1, f(-1));
  Point p2 = new Point(1, f(1));
  line(p1.pixX(), p1.pixY(), p2.pixX(), p2.pixY());

  // What the system thinks is the line
  stroke(255, 150);
  strokeWeight(4);
  Point p3 = new Point(-1, brain.guessY(-1));
  Point p4 = new Point(1, brain.guessY(1));
  line(p3.pixX(), p3.pixY(), p4.pixX(), p4.pixY());

  for (Point pt : points) {
    float[] inputs = {pt.x, pt.y, pt.bias};
    int target = pt.label;

    pt.show();

    int guess = brain.guess(inputs);
    fill((guess == target) ? color(0, 255, 0) : color(255, 0, 0));
    noStroke();
    ellipse(pt.pixX(), pt.pixY(), 7, 7);
  }

  Point training = points[trainingIndex];
  float[] inputs = {training.x, training.y, training.bias};
  int target = training.label;
  brain.train(inputs, target);
  trainingIndex++;
  if (trainingIndex == points.length) {
    trainingIndex = 0;
  }
}
