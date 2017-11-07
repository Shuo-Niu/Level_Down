class Spring extends Obstacle {
  color c = color(255,255,0);
  float jump_height = 8;
  
  Spring(float x, float y) {
    super(x, y);
  }
  
  @Override
  void update() {
    y += sy;
    
    if(player.collide(this)) {
      player.sy = -jump_height;
    }
  }
  
  @Override
  void show() {
    noStroke();
    fill(c);
    rect(x, y, w, h);
  }
}