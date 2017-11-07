class Trap extends Obstacle {
  color c = color(255,0,0);
  float jump_height = 8;
  boolean firstTouch = true;
  
  Trap(float x, float y) {
    super(x, y);
  }
  
  @Override
  void update() {
    y += sy;
    
    if(player.collide(this) && firstTouch) {
      player.updateScore(-5);
      firstTouch = false;
    }
  }
  
  @Override
  void show() {
    noStroke();
    fill(c);
    rect(x, y, w, h);
  }
}