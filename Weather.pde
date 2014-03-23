class Weather { 
  
  Time myTime;
  int x = width/2;
  int y = height/2;

  Weather() {
    myTime = new Time();
  }


  void display(int temp) {
    strokeWeight(70);
    strokeCap(SQUARE);
    noFill();
    stroke(255, 0, 0, 90);
     
    // ºF 
    arc(x, y, 600, 600, PI-(HALF_PI/1.2), PI+(HALF_PI/1.2));
    
    // ºC
    stroke(0, 0, 255, 90);
    arc(x, y, 600, 600, TWO_PI-(HALF_PI/1.2), TWO_PI+(HALF_PI/1.2));

    strokeWeight(1);
    
    myTime.setDigitalClock();
    fill(255);
    myFont = createFont("Helvetica-bold", 30);
    textFont(myFont);
    textAlign(CENTER, CENTER);
    text(myTime.getHour()+":"+myTime.getMinute()+":"+myTime.getSecond(), width/2, height-745);  
    myFont = createFont("Helvetica-bold", 18);
    textFont(myFont);
  }
  
}

