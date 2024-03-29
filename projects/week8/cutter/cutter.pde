import drawing.library.*;
import processing.pdf.*;
DrawingManager drawingManager;
int resolution = 20;
float frequency = 0.1;
float amplitude = 1.0;
float vaseHeight = 500;
float phase = 0;




void setup() {
  size(1024, 768, P3D);
  drawingManager = new DrawingManager(this);
 }


void draw() {
int rowNum = 50;
float quadHeight = vaseHeight/rowNum;

  background(0);
  lights();
  //pushMatrix();
  translate(width / 2, height / 2 - rowNum*quadHeight / 2 , -100);
  strokeWeight(1);


  Point3D[][] verticies = calculateVerticies(rowNum, quadHeight);

  beginShape(QUAD_STRIP);
  for (int i=1; i<verticies.length; i++) {
    Point3D[] pointListTop = verticies[i-1];
    Point3D[] pointListBottom = verticies[i];


    for (int j=0; j<=pointListTop.length; j++) {
      int t;
      if (j<pointListTop.length) {
        t = j;
      } else {
        t = 0;
      }
      Point3D bottom = pointListBottom[t];
      Point3D top = pointListTop[t];
      vertex(top.x, top.y, top.z);
      vertex(bottom.x, bottom.y, bottom.z);
    }
  }

  endShape(CLOSE);

  //popMatrix();
}



Point3D[][] calculateVerticies(int rowNum, float quadHeight) {
  Point3D[][] verticies = new Point3D[rowNum][resolution];
  
  for (int i=0; i<rowNum; i++) {
    float y = quadHeight*i;
    float theta = map(i,0,rowNum,0,8*PI);
    float r = ((1+cos(theta*frequency+phase))+ (1+cos(theta*frequency+phase)))*amplitude/3;
    Point3D[] pointList = calculatePoints(r*100, y, resolution);
    verticies[i] = pointList;
  }
  return verticies;
}


Point3D[] calculatePoints(float r, float y, int res) {
  Point3D [] pointList = new Point3D[res];
  for (int i =0; i<res; i++) {
    float theta = 2*PI/res*i;
    float x = cos(theta)*r;
    float z = sin(theta)*r;
    Point3D p = new Point3D(x, y, z);
    pointList[i] = p;
  }

  return pointList;
}
void keyPressed(){
  if(key == ' '){
    drawingManager.savePDF();
  }
  if(key == 'l'){
    drawingManager.clear();
  }
}
