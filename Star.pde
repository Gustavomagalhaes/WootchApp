class Star { 

  float x, y, w;
  
  Star() {
    x = random(width);
    y = random(height);
    w = random(1,2.5);
  }
  
  void display() {
    fill(255);
    noStroke();
    ellipse(x,y,w,w); 
  }
}
