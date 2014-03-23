class Cloud {
  PImage photo;
  
  Cloud() {
    photo = loadImage("clouds.png");
  }

  void display() {
    image(photo,0,35);
  }
}
