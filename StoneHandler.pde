class StoneHandler extends Handler {
  PGraphics target;
  ArrayList<Stone> stones;
  int level;

  StoneHandler(int level, PGraphics target) {
    this.target = target;
    this.level = level;
    stones = new ArrayList<Stone>();
    for (int i = 0; i < level; i++) {
      stones.add(new Stone(20, target, new PVector(random(target.width), random(target.height)), random(TWO_PI)));
    }
  }

  void update() {    
    for (int i = 0; i < stones.size (); i++) {
      Stone s = stones.get(i);
      s.update();
      if (!s.isAlive) {

        println(stones.size());
        if (s.size > 5) {
          for (int j = -1; j < 2; j+= 2) {
            addStone(int(s.size/2), s.location, s.angle+(PI/8)*-j);
          }
        }
        stones.remove(i);
      }
    }
  }

  void display() {
    for (int i = 0; i < stones.size (); i++) {
      Stone s = stones.get(i);
      s.display();
    }
  }

  void addStone(int size, PVector location, float angle) {
    stones.add(new Stone(size, target, location, angle));
  }
}

