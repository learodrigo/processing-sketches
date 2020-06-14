import toxi.geom.*;
import toxi.physics3d.*;
import toxi.physics3d.behaviors.*;

int cols = 40;
int rows = 40;

float a = 0;

Particle[][] particles = new Particle[cols][rows];
ArrayList<Spring> springs;

float w = 10;

VerletPhysics3D physics;

void setup () {
  size(1080, 720, P3D);

  springs = new ArrayList<Spring>();

  physics = new VerletPhysics3D();
  Vec3D gravity = new Vec3D(0, 1, 0);
  GravityBehavior3D gb = new GravityBehavior3D(gravity);
  physics.addBehavior(gb);

  float x = -cols * w / 2;
  for (int i = 0; i < cols; i++) {
    float z = 0;
    for (int j = 0; j < rows; j++) {
      Particle p = new Particle(x, -300, z);
      particles[i][j] = p;
      physics.addParticle(p);
      z += w;
    }
    x += w;
  }

  for (int i = 0; i < cols - 1; i++) {
    for (int j = 0; j < rows - 1; j++) {
      Particle a = particles[i][j];
      if (i != cols-1) {
        Particle b1 = particles[i+1][j];
        Spring s1 = new Spring(a, b1);
        springs.add(s1);
        physics.addSpring(s1);
      }
      if (j != rows-1) {
        Particle b2 = particles[i][j+1];
        Spring s2 = new Spring(a, b2);
        springs.add(s2);
        physics.addSpring(s2);
      }
    }
  }

  // Locking 2 points
  particles[0][0].lock();
  particles[cols - 1][0].lock();
  //particles[0][rows - 1].lock();
  //particles[cols - 1][rows - 2].lock();
}

void draw () {
  background(0);
  translate(width / 2, height / 2, -150);
  rotateY(a);
  a += 0.01;

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
