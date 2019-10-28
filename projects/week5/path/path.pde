import drawing.library.*;
import processing.pdf.*;
import java.io.*;
import java.awt.*;
import drawing.library.*;
import processing.pdf.*;

DrawingManager drawingManager;
PImage bs1, bs2, wifi, phone;
int i1, i2;



ArrayList<BS> bsList = new ArrayList<BS>();

int d1, d2;


void setup() {
  size(1056,816,P3D);
  background(255);
  //frameRate(20);
  smooth();
  drawingManager = new DrawingManager(this);
  phone = loadImage("phone.png");

}


void draw(){
  drawingManager.pushMatrix();
  textSize(30);
  fill(0, 102, 153, 204);
  text ("Create your topology. Press b for 4G, g for 5G and w for wifi. \n Press c to initiate call  ", 100, 40);
  image(phone, 500, 500, 120, 120);  // Draw image using CENTER mode
 drawingManager.popMatrix();

}
  

void keyPressed(){
  if (keyPressed){
    if (key == 'b'){
      i1 = int(random(100, 300));
      i2 = int(random(100, 600));
      bsList.add(new BS("bs1.png", i1, i2, 80, 80, "4G"));
     
    }
    
    if (key == 'g'){
      i1 = int(random(600, 900));
      i2 = int(random(100, 600));
      bsList.add(new BS("bs.png", i1, i2, 100, 100, "5G"));
    }
    if (key == 'w'){
      textSize(15);
      i1 = int(random(400, 500));
      i2 = int(random(100, 350));
      bsList.add(new BS("rter.png", i1, i2, 100, 100, "wi-fi"));
      //text("4G");
    }
  if (key == 'c'){
    if (bsList.isEmpty()) {
      text ("No Base Station has been added yet", 100,120);
    }
    else{
      int index = int(random(bsList.size()));  
      BS bs = bsList.get(index);
      int x = bs.getX();
      int y = bs.getY();
      line(560, 520, x, y);
    
  }
}
    if(key == ' '){
    drawingManager.savePDF();
  }
   if(key == 'l'){
    drawingManager.clear();
  }

  }
}
