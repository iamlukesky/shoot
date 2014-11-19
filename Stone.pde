class Stone {

  PVector location;
  PVector speed;
  float vel;
  float size;
  boolean isAlive;
  float angle;

  PGraphics target;

  Stone(int size_, PGraphics target_, PVector location_, float angle) {
    isAlive = true;
    size = size_;
    vel = random(1);
    target = target_;
    location = location_.get();
    this.angle = angle;
    speed = new PVector(cos(angle)*vel, sin(angle)*vel);
  }

  void display() {
    target.beginDraw();
    target.translate(location.x, location.y);
    target.rotate(location.x/10);
    target.fill(255);
    target.rectMode(CENTER);
    target.rect(0, 0, size, size);    
    target.endDraw();
  }

  void update() {
    location.add(speed);
    checkEdges();
  }

  void checkEdges() {
    if (location.x < -10) {
      location.x = target.width+10;
    }
    if (location.x > target.width+10) {
      location.x = -10;
    }
    if (location.y < -10) {
      location.y = target.height+10;
    }
    if (location.y > target.height+10) {
      location.y = -10;
    }
  }
}

