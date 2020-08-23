/*
🔗 Marching cubes: A high resolution 3D surface construction algorithm by William E. Lorensen and Harvey E. Cline: https://citeseerx.ist.psu.edu/viewdoc...
🔗 Metaballs and Marching Squares by Jamie Wong: http://jamie-wong.com/2014/08/19/meta...
🔗 Marching squares : https://en.wikipedia.org/wiki/Marchin...
🔗 OpenSimplexNoise-for-Processing (GitHub Repo): https://github.com/CodingTrain/OpenSi...
🔗 Open Simplex Noise in Java:  https://gist.github.com/KdotJPG/b1270...

🎥 Coding Adventure: Marching Cubes: https://youtu.be/M3iI2l0ltbE
🎥 [Unity] Procedural Cave Generation (E02. Marching Squares): https://youtu.be/yOgIncKp0BE
🎥 Coding Challenge #28 - Metaballs: https://youtu.be/ccYLb7cLB1I
🎥 What is OpenSimplex Noise?: https://youtu.be/Lv9gyZZJPE0
🎥 Coding in the Cabana #4 - Worley Noise: https://youtu.be/4066MndcyCk
🎥 2D Noise - Perlin Noise and p5.js Tutorial: https://youtu.be/ikwNrFvnL3g
*/

float[][] field;
int rez = 5 ;
int cols, rows;
float inc = 0.1;
float zoff = 0;

OpenSimplexNoise noise;

void setup () {
  size(800, 600, P2D);
  noise = new OpenSimplexNoise();
  cols = 1 + width / rez;
  rows = 1 + height / rez;
  field = new float[cols][rows];
}

void line (PVector a, PVector b) {
  line(a.x, a.y, b.x, b.y);
}

void draw () {
  background(0);

  fillNumbersField();
  drawSquaresBlackBg();
  //drawSquaresCorners();
  drawField();
}

void drawField () {
  for (int i = 0; i < cols - 1; i++) {
    for (int j = 0; j < rows - 1; j++) {
      float x = i * rez;
      float y = j * rez;
      PVector a = new PVector(x + rez * 0.5, y            );
      PVector b = new PVector(x + rez, y + rez * 0.5);
      PVector c = new PVector(x + rez * 0.5, y + rez      );
      PVector d = new PVector(x, y + rez * 0.5);
      int state = getState(ceil(field[i][j]), ceil(field[i+1][j]), ceil(field[i+1][j + 1]), ceil(field[i][j+1]));
      strokeWeight(1);
      stroke(255);
      switch (state) {
        case 1:
          line(c, d);
          break;
        case 2:
          line(b, c);
          break;
        case 3:
          line(b, d);
          break;
        case 4:
          line(a, b);
          break;
        case 5:
          line(a, d);
          line(b, c);
          break;
        case 6:
          line(a, c);
          break;
        case 7:
          line(a, d);
          break;
        case 8:
          line(a, d);
          break;
        case 9:
          line(a, c);
          break;
        case 10:
          line(a, b);
          line(c, d);
          break;
        case 11:
          line(a, b);
          break;
        case 12:
          line(b, d);
          break;
        case 13:
          line(b, c);
          break;
        case 14:
          line(c, d);
          break;
      }
    }
  }
}

void drawSquareCornes () {
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      strokeWeight(rez * 0.4);
      stroke(field[i][j] * 255);
      point(i * rez, j * rez);
    }
  }
}

void fillNumbersField () {
  float xoff = 0;
  for (int i = 0; i < cols; i++) {
    float yoff = 0;
    xoff += inc;
    for (int j = 0; j < rows; j++) {
      field[i][j] = (float)(noise.eval(xoff, yoff, zoff));
      yoff += inc;
    }
  }
  zoff += 0.03;
}

void drawSquaresBlackBg () {
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      fill(field[i][j] * 255);
      noStroke();
      rect(i * rez, j * rez, rez, rez);
    }
  }
}

int getState (int a, int b, int c, int d) {
  return a * 8 + b * 4 + c * 2 + d;
}
