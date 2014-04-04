class Time { 

  int x = width/2;
  int y = height/2;
  boolean result;
  float dots;
  float dotSize;
  int hour;
  float secondsAtStart;
  float millis;
  PImage Map;
  
  String h;
  String m;
  String s;
  
  int timezone = 0;
  
  Time() {
    secondsAtStart = map(second(),0,60,0,TWO_PI) - HALF_PI;
    Map = loadImage("world_map_scale.png");
  }
  
  void display(boolean display) {
    displayDigitalClock(display);
    if (display) {
      strokeWeight(60);
      strokeCap(SQUARE);
      noFill();
      stroke(255,255,255,90);
      
      arc(x , y, 600, 600, -HALF_PI, -HALF_PI+(0.105*second())); 
      arc(x, y, 450, 450, -HALF_PI, -HALF_PI+(0.105*minute()));
      arc(x, y, 300, 300, -HALF_PI, -HALF_PI+(0.525*getHour(hour())));
      
      displayScale();
      strokeWeight(1);
    }
  }
  
  void displayScale() {
    for (int i = 0; i < 60; i++) {
      dots = -HALF_PI+(0.105*i);
      if (i%5==0) {
        strokeWeight(25);
        dotSize = 0.01;
      } else {
        strokeWeight(10);
        dotSize = 0.009;  
      }
      arc(x, y, 700, 700, dots-dotSize, dots+dotSize);  
    }
  }
  
  boolean getNightTime(int time) {
    if (time >= 6 && time <= 17) { 
      result = false; // Morning sky 
    } else {
      result = true; // Night sky 
    }
    // Returns for test reasons
//    return true;  // night
//    return false; // day
    return result;
  }
  
  int getTimezone() {
    return timezone;
  }
  
  void setTimezone(int tempTimezone) {
    timezone = tempTimezone;
  }
  
  int getHour(int time) {
    if (time >= 12 && time <= 23) { 
      hour = time - 12; 
    } else {
      hour = time; 
    }
    return hour;  
  }
  
  int getHourTZ() {
    int time = hour() + getTimezone();
    if (time >= 12 && time <= 23) { 
      hour = time - 12; 
    } else if (time >= 24) {
      hour = time - 24;
    } else if (time < 0) {
      hour = time + 12;
    } else {
      hour = time; 
    }
    return hour;  
  }
  void displayMap(boolean result) {
    if (result) {
      image(Map, 0, 35);
      fill(0);
      myFont = createFont("Helvetica-bold", 90);
      textFont(myFont);
      textAlign(CENTER, CENTER);
      text(getHourTZ()+":"+getMinute()+":"+getSecond(), width/2, height-650);  
      myFont = createFont("Helvetica-bold", 18);
      textFont(myFont);
    }
  }
  
  void setHour(String tempHour) {
    h = tempHour;
  }
  
  String getHour() {
    return h;
  }
  
  void setMinute(String tempMin) {
    m = tempMin;
  }
  
  String getMinute() {
    return m;
  }
  
  void setSecond(String tempSec) {
    s = tempSec;
  }
  
  String getSecond() {
    return s;
  }
  
  void setDigitalClock() {
    String hour;
    String minute;
    String second;
    
    hour = nf(hour(),2);
    minute = nf(minute(),2);
    second = nf(second(),2);
    
    setHour(hour);
    setMinute(minute);
    setSecond(second);
  }
  
  void displayDigitalClock(boolean display) {
    setDigitalClock();
    fill(255);
    myFont = createFont("Helvetica-bold", 40);
    textFont(myFont);
    textAlign(CENTER, CENTER);
    if (display) {
      text(getHour()+":"+getMinute()+":"+getSecond(), x, y);  
    }
  }
}
