class Weather { 
  
  String temperatureUnit;
  String temperatureSuffix;
  int x, y;
  int temperatureF;
  int temperatureC;
  String cityName;
  String countryName;
  float begin;
  float end;
  float middle;
  float whole;
  float scale;
  float pointer;
  float line;
  Time myTime;


  Weather() {
    myTime = new Time();
    x = width/2;
    y = height/2;
    temperatureUnit = "f";
    temperatureSuffix = "ºF";
    begin = radians(120);
    end = radians(420);
    middle = radians(217);
    whole = begin+end;
    scale = radians(1);
  }
  
  void setTemperature(int F, int C) {
    // Set the temperature in Celsius and Fahrenheit
    temperatureF = F;
    temperatureC = C;
  }
  
  int getTemperature(String unit) {
    // Get the temperature in Celsius or Fahrenheit if the argument passed is a string of "f" or "c" 
    int result = 0;
    if (unit == "f") {
      result = temperatureF;
    } else if (unit == "c") {
      result = temperatureC;
    }
    return result;  
  }
  
  void setPlace(String city, String country) {
    // Set the information about the place where the data is being presented
    cityName = city;
    countryName = country;
  }
  
  String getPlace() {
    // Return the place that the temperature data is being presented. 
    return cityName+", "+countryName;
  }

  String getTempUnit() {
    // Return the unit used for the temperature
    return temperatureUnit; 
  }
  
  String getTempSuffix() {
    // Returns the temperature suffix
    return temperatureSuffix;
  }
  
  void setTempType(String type) {
    // set the temperature type between Celsius and Fahrenheit
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
    // Display the visual thermometer on screen 
    strokeWeight(70);
    strokeCap(SQUARE);
    noFill();
    stroke(0, 0, 255);
    arc(x, y, 550, 550, begin, middle);
    stroke(255, 0, 0);
    arc(x, y, 550, 550, middle, end);
    displayScale();
    displayTime();
    strokeWeight(1);
 }
 
 void displayScale() {
   // Display the scale for the thermometer
   strokeWeight(2);
   strokeCap(SQUARE);
   noFill();
   
   if (myTime.getNightTime(hour())) {
     stroke(255);
   } else {
     stroke(0);
   }
   
   // outside arc
   arc(x, y, 620, 620, begin, end);
   
   // inside arc 
   arc(x, y, 480, 480, begin, end);
   
   // scales
   strokeWeight(68);
   arc(x, y, 550, 550, begin, begin+scale);
   arc(x, y, 550, 550, middle-scale/2, middle+scale/2);
   arc(x, y, 550, 550, end-scale, end);
   
   // pointer
   strokeWeight(68);
   fill(255,255,255,70);
   pointer = map(getTemperature("f"),-14,128,radians(120),radians(420));
   arc(x, y, 550, 550, pointer, pointer+radians(2)); 
   
   noFill();
   strokeWeight(18);
   for (int i = -10; i <= 120; i+=10) {
     line = map(i,-14,128,radians(120),radians(420));
     arc(x, y, 640, 640, line-scale/2, line+scale/2);
   } 

   for (int j = -20; j <= 50; j+=10) {
     line = map(j,-25,53,radians(121),radians(420));
     arc(x, y, 460, 460, line-scale/2, line+scale/2);
   } 
   
   strokeWeight(7);
   for (int i = -14; i <= 128; i+=2) {
     line = map(i,-14,128,radians(120),radians(420));
     arc(x, y, 625, 625, line-scale/2, line+scale/2);
   }
   
   for (int j = -25; j <= 53; j+=1) {
     line = map(j,-25,53,radians(121),radians(420));
     arc(x, y, 475, 475, line-scale/2, line+scale/2);
   } 
 }
 
 void displayWeather(boolean display, String temperatureUnit) {
   // Display digital temperature on center of the screen
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
  
  void displayTime() {
    // Display the time at the bottom of the screen
    myTime.setDigitalClock();
    fill(255);
    myFont = createFont("Helvetica-bold", 32);
    textFont(myFont);
    textAlign(CENTER, CENTER);
    text(myTime.getHour()+":"+myTime.getMinute()+":"+myTime.getSecond(), width/2, height-35);  
    myFont = createFont("Helvetica-bold", 18);
    textFont(myFont);
  }
 
 void check(Weather myWeather, boolean displayTemp) {
  // change temperature representation
  if (displayTemp) {
    if (mouseY < (height/2)+30 && mouseY > (height/2)-30) {
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

