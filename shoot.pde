//ljudmodul
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Game game;

void setup() {
  noCursor();
  size(displayWidth, displayHeight);
  game = new Game();
  noSmooth();
}

void draw() {
  game.run();
}

void keyPressed() {
  if (game.STATE == game.GAME) {
    game.p.keyD();
    if(key == 'r'){
     game.reset(); 
    }
  }
  if (game.STATE == game.MENU){
    game.menu.keyD(); 
  }
}

void keyReleased() {
  if (game.STATE == game.GAME) {
    game.p.keyU();
  }
}

