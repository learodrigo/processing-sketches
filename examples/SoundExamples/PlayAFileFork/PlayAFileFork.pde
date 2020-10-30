import ddf.minim.*;

Minim minim;
AudioSample drama, gong;
AudioPlayer idk;

void setup() {
  size(512, 200, P3D);
  minim = new Minim(this);
  
  drama = minim.loadSample("drama.wav", 512);
  gong = minim.loadSample("gong.wav", 512);
  //idk = minim.loadFile("idk.mp3");
  //idk.loop();
}

void draw() {
  noStroke();
  background(255);
  fill(255, 0, 0);
  rect(25, 25, 50, 50);
  
  fill(0, 0, 255);
  rect(125, 25, 50, 50);
}

void mousePressed () {
  if (mouseX < 75 && mouseX > 25 && mouseY < 75 && mouseY > 25) {
    drama.trigger();
  } else if (mouseX < 175 && mouseX > 25 && mouseY < 75 && mouseY > 25) {
    gong.trigger();
  }
}
