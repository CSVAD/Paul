import controlP5.*;
ControlP5 cp5;
ParticleSystem ps;
int resolution = 20;
int randit = 0;


float frequency = 0.1;
float amplitude = 1.0;
float vaseHeight = 500;
float phase = 0;
float shaper ;
float thicks;
String currentShape = "";
int seedCount = 10;

Controller ringResSlider;
Controller freqSlider;
Controller amplitudeSlider;
Controller heightSlider;
Controller phaseSlider;
Controller shapeSlider;
Controller thickSlider;
Controller randSlider;
Controller seedSlider;
DropdownList shapes;




void setup() {
  size(1024, 768, P3D);
  cp5 = new ControlP5(this);


  shapeSlider =  cp5.addSlider("shaper")
    .setPosition(25, 25)
    .setRange(0, 6)
    ;

  ringResSlider =  cp5.addSlider("resolution")
    .setPosition(25, 25*2)
    .setRange(3, 50)
    ;

  freqSlider = cp5.addSlider("frequency")
    .setPosition(25, 25*3)
    .setRange(0.1, 1)
    ;

  amplitudeSlider =  cp5.addSlider("amplitude")
    .setPosition(25, 25*4)
    .setRange(1.0, 6);
    ;


  heightSlider = cp5.addSlider("vaseHeight")
    .setPosition(25, 25*5)
    .setRange(100, height-10)
    ;



  phaseSlider = cp5.addSlider("phase")
    .setPosition(25, 25*6)
    .setRange(0,2*PI)
    ;
    
  thickSlider = cp5.addSlider("thicks")
    .setPosition(25, 25*7)
    .setRange(8,2)
    ;
    
   randSlider = cp5.addSlider("randit")
    .setPosition(25, 25*8)
    .setRange(0,1.5)
    ;   

    seedSlider = cp5.addSlider("seedCount")
    .setPosition(25, 25*9)
    .setRange(1,20)
    ;  
  
  ps = new ParticleSystem(new PVector(width/2, 50));
  //shapes = cp5.addDropdownList("Shapes").setPosition(25,25*8).setSize(100, 600);

  //String[] allShapes = {
  //    "Shape 1", "Shape2", "Shape 3"
  //  };

  //for (int i=0; i<allShapes.length; i++) {
  //  shapes.addItem(allShapes[i], i);
  //}
  ////customize shapes;
  
}




void draw() {
int rowNum = 50;
float quadHeight = (vaseHeight/rowNum);

  background(0);
  if (randit == 1){
  ps.addParticle();
  ps.run();
  }
  lights();
  pushMatrix();
  translate(width / 2, height / 2 - rowNum*quadHeight / 2 , -100);
  fill(255);
  colorMode(RGB, 255, 255, 255, 100);
  //stroke(0,0,255);
  strokeWeight(3);

  
  rotateY((float)(frameCount * Math.PI / 400));
  

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

  popMatrix();
}

class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;

  ParticleSystem(PVector position) {
    origin = position.copy();
    particles = new ArrayList<Particle>();
  }

  void addParticle() {
    for (int i =0; i <= seedCount; i++){
    particles.add(new Particle(origin));
  }
  }

  void run() {
    //for (int i =0; i <= (particles.size()-1); i++) {

    for (int i = (particles.size()-1); i >= 0; i--) {
      Particle p = particles.get(i);
      p.run();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }

  }
// A simple Particle class

class Particle {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  int seedCount;

  Particle(PVector l) {
    acceleration = new PVector(0, 0.05);
    velocity = new PVector(random(-1, 1), random(-2, 0));
    position = l.copy();
    lifespan = 255.0;
  }

  void run() {
    update();
    display();
  }

  // Method to update position
  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    lifespan -= 1.0;
  }

  // Method to display
  void display() {
    stroke(255, lifespan);
    fill(255, lifespan);
    ellipse(position.x, position.y, 8, 8);
  }

  // Is the particle still useful?
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}






public String controlEvent(ControlEvent theEvent) {
  if (theEvent.isGroup()) {
    String listName = theEvent.getName();
    String itemName = theEvent.getGroup().getCaptionLabel().getText();
    if (listName.equals("Shapes")) {
      currentShape = itemName;
    } 
  }
  return currentShape;
}



Point3D[][] calculateVerticies(int rowNum, float quadHeight) {
  Point3D[][] verticies = new Point3D[rowNum][resolution];
  
  for (int i=0; i<rowNum; i++) {
    float y = quadHeight*i;
    float theta = map(i,0,rowNum,0,10*PI);
    float r= 0;
    if (shaper >=0 && shaper <1.0){
      
       r = (1+cos(theta*frequency+phase))*amplitude/thicks;
    }
    else if (shaper >= 1.0 && shaper < 2.0){
       r = (1+sin(theta*frequency+phase))*amplitude/thicks;
    }
    else if (shaper >= 2.0 && shaper < 3.0) {
    
     r = ((1+sin(theta*frequency+phase))+ (1+sin(theta*frequency+phase)))*amplitude/thicks;
    }

    else if (shaper >= 3.0 && shaper < 4.0) {
    
     r = ((1+cos(theta*frequency+phase))+ (1+cos(theta*frequency+phase)))*amplitude/thicks;
    }
    else if (shaper >= 4.0 && shaper < 5.0)  {
    
     r = 2*(((1+sin(theta*frequency+phase))+ (1+cos(theta*frequency+phase)))*amplitude/thicks);
    }
    else if  (shaper >= 5.0 && shaper <= 6.0){
      r = (((2+sin(theta*frequency+phase))+ (2+cos(theta*frequency+phase)))*amplitude/thicks);
    }
    

//    if (currentShape == "Shape 1"){
//       r = (1+cos(theta*frequency+phase))*amplitude/thicks;
//    }
//    else if (currentShape == "Shape 2"){
//       r = (1+sin(theta*frequency+phase))*amplitude/thicks;
//    }
//    else{
    
//     r = ((1+sin(theta*frequency+phase))+ (1+cos(theta*frequency+phase)))*amplitude/thicks;
//    }
    
    
    
    
    //
  else {
    println(r);
  } 
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
