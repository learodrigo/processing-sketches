ArrayList<Agent> agents;
int sw = 2;

void setup () {
  size(900, 900);
  background(0);
  
  agents = new ArrayList<Agent>();
  agents.add(new Agent(true, width / 2, height / 2, sw));

  for (int i = 1; i < 3; i++) {
    agents.add(new Agent(false, random(50, width - 50), height / 2, sw));
  }
}

void draw () {
  background(0);

  for (Agent a : agents) {
    a.run();
  }
}
