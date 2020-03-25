/**
 * Class representing a rectangular button
 */
class RectButton {
  float xPos;
  float yPos;
  String text; 
  float buttonWidth; 
  float buttonHeight; 
  color c; 
  int taskID; 
  RectButton(String text, float xPos, float yPos, float buttonWidth, float buttonHeight, color c, int taskID) {
    this.text = text; 
    this.xPos = xPos; 
    this.yPos = yPos; 
    this.buttonWidth = buttonWidth; 
    this.buttonHeight = buttonHeight; 
    this.c = c; 
    this.taskID = taskID;
  }

  void display() {
    fill(c); 
    rectMode(CENTER); 
    rect(xPos, yPos, buttonWidth, buttonHeight); 
    fill(255); 
    textAlign(CENTER, CENTER); 
    text(text, xPos, yPos);
  }

  /*
  * method to check if the mouse or the user's touch is on the button
  */
  boolean checkMouseOverButton() {
    float leftSideX = xPos - 0.5*buttonWidth;
    float rightSideX = xPos + 0.5*buttonWidth; 
    float topY = yPos -0.5*buttonHeight; 
    float bottomY = yPos + 0.5*buttonHeight; 
    return (mouseX >=leftSideX) && (mouseX<=rightSideX)
      && (mouseY >= topY) && (mouseY<=bottomY);
  }
}
