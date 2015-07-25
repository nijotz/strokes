PImage img;
ParticleSystem particles;
Grid grid;

void setup() {
  img = loadImage("image.jpg");
  size(img.width, img.height);
  grid = new Grid(img);
  particles = new ParticleSystem(grid);
}

void draw() {
  //image(img, 0, 0);
  //grid.drawGrid();
  //grid.drawColors();
  particles.update();
  particles.draw();
}

