import toxi.geom.*;
import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;

int cols = 40;
int rows = 40;

Particle[][] particles = new Particle[cols][rows];
ArrayList<Spring> springs;

float w = 10;

VerletPhysics2D physics;

void setup () {
  size(600, 700);
  springs = new ArrayList<Spring>();

  physics = new VerletPhysics2D();
  Vec2D gravity = new Vec2D(0, 1);
  GravityBehavior2D gb = new GravityBehavior2D(gravity);
  physics.addBehavior(gb);

  float x = 100;
  for (int i = 0; i < cols; i++) {
    float y = 10;
    for (int j = 0; j < rows; j++) {
      Particle p = new Particle(x, y);
      particles[i][j] = p;
      physics.addParticle(p);
      y += w;
    }
    x += w;
  }

  for (int i = 0; i < cols - 1; i++) {
    for (int j = 0; j < rows - 1; j++) {
      Particle a = particles[i][j];
      Particle b1 = particles[i + 1][j];
      Particle b2 = particles[i][j + 1];

      // Connecting right
      Spring s1 = new Spring(a, b1);
      springs.add(s1);
      physics.addSpring(s1);

      // Connecting down
      Spring s2 = new Spring(a, b2);
      springs.add(s2);
      physics.addSpring(s2);
    }
  }

  // Locking 2 points
  particles[0][0].lock();
  particles[cols - 1][0].lock();
}

void draw () {
  background(0);

  physics.update();

  //for (int i = 0; i < cols; i++) {
  //  for (int j = 0; j < rows; j++) {
  //    particles[i][j].show();
  //  }
  //}

  for (Spring s : springs) {
    s.show();
  }
}
