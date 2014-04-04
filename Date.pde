class Date {
  
  boolean display;
  
  Date() {
    display = false;
  }
  
  void setDisplay(boolean result) {
    display = result;
  }
  
  boolean getDisplay() {
    return display;
  }
  
  void display(boolean result) {
    setDisplay(result);
    String [] months = {"January","February","March","April","May","June","July",
                          "August","September","October","November","December"};
    String suffix;
    if (day() == 1 || day() == 21 || day() == 31) {
      suffix = "st";
    } else if (day() == 2 || day() == 22) {
      suffix = "nd";
    } else if (day() == 3 || day() == 23) {
      suffix = "rd";
    } else {
      suffix = "th";
    }
    
    if (result) { 
      String writeDate = months[month()-1]+" "+day()+suffix;
      fill(255);
      myFont = createFont("Helvetica-bold", 28);
      textFont(myFont);
      textAlign(CENTER, CENTER);
      text(writeDate, width/2, (height/2)-35);
      myFont = createFont("Helvetica-bold", 18);
      textFont(myFont);
    }
  }
}
