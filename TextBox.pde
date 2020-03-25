/**
* a class representing a text box
*/ 
class TextBox {
  float xPos;
  float yPos;
  float boxWidth; 
  float boxHeight; 
  String content; 
  
  TextBox(float xPos, float yPos, float boxWidth, float boxHeight, String content) {
    this.xPos = xPos; 
    this.yPos = yPos; 
    this.boxWidth = boxWidth; 
    this.boxHeight = boxHeight; 
    this.content = content;
  }

  void display() { 
    stroke(80);
    fill(255);
    rectMode(CORNER); 
    rect(xPos, yPos, boxWidth, boxHeight);
    fill(50);
    
    contentFont = createFont("Roboto-Light.ttf", 24);
    textFont(contentFont);
    textAlign(LEFT);
    text(content, 2*xPos, yPos + 5, boxWidth - 2*xPos, boxHeight);
  }

  /*
  * method to check if the mouse or the user's touch is over the textbox
  */
  boolean checkMouseOverBox() {
    float leftSideX = xPos ;
    float rightSideX = xPos + boxWidth; 
    float topY = yPos; 
    float bottomY = yPos + boxHeight; 
    return (mouseX >=leftSideX) && (mouseX<=rightSideX)
      && (mouseY >= topY) && (mouseY<=bottomY);
  }
}
