class Scene { 

  Sky mySky;
  Horizon myHorizon;
  
  Scene() {
    mySky = new Sky();
    myHorizon = new Horizon();
  }

  void display(boolean result) {
    if (result) {
      mySky.display();
      myHorizon.display();  
    }
    
  }
}
