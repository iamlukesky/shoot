class Intro {
  float x = -50;
  float targetX;

  String s = "ASTEROIDS";

  boolean done = false;

  PGraphics target;

  Intro(PGraphics target_) {
    target = target_;
    targetX = target.width/2;
  }

  void run() {
    display();
  }

  void display() {
    target.beginDraw();
    target.background(0);

    if (frameCount > 10) {
      target.fill(255);
      target. noStroke();
      target. textSize(50);
      target. text(s, x-(textWidth(s)/2)*4, target.height/2);
      x += (targetX-x)*0.1;
      if (x > targetX-0.1) {
        targetX = target.width+textWidth(s)*4;
        if (x > target.width) {
          done = true;
        }
      }
    }
    target.endDraw();
  }
}

