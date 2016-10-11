
class Star {
 
  PVector loc;
  PVector vel;
  PVector acc;
  float speed;
 
  Star() {
    loc = new PVector(random(0, width), random(0, height));
    vel = new PVector(0, 0);
    speed = s;
  }
 
  void update() {
 
    PVector mouse = new PVector(mouseX, mouseY);
    PVector dir = PVector.sub(mouse, loc); 
    dir.normalize();                       
    dir.mult(0.1);                        
    acc = dir;                             
 
    vel.add(acc);
    vel.limit(speed);
    loc.add(vel);
  }
   
  void edges() {
 
    if (loc.x > width) {
      loc.x = 0;
    } else if (loc.x < 0) {
      loc.x = width;
    }
 
    if (loc.y > height) {
      loc.y = 0;
    }  else if (loc.y < 0) {
      loc.y = height;
    }
 
  }
 
  void display() {
   //fill(0);
   //stroke(random(256),random(256),random(256));
   //fill(255);
   fill(random(256),random(256),random(256));
   noStroke();
   float r = random(2,4);
    ellipse(loc.x, loc.y, r,r);
   //point(loc.x, loc.y);
  }
}