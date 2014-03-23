class Batman {
  PImage BatSignal;
  boolean display;
  
  Batman() {
    display = false;
    BatSignal = loadImage("/Users/gustavopereira/Desktop/WootchApp/Icons/batman.png");
  }
 
  void setDisplay(boolean result) {
    display = result;
  }
  
  boolean getDisplay() {
    return display;
  }
 
 
  void display(boolean result) {
    setDisplay(result);
    
    if (result) { 
      noStroke();
      fill(255,255,0);
      triangle(0,height,(width/2)-98,(height/2)-60,(width/2)+58,(height/2)+100);
      ellipse(width/2, height/2, 230, 230);
      image(BatSignal, (width/2)-85, (height/2)-85, 170, 170); 
    }

  }

}
