void applyMove () {
  switch (key) {
    case 'b':
    turnZ(-1, -1);
    break;
    case 'B':
    turnZ(-1, 1);
    break;
    case 'f':
    turnZ(1, -1);
    break;
    case 'F':
    turnZ(1, 1);
    break;
    case 'u':
    turnY(-1, -1);
    break;
    case 'U':
    turnY(-1, 1);
    break;
    case 'd':
    turnY(1, -1);
    break;
    case 'D':
    turnY(1, 1);
    break;
    case 'l':
    turnX(-1, -1);
    break;
    case 'L':
    turnX(-1, 1);
    break;
    case 'r':
    turnX(1, -1);
    break;
    case 'R':
    turnX(1, 1);
    break;
  }
}

void keyPressed () {
  if (key == ' ') {
    currentMove.start();
  }
  
 
}
