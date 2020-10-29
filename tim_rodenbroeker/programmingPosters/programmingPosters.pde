// https://timrodenbroeker.de/processing-tutorial-programming-posters/

PGraphics firstLayer, secondLayer, buffer;
PImage imgFL, imgSL;
PFont sans;

boolean debugFL, debugSL;

void setup () {
  size(680, 1100);
  
  int w = int((width / 1.618) * 1.3);
  int h = int((height / 1.618) * 1.3);

  sans = createFont("Inter-Medium.otf", 1000);

  firstLayer = createGraphics(w, h);
  secondLayer = createGraphics(w, h);
  buffer = createGraphics(w, h);

  imgFL = loadImage("a.jpg");
  imgSL = loadImage("n.jpg");
  
  debugFL = false;
  debugSL = false;
}

void draw () {
  background(0);

  drawFirstLayer();
  drawSecondLayer();
  drawBufferLayer();

  imageMode(CENTER);

  if (debugFL) {
    image(firstLayer, width / 2, height / 2);
  } else if (debugSL) {
    image(secondLayer, width / 2, height / 2);
  } else {
    image(buffer, width / 2, height / 2);
  }
  
  rec();
  
  if (frameCount == 360) {
    exit();
  }
}
