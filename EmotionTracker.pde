import java.util.*;
import java.io.File; 


boolean checkMouse = false; 
boolean checkMouseDragged = false; 

PFont titleFont; 
PFont instructionFont; 
PFont contentFont; 

int state = 0;
final int disclaimer = -1;
final int wheel = 0;
final int sugg = 1;
final int audio = 2;
final int text = 3;
final int instruct = 4;
final int log = 5;

Page wheelPage = new Wheel();
Page suggPage;
// need to fix audio
// to test the rest of the program comment out the ' = new Audio();' part
Page audioPage = new Audio();
Page textPage = new Text();
Page iPage = new Instruct();
Page logPage = new Log();

// may have to call pages by their index rather their name
Page[] pages = {wheelPage, suggPage, audioPage, textPage, iPage, logPage};

PImage flower;
PImage textIcon;
PImage bible;
//PImage record;
//PImage playback;
PImage info;
PImage back;
PImage logg;
PFont font;


float iconSize = 100;  



void setup() {
  orientation(LANDSCAPE);
  size(1024, 600);
  frameRate(30); 
  flower = loadImage("flower.png");
  textIcon = loadImage("text.png");
  bible = loadImage("bible.png");
  // record = loadImage("record.png");
  // playback = loadImage("playback.png");
  info = loadImage("info.jpg");
  back = loadImage("backbutton.png");
  logg = loadImage("log.png");
  font = createFont("Serif", 20);
  textFont(font);
  pages[2].pageSetup(); 
  pages[5].pageSetup();
}

// update suggPage method
void draw() {  
  pages[state].run();
}

void mousePressed() {
  pages[state].mousePress();
}

void mouseDragged() {
  pages[state].mouseDrag();
}

void keyPressed() {
  pages[state].keyPress();
}

void mouseReleased() {
  pages[state].mouseRelease();
}
