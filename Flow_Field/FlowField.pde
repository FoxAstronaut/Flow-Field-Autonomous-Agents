
class FlowField{
  PVector[][] field;
  
  int cols, rows;
  int resolution;
  
  FlowField(int r){
    resolution = r;
    
    cols = width/resolution;
    rows = height/resolution;
    
    field = new PVector[cols][rows];
    init();
  }
  
  void init(){
    for(int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        float theta = random(-PI/4,PI/4);//Some angle
        field[i][j] = PVector.fromAngle(theta);
      }
    }
  }
  
  void show(){
    for(int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        drawVector(field[i][j],i*resolution,j*resolution,resolution-2);
      }
    }
  }
  
  PVector lookup(PVector lookup) {
    int column = int(constrain(lookup.x/resolution,0,cols-1));
    int row = int(constrain(lookup.y/resolution,0,rows-1));
    return field[column][row].copy();
  }
  
  void drawVector(PVector v, float x, float y, float scayl){
    pushMatrix();
    float arrowSize = 4;
    translate(x,y);
    stroke(100,100);
    rotate(v.heading());
    float len = v.mag()*scayl;
    line(0,0,len,0);
    line(len,0,len-arrowSize,+arrowSize/2);
    line(len,0,len-arrowSize,-arrowSize/2);
    popMatrix();
  }
}