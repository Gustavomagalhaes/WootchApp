
class Tictoc {
  AudioPlayer player;
  boolean status = false;
  
  Tictoc() {
    player = minim.loadFile("sound/clock.mp3");
  }

  void setStatus(boolean result) {
    status = result;
  }
  
  boolean getStatus() {
    return status;
  }

  void display(boolean result) {
    // play the tic toc sound of the clock
    if (result) {
      player.loop();
      setStatus(true);
    } else {
      player.pause();
      setStatus(false);
    }  
  }
}
