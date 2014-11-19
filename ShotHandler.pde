class ShotHandler extends Handler {
  ArrayList<Shot> shots;
  PGraphics target;

  ShotHandler(PGraphics target) {
    this.target = target;
    shots = new ArrayList<Shot>();
  }

  void update() {
    for (int i = 0; i < shots.size (); i++) {
      Shot s = shots.get(i);
      s.update();
      if (!s.isAlive) {
        shots.remove(i);
      }
    }
  }

  void display() {
    for (int i = 0; i < shots.size (); i++) {
      Shot s = shots.get(i);
      s.display();
    }
  }

  void shoot() {
    if (shots.size() < 3) {
      shots.add(new Shot(game.p.angle, game.p.location, target));
      game.s.shotSound();
    }
    println(shots.size());
  }
}

