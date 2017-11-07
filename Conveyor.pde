class Conveyor extends Obstacle {
  color c;
  float jump_height = 8;
  boolean toLeft;
  
  Conveyor(float x, float y) {
    super(x, y);
    if(random(1) < 0.5) {
      toLeft = true;
      c = color(0,0,255);
    } else {
      toLeft = false;
      c = color(0,255,0);
    }
  }
  
  @Override
  void update() {
    y += sy;
    
    if(player.collide(this)) {
      if(toLeft) {
        player.x -= 3;
      } else {
        player.x += 3;
      }
    }
  }
  
  @Override
  void show() {
    noStroke();
    fill(c);
    rect(x, y, w, h);
  }
}