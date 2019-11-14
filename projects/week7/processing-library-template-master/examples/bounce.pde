import motion.maker.*;
MotionMaker m;
float a;

void setup() 
{
  size(640, 360);
  stroke(255);
  a = height/2;
  m = new MotionMaker(this);
}

void draw(){
   m.drawLinear(height, width);
  
}
