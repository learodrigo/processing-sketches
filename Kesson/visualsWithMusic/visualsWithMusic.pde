// https://www.youtube.com/watch?v=fO1uW-xhwtA&ab_channel=Kesson

import peasy.*;

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioInput in;
BeatDetect beat;

PeasyCam cam;

int maxW = 1024;
int maxH = int(maxW / 1.33);

void setup () {
  size(1024, 768, P3D);

  cam = new PeasyCam(this, 500);

  minim = new Minim(this);
  in = minim.getLineIn(Minim.STEREO, maxW);

  beat = new BeatDetect();
  beat.setSensitivity(400);
}

void draw () {
  beat.detect(in.mix);

  blendMode(NORMAL);
  background(0);
  
  perspective(PI / 3.0, width / height, 10.0, 1000000.0);
  
  cam.rotateY(0.04);
  cam.rotateX(0.01);
  // tweak 500 and 1000
  cam.setDistance(500 + abs(sin(frameCount * 0.01)) * 100);

  //cam.beginHUD();
  //for (int i = 0; i < width; i++) {
  //  stroke(255, in.mix.get(i) * 500);
  //  line(i, height / 2 - in.mix.get(i) * 300, i, height / 2 + in.mix.get(i) * 300);
  //}
  //cam.endHUD();
  
  hint(DISABLE_DEPTH_TEST);
  
  int tot = 100;
  PVector[][] pp = new PVector[tot][tot];
  
  for (int i = 0; i < tot; i++) {
    // Tweak values
    float lat = map(i, 0, tot - 1, -HALF_PI, HALF_PI);

    for (int j = 0; j < tot; j++) {
      float lon = map(j, 0, tot - 1, -PI, PI);

      int imnd = i + j * tot;
      // Tweak last value
      float r = 200 + in.mix.get(imnd % maxW) * 200;

      float x = r * cos(lat) * cos(lon);
      float y = r * sin(lat) * cos(lon);
      float z = r * sin(lon);
      pp[i][j] = new PVector(x, y, z);
    }
  }
  
  blendMode(ADD);
  
  for (int i = 0; i < tot - 1; i++) {
    beginShape(TRIANGLE_STRIP);
      // Check colors
      stroke(222, 50, 50, in.mix.get(i) * 500);
      noFill();
      fill(in.mix.get(i) * 500);

      for (int j = 0; j < tot; j++) {
        vertex(pp[i + 0][j].x, pp[i + 0][j].y, pp[i + 0][j].z);
        vertex(pp[i + 1][j].x, pp[i + 1][j].y, pp[i + 1][j].z);
      }
    endShape();
  }
  
  if (beat.isOnset()) background(255);
}
