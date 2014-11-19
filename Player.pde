class Player {
  boolean up = false;
  boolean down = false;
  boolean left = false;
  boolean right = false;
  boolean shoot = false;
  boolean thrusting = false;
  PGraphics target;
  
  boolean isAlive;

  float angle;
  float angleVel;
  float angleAcc;

  PVector location;
  PVector speed;
  PVector acceleration;

  Player(PVector location_, PGraphics target_) {
    location = location_;
    speed = new PVector();
    acceleration = new PVector();
    angle = 0;
    angleVel = 0.1;
    target = target_;
    isAlive = true;
  }

  void display() {
    target.beginDraw();
    target.noStroke();
    target.pushMatrix();
    target.translate(location.x, location.y);
    target.rotate(angle);
    target.fill(255);
    target.triangle(-10, -5, -10, 5, 10, 0);
    //rectMode(CENTER);
    if (thrusting) {
      target.fill(200, 0, 0);
      for (int i = 0; i < 5; i++) {
        target.pushMatrix();
        target.translate(-10, random(-2, 2));
        target.triangle(0, -2, 0, 2, random(-10, -5), 0);
        target.popMatrix();
      }
      game.s.thrustSound();
    }
    target.popMatrix();
    target.endDraw();
  }

  void update() {    
    if (up) {
      acceleration = new PVector(cos(angle)*0.08, sin(angle)*0.08);
      thrusting = true;
    }
    if (down) {
    }
    if (left) {
      angle += -angleVel;
    }
    if (right) {
      angle += angleVel;
    }
    if (shoot) {
      game.shothandler.shoot();
      shoot = false;
    }

    speed.add(acceleration);
    speed.limit(5);
    location.add(speed);
    acceleration.mult(0);

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

  void keyD() {
    if (key == CODED) {
      if (keyCode == LEFT) {
        left = true;
      }
      if (keyCode == RIGHT) {
        right = true;
      }
      if (keyCode == UP) {
        up = true;
      }
    }
    if (key == ' ') {
      shoot = true;
    }
  }

  void keyU() {
    if (key == CODED) {
      if (keyCode == LEFT) {
        left = false;
      }
      if (keyCode == RIGHT) {
        right = false;
      }
      if (keyCode == UP) {
        up = false;
        thrusting = false;
      }
    }
  }
}

