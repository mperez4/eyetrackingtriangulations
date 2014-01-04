boolean ShowImage = false;

void gui() {
  String instructions = "SKETCH 1:  To begin, click areas in the image to simulate eye tracking data points. You need three points to start the triangulation. The visualization algorithm is based on Delaunay Triangulations. Restart Application if there are any issues.";

  // show image button
  cp5.addToggle("ShowImage")
    .setPosition(30, 430)
      .setSize(80, 20)
        ;
  cp5.addBang("reset")
    .setPosition(30, 460)
      .setSize(80, 20)   
        .isActive()           
          ;

  fill(50);
  textSize(16);     
  text("Turn image On/Off", 115, 447);
  text("Reset data", 115, 477);
  text("Currently 2D data only.", 586, 580);
  
  rectMode(CORNER);
  text(instructions, 40, 120, 200, 400);
  rectMode(CENTER);
}
public void controlEvent(ControlEvent theEvent) {
  println(theEvent.getController().getName());
  if (theEvent.getController().getName() == "reset")
  {
    println("it is");
    thereIsData = false;
    //empty the arraylist point data and draw the image over the bounding box      
    points.clear();
    image(myImage, 538, height/2, 480, 360);
  }
}

