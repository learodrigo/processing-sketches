void drawSecondLayer () {
    secondLayer.beginDraw();
    secondLayer.background(#ff0000, 0);
    secondLayer.imageMode(CENTER);

    // Display secondLayer
    secondLayer.push();
      secondLayer.translate(secondLayer.width / 2, secondLayer.height / 2);
      float imgWave = map(sin(radians(frameCount)), -1, 1, 1.2, 2.2);
      secondLayer.scale(imgWave);
      secondLayer.image(imgSL, 0, 0);
    secondLayer.pop();

    // Text style
    secondLayer.textFont(sans);
    secondLayer.textAlign(CENTER, CENTER);
    secondLayer.textSize(300);
    secondLayer.fill(#f1f1f1);

    // Display text
    String txt = "Tus comentarios son como los recursos naturales, no valen nada.";
    float textW = secondLayer.textWidth(txt);
    float textWave = -map(tan(radians(frameCount)), -1, 1, -textW / 10, textW / 10);

    secondLayer.push();
      secondLayer.translate(secondLayer.width / 2 + textWave, secondLayer.height / 2);
      secondLayer.text(txt, textWave * 1.1, secondLayer.height / 4);
    secondLayer.pop();

  secondLayer.endDraw();
}
