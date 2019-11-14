import motion.maker.*;

float xpos, ypos;
MotionMaker m2;

void setup() 
{
  size(640, 360);
  noStroke();
  frameRate(30);
  m2 = new MotionMaker(this);
  ellipseMode(RADIUS);
  // Set the starting position of the shape
  xpos = width/2;
  ypos = height/2;
  
}



void draw() {
  m2.drawBouncy(height, width, xpos, ypos);  // setting up parameters for drawing Bouncing Balls
}
