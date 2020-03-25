/**
 * Class representing an audio bar
 */
class AudioBar {
  float xPos;
  float yPos;

  float audioBarWidth; 
  float audioBarHeight; 
  color c; 
  int taskID; 
  AudioBar(float xPos, float yPos, float audioBarWidth, float audioBarHeight, color c, int taskID) {
    this.xPos = xPos; 
    this.yPos = yPos; 
    this.audioBarWidth = audioBarWidth; 
    this.audioBarHeight = audioBarHeight; 
    this.c = c; 
    this.taskID = taskID;
  }

  void display() {
    fill(c); 
    rectMode(CENTER); 
    rect(xPos, yPos, audioBarWidth, audioBarHeight);
  }
}
