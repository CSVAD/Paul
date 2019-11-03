import controlP5.*;
int shapeType; 
ControlP5 controlP5;
DropdownList type;

Swatch swatch;
Swatch1 swatch1;

ArrayList<Swatch> swatches; 
ArrayList<Swatch1> swatches1;
boolean colorShift = false;

void setup(){
  size(1056,816,P3D);
  controlP5 = new ControlP5(this);
  
  color activeColor = color(0,130,164);
  controlP5.setColorActive(activeColor);
  controlP5.setColorBackground(color(170));
  controlP5.setColorForeground(color(50));
  controlP5.setColorCaptionLabel(color(50));
  controlP5.setColorValueLabel(color(255));
   type = controlP5.addDropdownList("shapeType")
          .setBackgroundColor(color(190))
          .setSize(110, 500) 
          .setPosition(50, 50)
          .addItem("Circle", 0)
          .addItem("Rectangle", 1); 
  type.setColorActive(color(255, 128));
  
  swatches = new ArrayList<Swatch>();
  swatches1 = new ArrayList<Swatch1>();
  
  swatch = new Swatch(100,100,100,100);
  swatches.add(swatch);
  
  swatch1 = new Swatch1(round(width*0.3),height/2,100);;
  swatches1.add(swatch1);  
}

void draw(){
  colorMode(RGB,255);
  controlP5.show();
  controlP5.draw();
  background(200,200,200);
  
  for(int i=0;i<swatches1.size();i++){
    swatches1.get(i).draw();  
  }
  for(int j=0;j<swatches.size();j++){
    swatches.get(j).draw();
  }
  if (shapeType == 0) {
    swatch1 = new Swatch1(round(100*0.3),110/2,100);
    swatches1.add(swatch1);
    //for(int i=0;i<swatches1.size();i++){
    //  swatches1.get(i).draw();
    //}
  } 
  
  else if (shapeType == 1){
    swatch = new Swatch(500,500,100,100);
    swatches.add(swatch); 
  //for(int i=0;i<swatches.size();i++){
  //  swatches.get(i).draw();
  //} 
}
}

void mousePressed(){
  for(int i= swatches1.size()-1;i>=0;i--){
   Swatch1 s1 = swatches1.get(i);
   boolean hitTest = s1.hitTest(mouseX,mouseY);
   
   if(hitTest == true){
      s1.selected = true; 
      println("selected",i);
      return;
   }
  } 
  for(int i= swatches.size()-1;i>=0;i--){
   Swatch s = swatches.get(i);
   boolean hitTest = s.hitTest(mouseX,mouseY);
   
   if(hitTest == true){
      s.selected = true; 
      println("selected",i);
      return;
   }
  } 
}



void keyPressed(){
 colorShift = true; 
}

void keyReleased(){
  colorShift = false;
}

void mouseReleased(){
  deselectAllSwatches();
}

void mouseWheel(MouseEvent event) {
  int e = round(event.getCount());
 for(int i=0;i<swatches.size();i++){
     Swatch s = swatches.get(i);
     if(s.selected == true){
       if(colorShift == true){
         s.updateColor(new PVector(0,0),e);
       }
       return;
     }  
   }
 for(int i=0;i<swatches1.size();i++){
     Swatch1 s = swatches1.get(i);
     if(s.selected == true){
       //if(colorShift == true){
       //  s.updateColor(new PVector(0,0),e);
       //}
       return;
     }  
   }
}

void mouseDragged(){
   PVector delta = new PVector(mouseX-pmouseX,mouseY-pmouseY);
     for(int i=0;i<swatches1.size();i++){
       Swatch1 s = swatches1.get(i);
       if(s.selected == true){
         if(colorShift == false){
            s.moveBy(delta);
         }
         //else{
         //  s.updateColor(delta,0);
         //}
         return;
       }  
     }
   
   

   for(int i=0;i<swatches.size();i++){
     Swatch s = swatches.get(i);
     if(s.selected == true){
       if(colorShift == false){
          s.moveBy(delta);
       }
       //else{
       //  s.updateColor(delta,0);
       //}
       return;
     
   }
   }
   
}

void deselectAllSwatches(){

   for(int i=0;i<swatches1.size();i++){
      swatches1.get(i).selected = false;
   }
  
 
   for(int i=0;i<swatches.size();i++){
      swatches.get(i).selected = false;
   }   
  

}
