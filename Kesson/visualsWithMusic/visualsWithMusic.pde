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

int maxW = width;
int maxH = int(maxW / 1.33);

boolean record = false;

void setup () {
  fullScreen(P3D);

  cam = new PeasyCam(this, 500);

  minim = new Minim(this);
  in = minim.getLineIn(Minim.STEREO, maxW);

  beat = new BeatDetect();
  beat.setSensitivity(50);
}

void draw () {
  beat.detect(in.mix);

  blendMode(NORMAL);
  background(0);

  perspective(PI / 3.0, width / height, 10.0, 1000000.0);

  cam.rotateY(0.03);
  cam.rotateX(0.01);
  cam.rotateZ(0.05);

  // tweak 500 and 1000
  cam.setDistance(500 + abs(sin(frameCount * 0.01)) * 100);

  //cam.beginHUD();
  //for (int i = 0; i < width; i++) {
  //  stroke(255, in.mix.get(i) * 500);
  //  line(i, height / 2 - in.mix.get(i) * 300, i, height / 2 + in.mix.get(i) * 300);
  //}
  //cam.endHUD();

  hint(DISABLE_DEPTH_TEST);

  int tot = 50;
  PVector[][] pp = new PVector[tot][tot];
  //PVector[][] pp2 = new PVector[tot][tot];

  for (int i = 0; i < tot; i++) {
    // Tweak values
    float lat = map(i, 0, tot - 1, -HALF_PI, HALF_PI);

    for (int j = 0; j < tot; j++) {
      float lon = map(j, 0, tot - 1, -PI, PI);

      int imnd = i + j * tot;

      // Tweak last value
      float r = 150 + in.mix.get(imnd % maxW) * 10;

      float x = r * cos(lat) * sin(lon);
      float y = r * sin(lat) * cos(lon);
      float z = r * sin(lon) * 2;

      pp[i][j] = new PVector(x, y, z);

      x = r * cos(lat) * sin(lon);
      y = r * cos(lat) * sin(lon) * cos(lon);
      z = r * cos(lon) * 2;
      pp2[i][j] = new PVector(x, y, z);
    }
  }

  blendMode(ADD);

  for (int i = 0; i < tot - 1; i++) {
    beginShape(TRIANGLE_STRIP);

    // Check colors

    noFill();

    for (int j = 0; j < tot; j++) {
      stroke(0, 255, 250, (in.mix.get(i) * 255) + 20);
      vertex(pp[i + 0][j].x, pp[i + 0][j].y, pp[i + 0][j].z);
      vertex(pp[i + 1][j].x, pp[i + 1][j].y, pp[i + 1][j].z);
    }
    endShape();

    //beginShape();
    //for (int j = 0; j < tot; j++) {    
    //  stroke(255, 0, 50, (in.mix.get(i) * 255) + 100);
    //  vertex(pp2[i + 0][j].x, pp2[i + 0][j].y, pp2[i + 0][j].z);
    //  vertex(pp2[i + 1][j].x, pp2[i + 1][j].y, pp2[i + 1][j].z);
    //}
    //endShape();
  }

  if (beat.isOnset()) background(255);

  if (record) {
    rec();
  }
}
