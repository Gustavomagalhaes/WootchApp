class Weather { 
  
  String temperatureUnit;
  String temperatureSuffix;
  int x, y;
  int temperatureF;
  int temperatureC;
  String cityName;
  String countryName;
  Time myTime;

  Weather() {
    myTime = new Time();
    x = width/2;
    y = height/2;
    temperatureUnit = "f";
    temperatureSuffix = "ºF";
  }
  
  void setTemperature(int F, int C) {
    temperatureF = F;
    temperatureC = C;
  }
  
  int getTemperature(String unit) {
    int result = 0;
    if (unit == "f") {
      result = temperatureF;
    } else if (unit == "c") {
      result = temperatureC;
    }
    return result;  
  }
  
  void setPlace(String city, String country) {
    cityName = city;
    countryName = country;
  }
  
  String getPlace() {
    return cityName+", "+countryName;
  }
  

  String getTempUnit() {
    return temperatureUnit; 
  }
  
  String getTempSuffix() {
    return temperatureSuffix;
  }
  
  void setTempType(String type) {
    if (type == "f") {
      temperatureUnit = "f";
      temperatureSuffix = "ºF";
    } else if (type == "c") {
      temperatureUnit = "c";
      temperatureSuffix = "ºC";
    } else { 
      println("Wrong type");
    }
  }

  void display(int temp) {
    strokeWeight(70);
    strokeCap(SQUARE);
    noFill();
    
    stroke(0, 0, 255, 90);
    arc(x, y, 600, 600, PI-(HALF_PI/1.2), PI+(HALF_PI/1.2));
    stroke(255, 0, 0, 90);
    arc(x, y, 600, 600, TWO_PI-(PI), TWO_PI+(HALF_PI/1.2));

    strokeWeight(1);
    
    myTime.setDigitalClock();
    fill(255);
    myFont = createFont("Helvetica-bold", 24);
    textFont(myFont);
    textAlign(CENTER, CENTER);
    text(myTime.getHour()+":"+myTime.getMinute()+":"+myTime.getSecond(), width/2, height-750);  
    myFont = createFont("Helvetica-bold", 18);
    textFont(myFont);
 }
 
 void displayWeather(boolean display, String temperatureUnit) {
   myFont = createFont("Helvetica-bold", 18);
   textFont(myFont);
   text(myWeather.getPlace(), width/2, height-10); 
    
   if (display) {
     myFont = createFont("Helvetica-bold", 60);
     textFont(myFont);
      
     if (myWeather.getTempUnit() == "f") {
       text(temperatureF+myWeather.getTempSuffix(), width/2,height/2);
     } else {
       text(temperatureC+myWeather.getTempSuffix(), width/2,height/2);
     }
     myWeather.display(temperatureF);
    }
    myFont = createFont("Helvetica-bold", 18);
    textFont(myFont);
  }
 
 void check(Weather myWeather, boolean displayTemp) {
  // change temperature representation
  if (displayTemp) {
    if (mouseY < (height/2)+30 && mouseY > (height/2)-30) {
      println("CHANGING THE WEATHER");
      if (mouseX > (width/2)-65 && mouseX < (width/2)+65) {
        if (mousePressed && myWeather.getTempUnit() == "f") {
          myWeather.setTempType("c");
        } else if (mousePressed && myWeather.getTempUnit() == "c") {
          myWeather.setTempType("f");
        }
      }  
    }
  }
 }
}

