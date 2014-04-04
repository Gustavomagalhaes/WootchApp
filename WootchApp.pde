/* Developed by Gustavo Magalhaes
    University of Florida - Spring 2014 
      Professor Joseph Murphy
        CAP3032 - Interactive Modeling and Animation I */

import com.onformative.yahooweather.*;
import ddf.minim.*;
Minim minim;

PFont myFont;
String temperatureUnit = "f";
String temperatureSuffix = "ºF";
boolean displayClock = true;
boolean displayTemp = false; 
boolean displatBatman = false;
boolean displayMap = false;
boolean displayDate = false;
boolean about = false;

int temperatureF;
int temperatureC;
String cityName;
String countryName;

Scene myScene;
Time myTime;
Date myDate;
Weather myWeather;
About myAbout;
MenuBar myMenuBar;
Batman myBatman; 
Tictoc tictoc;

YahooWeather weather;
int updateIntervallMillis = 90000;

  void setup() {
   size(800,800,P3D); 
   minim = new Minim(this);
   smooth();
   
   myScene = new Scene();
   myTime = new Time();
   myDate = new Date();
   myWeather = new Weather();
   myAbout = new About();
   myMenuBar = new MenuBar();
   tictoc = new Tictoc();
   tictoc.display(!tictoc.getStatus());
   myBatman = new Batman();
   setWeather();
  }

  void draw() {
    background(0);
    myMenuBar.display();
    myScene.display(!displayMap);
    myTime.display(displayClock);
    myTime.displayMap(displayMap);
    myDate.display(displayDate);
    displayWeather(displayTemp, temperatureUnit);
    myBatman.display(displatBatman);
    myAbout.display(about);
    
    
    
    
    
    
    
    
    // menubar
    String textDisplay = ""; 
    if (mouseY > 0 && mouseY < 35) { // Mouse over the menubar
      if (mouseX > 0 && mouseX < 50) { // Mouse over Sound function
        textDisplay = "Sound ON/OFF";
        if (mousePressed) {
          tictoc.display(!tictoc.getStatus());  
        } 
      } else if (mouseX > 50 && mouseX < 100) { // Mouse over display clock function
        textDisplay = "Display Clock";
        if (mousePressed) {
          tictoc.display(true);
          displayClock = true;
          displayTemp = false; 
          displayMap = false;
          about = false;    
        } 
      } else if (mouseX > 100 && mouseX < 150) { // Mouse over display temperature function
        textDisplay = "Temperature";
        if (mousePressed) {
          displayTemp = true;
          displayClock = false;
          displayMap = false;
          about = false;   
        } 
      } else if (mouseX > 150 && mouseX < 200) { // Mouse over display time zone function
        textDisplay = "Time Zone Map";
        if (mousePressed) {
          if (displayMap) {
            displayMap = false;
            displayClock = true;
          } else {
            displayMap = true;
            about = false;
            displayDate = false;
            displayClock = false;
            displayTemp = false;
          } 
        } 
      } else if (mouseX > 200 && mouseX < 250) { // Mouse over display date function
        textDisplay = "Display Date";
        if (mousePressed) {
          if (displayDate) {
            displayDate = false;  
          } else {
            if (!displayMap && !about) {
              displayDate = true;
              displayMap = false;
            }
          }
        } 
      } else if (mouseX > 250 && mouseX < 300) { // Mouse over call batman function
        textDisplay = "Call Batman";
        if (mousePressed) { 
          if (myBatman.getDisplay()) {
            displatBatman = false;
          } else {
            displatBatman = true;
          }
        } 
      } else if (mouseX > 690 && mouseX < 770) {
        textDisplay = "About";
        if (mousePressed) {
          if (about) {
            about = false;
            displayClock = true;
          } else {
            about = true;
            displayMap = false;
            displayDate = false;
            displayClock = false;
            displayTemp = false;
          } 
        }  
      }
      
      
      fill(0);
      text(textDisplay, width/2, 35/2);
    }
    // change timezone
    if (displayMap) {
      if (mouseY > 230 && mouseY < 710) {
        println("WORKING");
        myTime.setTimezone(-5);
      } else {
        println("NOT WORKING");
        myTime.setTimezone(0);  
      }
    }
    
    // change temperature representation
    if (mouseY < (height-80) && mouseY > (height-120)) {
      if (mouseX > (width/2)-50 && mouseX < width/2) {
        if (mousePressed) {
          temperatureUnit = "c";
          temperatureSuffix = "ºC";
        }  
      } else if (mouseX > width/2 && mouseX < (width/2)+50) {
        if (mousePressed) {
          temperatureUnit = "f";
          temperatureSuffix = "ºF";
        }  
      } 
    }
    
  }

  void setWeather() {
    // 2408354 = Gainesville
    // 455824 = Recife
    weather = new YahooWeather(this, 2408354, "f", this.updateIntervallMillis);
    cityName = weather.getCityName();
    countryName = weather.getCountryName(); 
    temperatureF = weather.getWindTemperature();
    weather = new YahooWeather(this, 2408354, "c", this.updateIntervallMillis);
    temperatureC = weather.getWindTemperature();
  }

  void displayWeather(boolean display, String temperatureUnit) {
    myFont = createFont("Helvetica-bold", 18);
    textFont(myFont);
    text(cityName+", "+countryName, width/2, height-10); 
    
    if (display) {
      myFont = createFont("Helvetica-bold", 40);
      textFont(myFont);
      
      if (temperatureUnit == "f") {
        text(temperatureF+temperatureSuffix, width/2,height/2);
      } else {
        text(temperatureC+temperatureSuffix, width/2,height/2);
      }
      text("ºC", (width/2)-30,height-100);
      text("ºF", (width/2)+30,height-100);
      
      myWeather.display(temperatureF);
    }
    myFont = createFont("Helvetica-bold", 18);
    textFont(myFont);
  }


