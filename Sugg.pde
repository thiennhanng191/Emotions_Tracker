class Sugg implements Page {

  int NUM_SUGG = 0;
  int X_DEFAULT = 5;
  int Y_DEFAULT = 50;
  int MARGIN = 20;
  int Y = 400;

  Suggestion[] arraySuggestion; ////////// JAPOSDD
  int numSuggestions; 

  boolean IS_HAPPY;

  Sugg(Emotion currentEmo, boolean IS_HAPPY) {
    arraySuggestion = currentEmo.getSugg();
    numSuggestions = arraySuggestion.length;
    this.IS_HAPPY = IS_HAPPY;
  }

  void pageSetup(){
  }
  void run() {
     background(255);
     image(back, width - iconSize, 0,iconSize, iconSize);
    // render the name of the current remedy
    if (! IS_HAPPY) {
      image(flower, X_DEFAULT, Y_DEFAULT, width/8, height/8);
      textSize(50);
      String currentRemedy = arraySuggestion[NUM_SUGG].remedy;
      text(currentRemedy, X_DEFAULT+flower.width/8, flower.height/8+15);
      for (int i=0; i<numSuggestions; i++) {
        // determine the distance between each flower picture at the bottom:
        // subtract the length of margin on both sides and the picture widths from the total width
        // and there will be (# of flower picture - 1) gaps in between
        float gap = (width-2*MARGIN-numSuggestions*flower.width/5)/(numSuggestions-1);
        // determine the x-coordinate of each flower picture
        float x = MARGIN + i*(flower.width/5+gap);
        // render the flower picture
        image(flower, x, Y, width/5, height/5);
        // render the name of the remedy under each flower picture
        String remedy = arraySuggestion[i].remedy;
        textSize(20);
        textAlign(CENTER, BOTTOM);
        text(remedy, x+flower.width/10+5, Y+flower.height/5-10);
      }

      // render the suggestion of the current remedy
      textSize(25);
      fill(0);
      textAlign(LEFT);
      arraySuggestion[NUM_SUGG].renderSuggestion();
    } else {
      image(flower, width/2-100, height/2+50, width/5, height/5);
      textSize(50);
      fill(0);
      textAlign(CENTER);
      String happyMessage = "We are glad that you are happy!\nHave a great day!";
      text(happyMessage, width/2, height/2-50);
    }
    redraw();
  }

  void mousePress() {
    if (width-100 <= mouseX && 100 >= mouseY){
      state = 0;
      setup();
    }
    if (Y-10<= mouseY && mouseY<= Y+flower.height/5) {
      for (int i=0; i<numSuggestions; i++) {
        float gap = (width-2*MARGIN-numSuggestions*flower.width/5)/(numSuggestions-1);
        float x = MARGIN+ i*(flower.width/5+gap);
        if (x+50<=mouseX && mouseX<=x+flower.width/5) {
          NUM_SUGG = i;
        }
      }
    }
  }

  void mouseDrag() {
    if (Y-10<= mouseY && mouseY<= Y+flower.height/5) {
      for (int i=0; i<numSuggestions; i++) {
        float gap = (width-2*MARGIN-numSuggestions*flower.width/5)/(numSuggestions-1);
        float x = MARGIN+ i*(flower.width/5+gap);
        if (x+50<=mouseX && mouseX<=x+flower.width/5) {
          NUM_SUGG = i;
        }
      }
    }
  }

  void keyPress() {
  }

  int getState() {
    return 1;
  }
  void mouseRelease(){}
}
