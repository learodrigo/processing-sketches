void keyPressed () {
  switch (key) {
    case '1':
      for (int i = 0; i < tileCountX; i++) {
        hueValues[i] = (int) random(0, 360);
        satValues[i] = (int) random(0, 100);
        briValues[i] = (int) random(0, 100);
      }
      redraw();
      break;

    case '2':
      for (int i = 0; i < tileCountX; i++) {
        hueValues[i] = (int) random(0, 360);
        satValues[i] = (int) random(0, 100);
        briValues[i] = 100;
      }
      redraw();
      break;

    case '3':
      for (int i = 0; i < tileCountX; i++) {
        hueValues[i] = (int) random(0, 360);
        satValues[i] = 100;
        briValues[i] = (int) random(0, 100);
      }
      redraw();
      break;

    case '4':
      for (int i = 0; i < tileCountX; i++) {
        hueValues[i] = 0;
        satValues[i] = 0;
        briValues[i] = (int) random(0, 100);
      }
      redraw();
      break;

    case '5':
      for (int i = 0; i < tileCountX; i++) {
        hueValues[i] = 195;
        satValues[i] = 100;
        briValues[i] = (int) random(0, 100);
      }
      redraw();
      break;

    case '6':
      for (int i = 0; i < tileCountX; i++) {
        hueValues[i] = 195;
        satValues[i] = (int) random(0, 100);
        briValues[i] = 100;
      }
      redraw();
      break;

    case '7':
      for (int i = 0; i < tileCountX; i++) {
        hueValues[i] = (int) random(0, 180);
        satValues[i] = (int) random(80, 100);
        briValues[i] = (int) random(50, 90);
      }
      redraw();
      break;

    case '8':
      for (int i = 0; i < tileCountX; i++) {
        hueValues[i] = (int) random(180, 360);
        satValues[i] = (int) random(80, 100);
        briValues[i] = (int) random(50, 90);
      }
      redraw();
      break;

    case '9':
      for (int i = 0; i < tileCountX; i++) {        
        hueValues[i] = (int) ((i % 2 == 0) ? random(0, 360) : 195);
        satValues[i] = (int) random(0, 100);
        briValues[i] = 100;
      }
      redraw();
      break;

    case '0':
      for (int i = 0; i < tileCountX; i++) {
          hueValues[i] = (int) ((i % 2 == 0) ? 192 : 273);
          satValues[i] = (int) random(0, 100);
          briValues[i] = (int) ((i % 2 == 0) ? random(10, 100) : random(10, 90));
      }
      redraw();
      break;

    case ' ':
      redraw();
      break;
    }
}
