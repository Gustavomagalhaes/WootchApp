class About {
 
 Time myTime;
 
 
 About () {
   myTime = new Time(); 
 } 
 
 void display(boolean result) {
   if (result) {     
     if (myTime.getNightTime(hour())) {
       println("Display About of WoothApp 2014 NIGHT = WHITE");
//       fill(0);
     } else {
       println("Display About of WoothApp 2014 MORNING = BLACK");
//       fill(0);
     }
     fill(255);
     myFont = createFont("Helvetica-bold", 18);
     textFont(myFont);
     textAlign(CENTER, CENTER);
     text("TEXT HERE", width/2, height/2);  
   }
 }
}
