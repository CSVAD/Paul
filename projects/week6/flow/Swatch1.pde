class Swatch1{
 float rad;
 PVector position;
 int hue;
 int sat;
 int bri;
 boolean selected;
 boolean locked = false;
 
 Swatch1(int x,int y, float r){
  position = new PVector(x,y);
   rad = r;
   hue = round(random(0,100));
   sat = round(random(0,100));
   bri = round(random(0,100));
   selected = false;
 }
 
  boolean hitTest(int x,int y){
    if(pow(x - position.x,2) + pow(y - position.y,2) < pow(rad,2)){
      return true;
      
     }
    
    return false; 
  }
 
 void moveBy(PVector delta){
    position.add(delta); 
 }
 
 //void updateColor(PVector delta, int mouseWheel){
 //  hue += delta.y;
 //  sat += delta.x;
 //  bri += mouseWheel;

 //}
 void draw(){
   colorMode(RGB,255);
   if(selected){
     strokeWeight(2);
     stroke(255);
   }
   else{
     noStroke();
   }
   
   colorMode(HSB, 100);
   fill(hue,sat,bri);
   
   colorMode(HSB, 100);
   fill(hue,sat,bri);
   ellipse(position.x,position.y,rad, rad);
   }
   
   
 }
