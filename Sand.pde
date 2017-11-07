class Sand extends Obstacle {
  color c = color(75);
  int touchTime;
  boolean firstTouch = true;
  
  Sand(float x, float y) {
    super(x, y);
  }
  
  @Override
  void update() {
    y += sy;
    
    if(player.collide(this)) {
      if(firstTouch) {
        touchTime = millis();
        firstTouch = false;
      }
      if(millis() > touchTime + 100) {
        c = color(255,255,255,0);
        player.y++;
        player.sx = 0;
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