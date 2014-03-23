
class Tictoc {
  AudioPlayer player;
  boolean status = false;
  
  Tictoc() {
    player = minim.loadFile("/Users/gustavopereira/Desktop/WootchApp/clock.mp3");
  }

  void setStatus(boolean result) {
    status = result;
  }
  
  boolean getStatus() {
    return status;
  }

  void display(boolean result) {
    if (result) {
      player.loop();
      setStatus(true);
    } else {
      player.pause();
      setStatus(false);
    }  
  }
}
