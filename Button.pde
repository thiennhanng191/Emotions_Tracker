/**
 * Class representing a circular button
 */
class Button {
  float xPos;
  float yPos;

  float buttonWidth;
  float buttonHeight; 
  float buttonSize; 
  color buttonColor; 
  String text; 
  int taskID; 
  PImage buttonImage; 

  Button(float xPos, float yPos, float buttonSize, String text, int taskID) {
    this.xPos = xPos; 
    this.yPos = yPos; 
    this.buttonSize = buttonSize; 
    this.text = text; 
    this.taskID = taskID; 
  }

  void display() {
    fill(0, 0, 20, 100); 
    circle(xPos, yPos, buttonSize); 
    fill(255); 
    textAlign(CENTER, CENTER); 
    textSize(28); 
    text(text, xPos, yPos-4);
  } 

  /*
  * method to check if the mouse or the user's touch is on the button
  */
  boolean mouseOverButton() {
    if (dist(mouseX, mouseY, xPos, yPos) <= buttonSize/2)
      return true; 
    else 
    return false;
  }
}
