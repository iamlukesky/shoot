class Shot{
 float SPEED = 4;
 PVector speed;
 PVector location;
 boolean isAlive = true;
 int lifespan = 50;
 PGraphics target;
  
 Shot(float angle, PVector location_, PGraphics target_){
  speed = new PVector(cos(angle)*SPEED, sin(angle)*SPEED);
  location = location_.get();
  target = target_;
 } 
 
 void display(){
   target.beginDraw();
   target.pushMatrix();
   target.translate(location.x, location.y);
   target.rotate(speed.heading());
   target.fill(255);
   target.rectMode(CENTER);
   target.rect(0, 0, 5, 1);
   target.popMatrix();
   target.endDraw();
 }
 
 void update(){
   location.add(speed);
   checkEdges();
   lifespan--;
   if(lifespan < 0){
     isAlive = false;
   }
 }
 
 void checkEdges(){
    if(location.x < 0){
     location.x = target.width; 
    }
    if(location.x > target.width){
      location.x = 0;
    }
    if(location.y < 0){
      location.y = target.height;
    }
    if(location.y > target.height){
     location.y = 0; 
    }
  }
 /*
 void checkEdges(){
   if(location.x < 0 || location.x > width){
     alive = false;
   }
   if(location.y < 0 || location.y > height){
     alive = false;
   }
 }
 */
}
