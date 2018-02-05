
ArrayList<Vehicle> vehicles;
FlowField f;
int VEHICHLE_LIMIT = 400;

void setup(){
  fullScreen();
  vehicles = new ArrayList<Vehicle>();
  f = new FlowField(20);
}

void draw(){
  background(0);
  
  for(int i = vehicles.size()-1; i > 0; i--){
    Vehicle v = vehicles.get(i);
    v.follow(f);
    v.update();
    v.show();
  }

  while(vehicles.size() > VEHICHLE_LIMIT){
    vehicles.remove(0);
  }
}

void mouseDragged(){
  Vehicle v = new Vehicle(mouseX,mouseY);
  vehicles.add(v);
}