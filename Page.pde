// Use this class to store all the runs, their fields, and their methods
// Put fields above their respective run method
// Put in the methods for mousePressed, mouseDragged, and draw

// The fields above the contructor are constants such as text size, states, 
// Maybe make this an interface
interface Page {
  void pageSetup(); 
  void run();
  void mousePress();
  void mouseDrag();
  void keyPress();
  void mouseRelease();
}
