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
    // Display the menubar with icons
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
  
  void check() {
    // Check clicks on Menubar, set info text, and apply changes
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
  }
}
