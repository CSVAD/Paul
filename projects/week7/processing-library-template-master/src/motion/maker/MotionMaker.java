package motion.maker;


import processing.core.*;

/**
 * This is a template class and can be used to start a new processing Library.
 * Make sure you rename this class as well as the name of the example package 'template' 
 * to your own Library naming convention.
 * 
 * (the tag example followed by the name of an example included in folder 'examples' will
 * automatically include the example in the javadoc.)
 *
 * @example Hello 
 */

public class MotionMaker {
	
	// myParent is a reference to the parent sketch
	PApplet myParent;

	int myVariable = 0;
	float a;
	int h;
	int w;
	int rad = 60;
	float xpos, ypos;
	
	float xspeed = (float)2.8;
	float yspeed = (float)2.2;
	
	int xdirection = 1;
	int ydirection = 1;
	
	
	public final static String VERSION = "##library.prettyVersion##";
	

	/**
	 * a Constructor, usually called in the setup() method in your sketch to
	 * initialize and start the Library.
	 * 
	 * @example Hello
	 * @param theParent the parent PApplet
	 */
	public MotionMaker(PApplet theParent) {
		myParent = theParent;
		welcome();
	}
	
	
	private void welcome() {
		System.out.println("##library.name## ##library.prettyVersion## by ##author##");
	}
	
	public void drawLinear(int height, int width) {
		myParent.background(51);
		myParent.line(0, a, width, a);
		a = a - (float)0.2;
		if (a<0) {
			a = height;
		}
	}

	public void drawBouncy(int height, int width, float xpos,float ypos) {
		myParent.background(102);
		
		xpos = xpos + ( xspeed * xdirection );
		ypos = ypos + ( yspeed * ydirection );
		
		if (xpos > width-rad || xpos < rad) {
			 xdirection *= -1;
		}
		if (ypos > height-rad || ypos < rad) {
			 ydirection *= -1;
		}
		
		myParent.ellipse(xpos, ypos, rad, rad);
		
		
	
	}
	
	/**
	 * return the version of the Library.
	 * 
	 * @return String
	 */
	public static String version() {
		return VERSION;
	}

	/**
	 * 
	 * @param theA the width of test
	 * @param theB the height of test
	 */

}

