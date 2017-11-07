Player player;
Obstacle[] obstacles;

boolean keys[] = new boolean[2];
float obstacle_width = 150;
int num_obstacles = 500 / 125;

void reset() {
  player = new Player();
  obstacles = new Obstacle[num_obstacles];
  obstacles[0] = new Conveyor(width/2 - obstacle_width/2, 125);
  for(int i = 1; i < obstacles.length; i++) {
    obstacles[i] = generate((i + 1) * 125);
  }
}

Obstacle generate(float y) {
  float seed = random(1);
  if(seed >= 0 && seed < 0.3) {
    return new Obstacle(random(width - obstacle_width), y);
  } else if(seed >= 0.3 && seed < 0.4) {
    return new Sand(random(width - obstacle_width), y);
  } else if(seed >= 0.4 && seed < 0.6) {
    return new Spring(random(width - obstacle_width), y);
  } else if(seed >= 0.6 && seed < 0.7) {
    return new Trap(random(width - obstacle_width), y);
  } else {
    return new Conveyor(random(width - obstacle_width), y);
  }
}

void setup() {
  size(400,500);
  reset();
}

void draw() {
  background(0);
  //-----Score-----
  String score = "";
  if(player.score < 10) {
    score += "0" + player.score;
  } else {
    score += player.score;
  }
  fill(25);
  textSize(310);
  text(score, 0, height-130);
  //-----Update-----
  player.update();
  player.show();
  
  boolean flag = false;
  for(int i = 0; i < obstacles.length; i++) {
    obstacles[i].update();
    obstacles[i].show();
    
    if(obstacles[i].y <= 0) {
      obstacles[i] = generate(500);
      player.updateScore(1);
    }
    
    if(player.collide(obstacles[i])) {
      player.attach(obstacles[i]);
      player.y = obstacles[i].y - player.w;
      flag = true;
    }
  }
  if(!flag) { // reset player.attached if it is not colliding any obstacle
    player.attach(null);
  }
  
  if(player.y <= 0) {
    player.updateScore(-5);
  }
  if(player.y >= height) {
    reset();
  }
  //-----Debug-----
  //println(player.score);
  //println("X speed: "+player.sx+", Y speed: "+player.sy+", Y acc: "+player.ay);
}

void keyReleased() {
  if(keyCode == LEFT) {
    keys[0] = false;
  }
  if(keyCode == RIGHT) {
    keys[1] = false;
  }
}

void keyPressed() {
  if(keyCode == LEFT) {
    keys[0] = true;
  }
  if(keyCode == RIGHT) {
    keys[1] = true;
  }
}