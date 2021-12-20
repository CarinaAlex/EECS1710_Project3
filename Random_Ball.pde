class Random_Ball extends Ball{
  
  int max_color_time = 50; 
  int time = 0;
  
  Random_Ball() {
    pos.x = (int)random(width);
    pos.y = (int)random(height);
    c = color(random(255), random(255), random(255));
  }
  
  void converged(){
    converged = true;
  }
  
  void count_time(){
    time++;
    if(time >= max_color_time) reset();
  }
  
  void reset(){
    time = 0;
    c = color(random(255), random(255), random(255));
  }
  
}
