class Cloud {
  PImage photo;
  
  Cloud() {
    photo = loadImage("images/clouds.png");
  }

  void display() {
    // load the cloud image for the morning sky background
    image(photo,0,35);
  }
}
