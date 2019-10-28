public class BS {
  PImage img;
  private int x;
  private int y;
  BS(String fname, int d1, int d2, int x, int y, String carrier) {
    img = new PImage();
    img = loadImage(fname);
    this.x = d1;
    this.y = d2;
    drawingManager.image(img, d1, d2, x, y);
    text (carrier, i1+2, i2+2);
  } 
  public int getX(){
   return this.x;
  }
  public int getY(){
   return this.y;
  }
}
