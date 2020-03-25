/**
 * Class representing an item of the list of notes
 */
class NoteList {
  float xPos;
  float yPos;

  float itemWidth = 0.99*width;
  float itemHeight = 0.167*height;
  String noteName; 

  File file; 
  int noteId; 
  boolean mouseReleased = false; 
  PFont titleFont; 

  NoteList(float xPos, float yPos, String noteName, File file, int noteId) {
    this.xPos = xPos; 
    this.yPos = yPos; 
    this.noteName = noteName; 
    this.file = file;
    this.noteId = noteId; 
  }

  void update() {
    if (checkMouse) {
      if (mouseY - pmouseY >=5) {
          yPos += 15;
        }
      if (mouseY - pmouseY <= -5) {
          yPos -= 15;
      }
    }
  }

  void scrollUp() {
    if (checkMouse) {
      if (mouseY - pmouseY <= -5) {
        yPos -= 15;
      }
    }
  }

  void scrollDown() {
    if (checkMouse) {
      if (mouseY - pmouseY >=5) {
        yPos += 15;
      }
    }
  }


  void display() {
    fill(255);
    rectMode(CENTER); 
    rect(xPos, yPos, itemWidth, itemHeight);
    fill(36);
    textSize(28);
    textAlign(LEFT, CENTER);
    titleFont = createFont("Roboto-Light.ttf", 36);
    textFont(titleFont); 
    text(noteName, xPos - 0.45*width, yPos);
  }

  /*
  * method to check if the mouse or the user's touch is over a note item
  */
  boolean checkMouseOverItem() {
    //if (mousePressed) {
      //println("pressTime in checkMouse " + pressTime); 
      //if (pressTime <= 0.15 && pressTime >= 0.05) {
        return (mouseX >= xPos - 0.5*itemWidth) && (mouseX <= xPos + 0.5*itemWidth) 
          && (mouseY >= yPos - 0.5*itemHeight) && (mouseY <= yPos + 0.5*itemHeight);
      //}
    //}
    //return false;
  }
}
