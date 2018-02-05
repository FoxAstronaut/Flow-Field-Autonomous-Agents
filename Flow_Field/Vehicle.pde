
class Vehicle{
  PVector position;
  PVector velocity;
  PVector acceleration;
  float r;
  float maxSpeed;
  float maxForce;
  color col;
  
  Vehicle(float x,float y){
    position = new PVector(x,y);;
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    r = 3.0;
    maxSpeed = 10;
    maxForce = 0.2;
    colorMode(HSB,360,100,100);
    col = color(random(360),100,100);
  }
  
  void show(){
    float theta = velocity.heading() + PI/2;
    fill(col);
    noStroke();
    pushMatrix();
    translate(position.x,position.y);
    rotate(theta);
    beginShape();
    vertex(0, -r*2);
    vertex(-r, r*2);
    vertex(r, r*2);
    endShape(CLOSE);
    popMatrix();
  }
  
  void follow(FlowField flow) {
    PVector desired = flow.lookup(position);
    desired.normalize();
    desired.mult(maxSpeed);
    
    PVector steer = PVector.sub(desired,velocity);
    steer.limit(maxForce);
    applyForce(steer);
  }
  
  void update(){
    velocity.add(acceleration);
    velocity.limit(maxSpeed);
    position.add(velocity);
    acceleration.mult(0);
    
    check();
  }
  
  void applyForce(PVector force){
    acceleration.add(force);
  }
  
  void check(){
    if(position.x > width){
      position.x = 0;
    }
    if(position.x < 0){
      position.x = width;
    }
    if(position.y > height){
      position.y = 0;
    }
    if(position.y < 0){
      position.y = height;
    }
  }
}