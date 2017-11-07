class Obstacle {
  float x, y;
  float w, h;
  float sy; // y speed
  
  Obstacle(float x, float y) {
    this.x = x;
    this.y = y;
    w = obstacle_width;
    h = 10;
    
    sy = -1;
  }
  
  void update() {
    y += sy;
  }
  
  void show() {
    noStroke();
    fill(255);
    rect(x, y, w, h);
  }
}