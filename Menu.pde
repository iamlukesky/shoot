class Menu {
  String title = "ASTEROIDS";
  String suggestion = "Press enter to start!";

  PGraphics target;

  boolean done = false;

  Menu(PGraphics target_) {
    target = target_;
  }

  void run() {
    display();
  }

  void display() {
    target.beginDraw();
    target.background(50);
    target.fill(255);
    target.noStroke();
    target.textSize(50);
    target.text(title, target.width/2-(textWidth(title)/2)*4, target.height/2);
    target.textSize(20);
    target.text(suggestion, target.width/2-(textWidth(suggestion)/2)*1.5, (target.height/2 + 50)-abs(sin(frameCount*0.1))*5);
    target.endDraw();
  }

  void keyD() {
    if (key == ENTER) {
      done = true;
    }
  }
}

