class CollisionHandler extends Handler {
  CollisionHandler() {
  }

  boolean checkCollision(ShotHandler shothandler, StoneHandler stonehandler) {
    for (int shots = 0; shots < shothandler.shots.size (); shots++) {
      Shot shot = shothandler.shots.get(shots);
      for (int stones = 0; stones <  stonehandler.stones.size (); stones++) {
        Stone stone = stonehandler.stones.get(stones);
        float distance = PVector.dist(shot.location, stone.location);
        if (distance < stone.size/2) {
          stone.isAlive = false;
          shot.isAlive = false;
          return true;
        }
      }
    }
    return false;
  }

  boolean checkCollision(Player player, StoneHandler stonehandler) {
    for (int stones = 0; stones < stonehandler.stones.size (); stones++) {
      Stone stone = stonehandler.stones.get(stones);
      float distance = PVector.dist(stone.location, player.location);
      if (distance < stone.size/2) {
        player.isAlive = false;
        return true;
      }
    }
    return false;
  }
}

