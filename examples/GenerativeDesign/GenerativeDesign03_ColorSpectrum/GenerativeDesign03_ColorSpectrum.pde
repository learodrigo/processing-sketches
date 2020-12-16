// P_1_1_2_01.pde
// 
// Generative Gestaltung, ISBN: 978-3-87439-759-9
// First Edition, Hermann Schmidt, Mainz, 2009
// Hartmut Bohnacker, Benedikt Gross, Julia Laub, Claudius Lazzeroni
// Copyright 2009 Hartmut Bohnacker, Benedikt Gross, Julia Laub, Claudius Lazzeroni
//
// http://www.generative-gestaltung.de
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

/**
 * changing the color circle by moving the mouse.
 * 	 
 * MOUSE
 * position x          : saturation
 * position y          : brighness
 * 
 * KEYS
 * 1-5                 : number of segments
 * s                   : save png
 * p                   : save pdf
 */

import processing.pdf.*;
import java.util.Calendar;

boolean savePDF = false;

int segmentCount = 360;
int radius = 100;

void setup() {
  size(900, 900);
  colorMode(HSB, 360, 100, 100);

  stroke(51);
}

void draw() {
  if (savePDF) beginRecord(PDF, timestamp()+".pdf");

  background(51);

  int count = 0;
  for (int y = 0; y < 3; y++) {
    for (int x = 0; x < 3; x++) {
      count++;
      drawColorSpectrums(count, x * radius * 3 + radius + radius / 2, y * radius * 3 + radius + radius / 2);
    }
  }

  if (savePDF) {
    savePDF = false;
    endRecord();
    exit();
  }
}

void drawColorSpectrums (int count, int x, int y) {
  int angleStep;

  switch (count) {
    case 1:
      strokeWeight(9);
      angleStep = 120;
      break;
    case 2:
      strokeWeight(8);
      angleStep = 90;
      break;
    case 3:
      strokeWeight(7);
      angleStep = 72;
      break;
    case 4:
      strokeWeight(6);
      angleStep = 60;
      break;
    case 5:
      strokeWeight(5);
      angleStep = 45;
      break;
    case 6:
      strokeWeight(4);
      angleStep = 30;
      break;
    case 7:
      strokeWeight(3);
      angleStep = 15;
      break;
    case 8:
      strokeWeight(2);
      angleStep = 12;
      break;
    case 9:
      strokeWeight(1);
      angleStep = 6;
      break;
    default:
      angleStep = 360;
  }

  push();
  translate(x, y);
  beginShape(TRIANGLE_FAN);
  vertex(0, 0);
  for (float angle = 0; angle <= 360; angle += angleStep) {
    float vx = cos(radians(angle)) * radius;
    float vy = sin(radians(angle)) * radius;
    vertex(vx, vy);
    fill(angle + 2, 100, 100);
  }
  endShape();
  pop();
}

void keyReleased () {
  if (key=='s' || key=='S') {
    saveFrame(timestamp()+"_##.png");
    exit();
  }
  if (key=='p' || key=='P') {
    savePDF = true;
  }
}

// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}
