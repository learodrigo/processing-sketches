class Box {

  // Local variables
  Body body;
  float x, y, w, h;

  Box (float _x, float _y) {
    x = _x;
    y = _y;
    w = random(16, 32);
    h = random(16, 32);

    // Step 1: Definition Body
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(x,y));

    // Step 2: Create Body
    body = box2d.createBody(bd);

    // Step 3: Create Shape
    PolygonShape ps = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w/2);
    float box2dH = box2d.scalarPixelsToWorld(h/2);
    ps.setAsBox(box2dW, box2dH);

    // Step 4: Create Fixture
    FixtureDef fd = new FixtureDef();
    fd.shape = ps;
    // params
    fd.density = 1;
    fd.friction = 0.3;
    fd.restitution = 0.5;

    // Step 5: Attach Fixture to Body               
    body.createFixture(fd);
  }

  void show () {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();

    pushMatrix();
      translate(pos.x, pos.y);
      rotate(-a);
      fill(255, random(150, 255));
      rectMode(CENTER);
      noStroke();
      rect(0, 0, w, h);
    popMatrix();
  }
}
