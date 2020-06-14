import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

// Rectangles
ArrayList<Box> boxes;

Box2DProcessing box2d;

void setup () {
  size(800, 800);

  // To create the world
  box2d = new Box2DProcessing(this);
  box2d.createWorld();

  boxes = new ArrayList<Box>();
}

void draw () {
  background(0);

  // Step to next moment in time
  box2d.step();

  // Addind boxes
  if (mousePressed) {
    boxes.add(new Box(mouseX, mouseY));
  }

  // Drawing
  for (Box b : boxes) {
    b.show();
  }
}
