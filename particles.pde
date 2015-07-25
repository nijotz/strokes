class Particle {
  float x;
  float y;
  PVector vector;
  color colour;  //heh
  float life;
  
  Particle(int x, int y, PVector vector, color colour) {
    this.x = x;
    this.y = y;
    this.vector = vector;
    this.colour = colour;    
    this.life = random(40,70);
  }
  
  boolean dead() {
    return life <= 0;
  }
  
  void update() {
    x += vector.x;
    y += vector.y;
    life--;
  }
  
  void draw() {
    fill(colour);
    noStroke();
    ellipse(x, y, 5, 5);
  }
}

class ParticleSystem {
  ArrayList<Particle> particles;
  Grid grid;
  
  ParticleSystem(Grid grid) {
    particles = new ArrayList<Particle>();
    this.grid = grid;
  }
  
  void update() {
    while(particles.size() < 2000) {
      addRandomParticle();
    }
    removeDeadParticles();
    
    for (Particle particle : particles) {
      particle.update();
    }
  }
  
  void draw() {
    for (Particle particle : particles) {
      particle.draw();
    }
  }
  
  void addRandomParticle() {
    int x = int(random(grid.num_x));
    int y = int(random(grid.num_y));
    color c = grid.colors[x][y];
    float rand_x = random(0, 0.5);
    float rand_y = random(0, 0.5);
    PVector v = new PVector(rand_x, rand_y);
        
    x *= grid.cell_width;
    y *= grid.cell_height;
    
    particles.add(new Particle(x, y, v, c));
  }
  
  void removeDeadParticles() {
    Particle particle;
    for (int i = 0; i < particles.size(); i++) {
      particle = particles.get(i);
      if (particle.dead()) {
        particles.remove(i);
      }
    }
  }
}
