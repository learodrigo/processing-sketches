/***************************************************************
  Unknown Pleasures

  Curves constructed from the actual data from the first
  recorded radio pulsar, PSR B1919+21. Artist Peter Saville
  saw the image in The Cambridge Encyclopaedia of Astronomy,
  and presented a few options to the band. Bernard Sumner
  chose PSR B1919+21, and the rest is history.

  CSV file contains 80 lines, each containing 300 data points.

  License: http://unlicense.org/
***************************************************************/

void setup () {
  size(900, 900);
}

void draw () {
  background(0);
  strokeWeight(2.5);
  stroke(255);
  fill(0);

  String[] data = loadStrings("pulsar.csv");

  for (int y = 0; y < data.length; y++) {
    float[] points = float(split(data[y],','));

    beginShape();
    for (int x = 0; x < points.length; x++) {
      vertex(150 + 2 * x, -80 + height - (8 * (79 - y) + 2 * points[x]));
    }
    endShape();
  }

  noLoop();
}
