void drawFirstLayer () {
    firstLayer.beginDraw();
    firstLayer.background(#ff0000, 0);
    firstLayer.imageMode(CENTER);

    // Display firstLayer
    firstLayer.push();
      firstLayer.translate(firstLayer.width / 2, firstLayer.height / 2);
      float imgWave = map(sin(radians(frameCount)), -1, 1, 3.2, 1.8);
      firstLayer.scale(imgWave);
      firstLayer.image(imgFL, 0, 0);
    firstLayer.pop();

    // Text style
    firstLayer.textFont(sans);
    firstLayer.textAlign(CENTER, CENTER);
    firstLayer.textSize(300);
    firstLayer.fill(#1e1e1e);

    // Display text
    String title = "A la gilada, ni cabida.";
    float textW = firstLayer.textWidth(title);
    float textWave = map(tan(radians(frameCount)), -1, 1, -textW / 10, textW / 10);

    firstLayer.push();
      firstLayer.translate(textWave, firstLayer.height / 2);
      firstLayer.text(title, textWave * 1.1, firstLayer.height / 15);
    firstLayer.pop();

  firstLayer.endDraw();
}
