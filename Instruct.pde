class Instruct implements Page {

  int MARGIN = 60;
  int DISTANCE = 80;
  float WIDTH = 90;
  
  Instruct() {
  }
  void pageSetup(){
    
  }
  
  void run() {
    background(255);
    textAlign(LEFT, CENTER); 
    String greeting = "Hi, Dr. Shahani!";
    textSize(30);
    fill(0);
    text(greeting, MARGIN, MARGIN + 20);

    String suggestion = "To find remedies for your feeling, \nchoose an emotion on the wheel.";
    textSize(20);
    fill(0);
    text(suggestion, MARGIN + 30, MARGIN + DISTANCE);

    String remedy = "To find out details about each flower remedy, \npress on ";
    textSize(20);
    fill(0);
    text(remedy, MARGIN + 30, MARGIN + DISTANCE * 2);
    image(flower, WIDTH + DISTANCE, MARGIN + DISTANCE * 2 + 10, width/10, height/15);

    String recording = "To record your feelings, \npress on ";
    textSize(20);
    fill(0);
    text(recording, MARGIN + 30, MARGIN + DISTANCE * 3);
    image(textIcon, WIDTH + DISTANCE, MARGIN + DISTANCE * 3 + 10, width/15, height/15);

    String playBible = "To play a verse from the Bible, \npress on ";
    textSize(20);
    fill(0);
    text(playBible, MARGIN + 30, MARGIN + DISTANCE * 4);
    image(bible, WIDTH + DISTANCE, MARGIN + DISTANCE * 4 + 10, width/15, height/15);

    //String playBack = "To access and play your old recordings, \npress on ";
    //textSize(20);
    //fill(0);
    //text(playBack, MARGIN + 30, MARGIN + DISTANCE * 5);
    //image(playback, WIDTH + DISTANCE, MARGIN + DISTANCE * 5 + 10, width/17, height/17);
  }

  void mousePress() {
    if (width-100 <= mouseX && 100 >= mouseY) {
      state = 0;
    }
  }

  void mouseDrag() {
  }

  void keyPress() {
  }
  void mouseRelease() {
  }
}
