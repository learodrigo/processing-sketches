import peasy.*;
PeasyCam cam;

Move[] moves = new Move[] {
  new Move(0, 1, 0, 1), 
  new Move(0, 1, 0, -1), 
  new Move(0, -1, 0, 1), 
  new Move(0, -1, 0, -1), 

  new Move(1, 0, 0, 1), 
  new Move(1, 0, 0, -1), 
  new Move(-1, 0, 0, 1), 
  new Move(-1, 0, 0, -1), 

  new Move(0, 0, 1, 1), 
  new Move(0, 0, 1, -1), 
  new Move(0, 0, -1, 1), 
  new Move(0, 0, -1, -1), 
};

ArrayList<Move> sequence = new ArrayList<Move>();

int dim = 3;

Cubie[] cubes = new Cubie[dim * dim * dim];

Move currentMove;

float camSpeed = 0.005;
float speed = 0.1;

int counter = 0;

void turnX (int index, int dir) {
  for (Cubie c : cubes) {
    if (c.x == index) {
      PMatrix2D matrix = new PMatrix2D();
      matrix.rotate(dir * HALF_PI);
      matrix.translate(c.y, c.z);
      c.turnFacesX(dir);
      c.update(c.x, round(matrix.m02), round(matrix.m12));
    }
  }
}

void turnY (int index, int dir) {
  for (Cubie c : cubes) {
    if (c.y == index) {
      PMatrix2D matrix = new PMatrix2D();
      matrix.rotate(dir * HALF_PI);
      matrix.translate(c.x, c.z);
      c.turnFacesY(dir);
      c.update(round(matrix.m02), c.y, round(matrix.m12));
    }
  }
}

void turnZ (int index, int dir) {
  for (Cubie c : cubes) {
    if (c.z == index) {
      PMatrix2D matrix = new PMatrix2D();
      matrix.rotate(dir * HALF_PI);
      matrix.translate(c.x, c.y);
      c.turnFacesZ(dir);
      c.update(round(matrix.m02), round(matrix.m12), c.z);
    }
  }
}
void setup () {
  //size(900, 900, P3D);
  fullScreen(P3D);
  frameRate(20);

  cam = new PeasyCam(this, 1000);

  int index = 0;

  for (int x = -1; x <= 1; x++) {
    for (int y = -1; y <= 1; y++) {
      for (int z = -1; z <= 1; z++) {
        PMatrix3D matrix = new PMatrix3D();
        matrix.translate(x, y, z);
        cubes[index] = new Cubie(matrix, x, y, z);
        index++;
      }
    }
  }

  for (int i = 0; i < 50; i++) {
    int r = floor(random(moves.length - 1));
    Move m = moves[r];
    sequence.add(m);
  }

  currentMove = sequence.get(counter);

  for (int i = sequence.size() - 1; i >= 0; i--) {
    Move nextMove = sequence.get(i).copy();
    nextMove.reverse();
    sequence.add(nextMove);
  }
}

void draw () {
  background(51);

  cam.rotateX(camSpeed);
  cam.rotateY(camSpeed);
  cam.rotateZ(camSpeed / 2);

  currentMove.update();

  if ( currentMove.finished() ) {
    if (counter < sequence.size() - 1) {
      counter++;
      currentMove = sequence.get(counter);
      currentMove.start();
    }
  }

  scale(75);

  
  for (int j = 0; j < 1000; j++) {
    push();
      translate(random(-j / 2, j / 2), random(-j / 2, j / 2), random(-j / 2, j / 2));

        for (Cubie c : cubes) {
          push();
            if (abs(c.x) > 0 && c.x == currentMove.x) {
              rotateX(currentMove.angle);
            } else if (abs(c.y) > 0 && c.y == currentMove.y) {
              rotateY(-currentMove.angle);
            } else if (abs(c.z) > 0 && c.z == currentMove.z) {
              rotateZ(currentMove.angle);
            }
            c.show();
          pop();
        }
    pop();
  }

  rec();
  if (frameCount == 360) {
    exit();
  }
}

//void mousePressed() {
//  saveFrame("####.png");
//}
