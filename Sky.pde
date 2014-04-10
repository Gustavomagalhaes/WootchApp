class Sky { 

  Time myTime;
  protected int numOfStars = 500;
  Star[] myStars;
  Cloud myCloud;

  Sky() {
    myTime = new Time();
    myCloud = new Cloud();
    myStars = new Star[numOfStars];
    for (int i = 0; i < myStars.length; i++) {
      myStars[i] = new Star();
    }
  }

  void display() {
    // display the night sky or the morning sky
    if (myTime.getNightTime(hour())) {
      for (int i = 0; i < myStars.length; i++) {
        myStars[i].display();
      }
    } else {
        myCloud.display();
    }
  }
}
