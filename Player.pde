class Player {
  float x, y;
  float w;
  float sx; // x speed
  float sy; // y speed
  float ay; // y acceleration
  color c;
  Obstacle attached;
  int score;
  
  Player() {
    x = width / 2;
    y = 0;
    w = 10;
    c = color(255, 100, 0);
    ay = 0.5;
    sy = ay;
    sx = 0;
    attached = null;
    score = 0;
  }
  
  void update() {
    if(keys[0] && !keys[1]) {
      move(-1);
    } else if(!keys[0] && keys[1]) {
      move(1);
    } else {
      move(0);
    }
    x += sx;
    
    if(attached != null) {
      y += attached.sy;
    } else {
      y += sy;
      sy += ay;
    }
    
    x = constrain(x, 0, width - w);
    y = constrain(y, 0, height);
  }
  
  void show() {
    noStroke();
    fill(c);
    rect(x, y, w, w);
  }
  
  boolean collide(Obstacle obs) {
    return ((y + w == obs.y) || (y + w < obs.y && y + w + sy > obs.y + obs.sy))
           &&
           !((x + w <= obs.x) || (x >= obs.x + obs.w));
  }
  
  void attach(Obstacle obs) {
    attached = obs;
    if(obs != null) {
      sy = 0;
    }
  }
  
  void move(float dir) {
    sx = dir * 5;
  }
  
  void updateScore(int num) {
    score += num;
    if(score < 0) score = 0;
  }
}