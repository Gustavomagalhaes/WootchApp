/* 
   Developed by Gustavo Magalhaes
   University of Florida - Spring 2014 Professor Joseph Murphy
   CAP3032 - Interactive Modeling and Animation I 
*/

import com.onformative.yahooweather.*;
import ddf.minim.*;
Minim minim;

PFont myFont;
boolean displayClock = true;
boolean displayTemp = false; 
boolean displatBatman = false;
boolean displayMap = false;
boolean displayDate = false;
boolean about = false;

int temperatureF;
int temperatureC;

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
    myWeather.displayWeather(displayTemp, myWeather.getTempUnit());
    myBatman.display(displatBatman);
    myAbout.display(about);
    
    // Checks
    myWeather.check(myWeather, displayTemp);
    myTime.check(myTime, displayMap);
    myMenuBar.check();   

  }

  void setWeather() {
    // 2408354 = Gainesville
    // 455824 = Recife
    weather = new YahooWeather(this, 2408354, myWeather.getTempUnit(), this.updateIntervallMillis);
    myWeather.setPlace(weather.getCityName(),weather.getCountryName());
    temperatureF = weather.getWindTemperature();
    myWeather.setTempType("c");
    weather = new YahooWeather(this, 2408354, myWeather.getTempUnit(), this.updateIntervallMillis);
    temperatureC = weather.getWindTemperature();
    myWeather.setTemperature(temperatureF, temperatureC);
  }


