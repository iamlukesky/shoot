class Game {
  PGraphics surface;
  Player p;
  Sound s;
  ShotHandler shothandler;
  StoneHandler stonehandler;

  CollisionHandler collisionhandler;

  int STATE;
  int INTRO = 0;
  int MENU = 1;
  int GAME = 2;

  int level = 1;
  int levelPresentCounter = 100;
  int levelPresentCounterMax = levelPresentCounter;
  int waitForLevelChange;

  Intro intro;
  Menu menu;

  Game() {
    surface = createGraphics(320, 180);

    surface.beginDraw();
    surface.noSmooth();
    surface.endDraw();
    s = new Sound();
    intro = new Intro(surface);
    menu = new Menu(surface);
    collisionhandler = new CollisionHandler();

    reset();

    STATE = INTRO;
  } 

  void run() {
    switch(STATE) {
    case 0:
      intro.run();
      if (intro.done) STATE = MENU;
      break;

    case 1:
      menu.run();
      if (menu.done) STATE = GAME;
      break;

    case 2:
      surface.beginDraw();
      surface.background(0);
      surface.endDraw();

      if (p.isAlive) {
        p.update();
        collisionhandler.checkCollision(shothandler, stonehandler);
        collisionhandler.checkCollision(p, stonehandler);
        stonehandler.update();
        shothandler.update();

        presentLevel();
        levelPresentCounter--;
        p.display();
        stonehandler.display();
        shothandler.display();

        if (stonehandler.stones.size() <= 0) {
          waitForLevelChange--;
          if (waitForLevelChange <= 0) {
            level++;
            reset();
          }
        }
      } else {
        surface.beginDraw();
        surface.textSize(50);
        surface.fill(255);
        surface.text("GAME OVER", surface.width * 1/16, surface.height/2);
        surface.endDraw();
      }

      break;
    }
    image(surface, 0, 0, width, height);
  }

  void reset() {
    waitForLevelChange = 100;
    levelPresentCounter = 100;
    shothandler = new ShotHandler(surface);
    stonehandler = new StoneHandler(level, surface);
    p = new Player(new PVector(surface.width/2, surface.height/2), surface);
  }

  void presentLevel() {
    if (levelPresentCounter > 0) {
      surface.textSize(50);
      surface.fill(255, map(levelPresentCounter, 0, levelPresentCounterMax, 0, 255));
      surface.text("LEVEL "+level+"!", surface.width * 1/4, surface.height/2);
    }
  }
}

