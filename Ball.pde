class Ball {
  
  int x;
  int y;
  color c;
  
  PVector pos = new PVector();
  
  int scatter = 30;
  int diameter = 20;
  
  boolean converged = false;
  
  Ball() {
    pos.x = width/2;
    pos.y = height/2;
  }
  
  Ball(int pos_x, int pos_y, color clr) {
    pos.x = pos_x;
    pos.y = pos_y;
    c = clr;
  }
  
  void display() {
    ellipseMode(CENTER);
    strokeWeight(0);
    fill(c);
    ellipse(pos.x, pos.y, diameter, diameter);
  }

  void drift() {
    if(converged) return;
    
    pos.x = pos.x + (int)random(-scatter, scatter);
    pos.y = pos.y + (int)random(-scatter, scatter);
    
    if(pos.x <= 0 || pos.x >= width) pos.x = width / 2;
    if(pos.y <= 0 || pos.y >= height) pos.y = height / 2;
  }
  
  
}
