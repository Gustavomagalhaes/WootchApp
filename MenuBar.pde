class MenuBar {
  PImage iconAudio;
  PImage iconClock;
  PImage iconThermometer;
  PImage iconWorldMap;
  PImage iconDate;
  PImage iconBatman;
  
  MenuBar() {  
    iconAudio = loadImage("/Users/gustavopereira/Desktop/WootchApp/Icons/audio.png");
    iconClock = loadImage("/Users/gustavopereira/Desktop/WootchApp/Icons/clock.png");
    iconThermometer = loadImage("/Users/gustavopereira/Desktop/WootchApp/Icons/thermometer.png");
    iconWorldMap = loadImage("/Users/gustavopereira/Desktop/WootchApp/Icons/world_map.png");
    iconDate = loadImage("/Users/gustavopereira/Desktop/WootchApp/Icons/date.png");
    iconBatman = loadImage("/Users/gustavopereira/Desktop/WootchApp/Icons/batman.png");
  }
  
  void display() {
    myFont = createFont("Helvetica-bold", 14);
    textFont(myFont);
    
    noStroke();
    fill(255);
    rect(0,0,width,35);
    
    fill(0);
    text("WootchAPP", width-70, 35/2);  
 
    image(iconAudio, 10, 2, 30, 30); 
    image(iconClock, 60, 2, 30, 30); 
    image(iconThermometer, 110, 2, 30, 30); 
    image(iconWorldMap, 160, 2, 30, 30); 
    image(iconDate, 210, 2, 30, 30); 
    image(iconBatman, 260, 2, 30, 30); 

  }

}
