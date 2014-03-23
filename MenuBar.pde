class MenuBar {
  PImage iconAudio;
  PImage iconClock;
  PImage iconThermometer;
  PImage iconWorldMap;
  PImage iconDate;
  PImage iconBatman;
  
  MenuBar() {  
    iconAudio = loadImage("Icons/audio.png");
    iconClock = loadImage("Icons/clock.png");
    iconThermometer = loadImage("Icons/thermometer.png");
    iconWorldMap = loadImage("Icons/world_map.png");
    iconDate = loadImage("Icons/date.png");
    iconBatman = loadImage("Icons/batman.png");
  }
  
  void display() {
    myFont = createFont("Helvetica-bold", 14);
    textFont(myFont);
    
    noStroke();
    fill(255);
    rect(0,0,width,35);
    
    fill(0);
    text("WootchApp", width-70, 35/2);  
 
    image(iconAudio, 10, 2, 30, 30); 
    image(iconClock, 60, 2, 30, 30); 
    image(iconThermometer, 110, 2, 30, 30); 
    image(iconWorldMap, 160, 2, 30, 30); 
    image(iconDate, 210, 2, 30, 30); 
    image(iconBatman, 260, 2, 30, 30); 

  }

}
