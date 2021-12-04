import processing.video.*;
import java.time.LocalDateTime;

Capture cam;

int w = 2;
int h = 2;
int y = 0;
float angle = 0;
int offset = 0;

PImage sliceCircular;
PImage slice;
PImage[] slices;
int sliceIndex = 0;

PImage[] history;
int historyIndex = 0;


void setup () {
  size(640, 480);

  String[] cameras = Capture.list();
  cam = new Capture(this, cameras[0]);

  sliceCircular = createImage(w, height, RGB);
  slice = createImage(width, h, RGB);
  slices = new PImage[height / h];
  history = new PImage[height / h];

  for (int i = 0; i < slices.length; i++) {
    slices[i] = createImage(width, h, RGB);
  }
  for (int i = 0; i < history.length; i++) {
    history[i] = createImage(width, height, RGB);
  }

  cam.start();

  background(0);
}

void captureEvent(Capture cam) {
  cam.read();
  history[historyIndex].copy(cam, 0, 0, width, height, 0, 0, width, height);
  historyIndex = (historyIndex + 1) % history.length;
}

void runCamera() {
  // Cirular stripes
  // sliceCircular.copy(cam, width / 2 - w / 2, 0, w, height, 0, 0, w, height);
  // translate(width / 2, height / 2);
  // rotate(angle);
  // image(sliceCircular, 0, 0);
  // angle += 0.01;

  // Top to bottom horizontal stripes
  //slice.copy(cam, 0, height / 2 - h / 2, width, h, 0, 0, width, h);
  //image(slice, 0, y);
  //y += (1 % height);

  // Bottom to top horizontal stripes
  // Here we implement an array from the previous example
  //slices[sliceIndex].copy(cam, 0, height / 2 - h / 2, width, h, 0, 0, width, h);

  //for (int i = 0; i < slices.length; i++) {
  //  int currentIndex = (i + offset) % slices.length;
  //  image(slices[currentIndex], 0, i * h);
  //}

  //sliceIndex = (sliceIndex + 1) % slices.length;
  //offset++;

  // Bottom to top horizontal stripes
  //for (int i = 0; i < history.length; i++) {
  //  int y = i * h;
  //  int currentIndex = (i + offset) % history.length;
  //  copy(history[currentIndex], 0, y, width, h, 0, y, width, h);
  //}

  //offset++;
}

void draw () {
  runCamera();

  if (keyPressed) {
    if (key == 's') {
      LocalDateTime now = LocalDateTime.now();

      saveFrame("exports/"+ now.toString() +"Bending-time-slitscan####.png");
      print("Image Saved!");
    }
  }
}
