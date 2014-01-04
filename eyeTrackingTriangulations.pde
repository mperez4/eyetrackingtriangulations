import org.processing.wiki.triangulate.*;
import controlP5.*;

ControlP5 cp5;
ArrayList triangles = new ArrayList();
ArrayList points = new ArrayList();
PVector xy;
PImage myImage;
boolean thereIsData = false;

void setup() {
  size(800, 600);
  cp5 = new ControlP5(this);
  background(200);
  smooth();
  imageMode(CENTER);
  myImage = loadImage("Miguel.jpg");  
  image(myImage, 538, height/2, 480, 360);
  rectMode(CENTER);
  noFill();
  noStroke();
  rect( 538, height/2, 480, 360);
  fill(255);
  rectMode(CORNER);
  rect(0, 0, 275, height);
  gui();

}

void draw() {

  if (thereIsData) {
    if (!ShowImage) {
      //  println("button is off");
      image(myImage, 538, height/2, 480, 360);
      drawData();
    }
    else
      //println("button is on");     
      rect(538, height/2, 480, 360);   
      drawData();
  }
}

void mousePressed() {
  if (mousePressed) {
    //add points on PVector and arraylist
    //bounding box of image:
    if (mouseX > 298 && mouseX < 788 && mouseY > 120 && mouseY < 480) {
      thereIsData = true;
      xy = new PVector(mouseX, mouseY);      
      stroke(255, 0, 0);    
      point(xy.x, xy.y);
      points.add(xy);
    }
  }
}


void drawData() {
  //add the points to the triangulation
  triangles = Triangulate.triangulate(points);
  // draw the mesh of triangles
  stroke(0, 40);
  fill(255, 40);
  beginShape(TRIANGLES);
  for (int i = 0; i < triangles.size(); i++) {
    Triangle t = (Triangle)triangles.get(i);
    vertex(t.p1.x, t.p1.y);
    vertex(t.p2.x, t.p2.y);
    vertex(t.p3.x, t.p3.y);
  }
  endShape();
}

