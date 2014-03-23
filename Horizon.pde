class Horizon {
  
  Time myTime;
  float skyAlpha;

  Horizon() {
    myTime = new Time();
    skyAlpha = 0;
  }

  void display() {
    
    if (myTime.getNightTime(hour())) { // Night sky
      for (int row = 0; row < height; row++) {
        stroke(0, 0, 100, skyAlpha); 
        noFill();
        line(0, row, width, row);
        skyAlpha += 0.2;
      }
      skyAlpha = 0;
    } else { // Day sky
      for (int row = 0; row < height; row++) {
          stroke(0, 0, 0, 20); 
          noFill();
          line(0, row, width, row);
      }
    }
  }
}
