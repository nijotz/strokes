class Grid {
  PImage img;
  int num_x, num_y;
  int cell_width = 10, cell_height = 10;
  color[][] colors;
  
  Grid(PImage image) {
    img = image;
    img.loadPixels();
    num_x = image.width / cell_width;
    num_y = image.height / cell_height;
    colors = new color[num_x][num_y];
    setAverageColors();
  }
  
  void setAverageColors() {
    for (int x = 0; x < num_x; x++) {
      for (int y = 0; y < num_y; y++) {
        colors[x][y] = getAverageColor(x, y);
      }
    }
  }
  
  color getAverageColor(int x, int y) {
    int start_x = x * cell_width;
    int start_y = y * cell_height;
    int end_x = (x + 1) * cell_width;
    int end_y = (y + 1) * cell_height;
    int r = 0, g = 0, b = 0;
    int total = (end_x - start_x) * (end_y - start_y);
    
    for (int i = start_x; i < end_x; i++) {
      for (int j = start_y; j < end_y; j++) {
        int loc = i + j * img.width;
        r += red(img.pixels[loc]);
        g += green(img.pixels[loc]);
        b += blue(img.pixels[loc]);
      }
    }
    
    r /= total;
    g /= total;
    b /= total;
    
    return color(r, g, b);
  }
  
  void drawGrid() {
    for (int x = 0; x < num_x; x++) {
      int pos = x * cell_width;
      line(pos, 0, pos, height);
    }
    
    for (int y = 0; y < num_y; y++) {
      int pos = y * cell_height;
      line(0, pos, width, pos);
    }
  }
  
  void drawColors() {
    for (int x = 0; x < num_x; x++) {
      for (int y = 0; y < num_y; y++) {
        fill(colors[x][y]);
        noStroke();
        rect(
          x * cell_width,
          y * cell_width,
          (x + 1) * cell_width,
          (y + 1) * cell_height
         );
      }
    }
  }
}
