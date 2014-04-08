class Cloud {
  PImage photo;
  
  Cloud() {
    photo = loadImage("images/clouds.png");
  }

  void display() {
    image(photo,0,35);
  }
}
