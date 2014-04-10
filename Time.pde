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
    Map = loadImage("images/world_map_scale.png");
  }
  
  void display(boolean display) {
    // Display all the visual of the clock screen
    displayDigitalClock(display);
    if (display) {
      strokeWeight(60);
      strokeCap(SQUARE);
      noFill();
      stroke(255,255,255,90);
      float beginning = -HALF_PI;
      
      arc(x , y, 600, 600, beginning, beginning+radians(6*second()));
      arc(x, y, 450, 450, beginning, beginning+radians(6*minute()));
      arc(x, y, 300, 300, beginning, beginning+radians(30*getHour(hour())));
      
      displayScale();
      strokeWeight(1);
    }
  }
  
  void displayScale() {
    // Display the time scale around the clock
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
    // return a boolean saying if it's night or not
    if (time >= 6 && time <= 17) { 
      result = false; 
    } else {
      result = true; 
    }
    return result;
  }
  
  int getTimezone() {
    return timezone;
  }
  
  void setTimezone(int tempTimezone) {
    timezone = tempTimezone;
  }
  
  int getHour(int time) {
    if (time >= 13 && time <= 23) { 
      hour = time - 12; 
    } else {
      hour = time; 
    }
    return hour;  
  }
  
  String getHourTZ() {
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
    return nf(hour,2);  
  }
  void displayMap(boolean result) {
    // Display the map and the digital time in the time zone screen 
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
    // set the time at the variables as Strings with two numbers
    setHour(nf(hour(),2));
    setMinute(nf(minute(),2));
    setSecond(nf(second(),2));
  }
  
  void check(Time myTime, boolean displayMap) {
    // Check and change the timezone according to the mouse position
    fill(50,0,255,40);
    int top = 236;
    int bottom = 472;
    if (displayMap) {
      if (mouseY >= 236 && mouseY <= 710) {
        if (mouseX >= 3 && mouseX <= 35) {
          rect(3,top,35,bottom);
          myTime.setTimezone(-5);
        } else if (mouseX >= 36 && mouseX <= 68) {
          rect(36,top,35,bottom);
          myTime.setTimezone(-4);
        } else if (mouseX >= 69 && mouseX <= 101) {
          rect(69,top,35,bottom);
          myTime.setTimezone(-3);          
        } else if (mouseX >= 102 && mouseX <= 134) {
          rect(102,top,35,bottom);
          myTime.setTimezone(-2);          
        } else if (mouseX >= 135 && mouseX <= 167) {
          rect(135,top,35,bottom);
          myTime.setTimezone(-1);          
        } else if (mouseX >= 168 && mouseX <= 200) {
          rect(168,top,35,bottom);
          myTime.setTimezone(0);          
        } else if (mouseX >= 201 && mouseX <= 233) {
          rect(201,top,35,bottom);
          myTime.setTimezone(1);          
        } else if (mouseX >= 234 && mouseX <= 266) {
          rect(234,top,35,bottom);
          myTime.setTimezone(2);          
        } else if (mouseX >= 267 && mouseX <= 299) {
          rect(267,top,35,bottom);
          myTime.setTimezone(3);          
        } else if (mouseX >= 300 && mouseX <= 332) {
          rect(300,top,35,bottom);
          myTime.setTimezone(4);          
        } else if (mouseX >= 333 && mouseX <= 365) {
          rect(333,top,35,bottom);
          myTime.setTimezone(5);          
        } else if (mouseX >= 366 && mouseX <= 398) {
          rect(366,top,35,bottom);
          myTime.setTimezone(6);          
        } else if (mouseX >= 399 && mouseX <= 431) {
          rect(399,top,35,bottom);
          myTime.setTimezone(7);          
        } else if (mouseX >= 432 && mouseX <= 464) {
          rect(432,top,35,bottom);
          myTime.setTimezone(8);          
        } else if (mouseX >= 465 && mouseX <= 497) {
          rect(465,top,35,bottom);
          myTime.setTimezone(9);          
        } else if (mouseX >= 498 && mouseX <= 530) {
          rect(498,top,35,bottom);
          myTime.setTimezone(10);          
        } else if (mouseX >= 531 && mouseX <= 563) {
          rect(531,top,35,bottom);
          myTime.setTimezone(11);          
        } else if (mouseX >= 564 && mouseX <= 596) {
          rect(564,top,35,bottom);
          myTime.setTimezone(12);          
        } else if (mouseX >= 597 && mouseX <= 629) {
          rect(597,top,35,bottom);
          myTime.setTimezone(13);          
        } else if (mouseX >= 630 && mouseX <= 662) {
          rect(630,top,35,bottom);
          myTime.setTimezone(14);          
        } else if (mouseX >= 663 && mouseX <= 695) {
          rect(663,top,35,bottom);
          myTime.setTimezone(15);          
        } else if (mouseX >= 696 && mouseX <= 728) {
          rect(696,top,35,bottom);
          myTime.setTimezone(16);          
        } else if (mouseX >= 729 && mouseX <= 761) {
          rect(729,top,35,bottom);
          myTime.setTimezone(17);          
        } else if (mouseX >= 762 && mouseX <= 794) {
          rect(762,top,35,bottom);
          myTime.setTimezone(18);          
        }

      } else {
        myTime.setTimezone(0);  
      }
    }
  }

  void displayDigitalClock(boolean display) {
    // Display digital clock at the center of the screen
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
