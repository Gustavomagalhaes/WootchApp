class About {

  Time myTime;
  String text;
  float y = 0;
  PFont myFont;

  About () {
    myTime = new Time();
    myFont = createFont("Helvetica-bold", 18);
    text = "WootchApp was developed by Gustavo Magalhaes\n\nFor the course CAP3032 Interactive Modeling and Animation I\n\nInstructed by Professor Joseph Murphy\n\nUniversity of Florida, Spring 2014\n\nProgramming on Processing 2.1\n\nhttps://github.com/Gustavomagalhaes/WootchApp";
  } 

  void display(boolean result) {
    if (result) {     
      fill(255);
      textFont(myFont);
      textAlign(CENTER, CENTER);
      text(text, width/2, height/2);
    }
  }
}

