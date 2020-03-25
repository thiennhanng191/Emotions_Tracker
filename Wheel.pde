class Wheel implements Page {
  Suggestion ROCK_ROSE = new Suggestion("Rock rose", "Helps when you experience fears, such as terror or fright \nthat makes you feel frozen and unable to move or think clear.");
  Suggestion MIMULUS = new Suggestion("Mimulus", "Helps when you feel fear, the type of fear that you can put a name on \nsuch as fear of dogs, spiders, being alone, losing a job, illness etc. \nAlso, fear of speaking freely of it to others or shyness.");
  Suggestion CHERRY_PLUM = new Suggestion ("Cherry plum", "For those who feaer losing control of their thoughts and actions and \ndoing things they know are bad for them or which they consider wrong. \nTeaches trust in one's spontaneous wisdom and the courage to \nfollow one's path.");
  Suggestion ASPEN = new Suggestion("Aspen", "Helps when you feel fearful without knowing why. The fear is vague and \nunexplainable and any haunt you day or night.");
  Suggestion[] FEAR_SUGG = new Suggestion[] {ROCK_ROSE, MIMULUS, CHERRY_PLUM, ASPEN};

  Suggestion GORSE = new Suggestion("Gorse", "Helps when you feel great hopelessness, \nand have given up belief that more can be done.");
  Suggestion CERATO = new Suggestion("Cerato", "Helps trust your own judgment in decision-making.");
  Suggestion GENTIAN = new Suggestion("Gentian", "Helps when you get discouraged and depressed when things go wrong \nor when you are faced with even small delays or difficulty.");
  Suggestion WILD_OAT = new Suggestion("Wild Oat", "Helps when you are at a crossroad in life and are uncertian \nas to which direction to choose.");
  Suggestion[] UNCERTAIN_SUGG = new Suggestion[] {GORSE, CERATO, GENTIAN, WILD_OAT};

  Suggestion OLIVE = new Suggestion("Olive", "Helps you regain energy, vitality and interest in life.");
  Suggestion WILD_ROSE = new Suggestion("Wide Rose", "Helps you to take responsibility for your own life and take a lively interest \nin life, work and the world in general.");
  Suggestion MUSTARD = new Suggestion("Mustard", "Helps when you feel suddenly depressed without any reason. It feels like \na cold dark cloud that destroys normal happiness and cheerfulness.");
  Suggestion HONEYSUCKLE = new Suggestion("Honeysuckle", "Helps you to let go of past experiences or events. Your thoughts are in the past \nrather in the present.");
  Suggestion WHITE_CHESTNUT = new Suggestion("White chestnut", "Helps when your mind is cluttered with thoughts which you usually do not wish \nto have in your mind.");
  Suggestion[] INSUFF_SUGG = new Suggestion[] {OLIVE, WILD_ROSE, MUSTARD, HONEYSUCKLE, WHITE_CHESTNUT};

  Suggestion WATER_VIOLET = new Suggestion("Water violet", "Helps you get a warmer relationship with other people. You love being alone, \nbut often find yourself lonely.");
  Suggestion IMPATIENS = new Suggestion("Impatiens", "For those who act and think quickly, and have no patience for what they see as \nthe slowness of others. They often prefer to work alone. Teaches empathy and \nunderstanding of patience with others. It is found to be fast-acting in alleviating \nan impatient attitude and lowering stress.");
  Suggestion HEATHER = new Suggestion("Heather", "Helps when you are unhappy being alone for any length of time, you are always \nseeking the companionship and find it necessary to discuss your affairs with others, \nno matter who it may be.");
  Suggestion[] LONELINESS_SUGG = new Suggestion[] {WATER_VIOLET, IMPATIENS, HEATHER};

  Suggestion AGRIMONY = new Suggestion("Agrimony", "Helps you to communicate your real feelings and worries. You are the \ncheerful, humorous type that gets distressed by argument or quarrel. \nYou often hide your feelings behind humor and you use alcohol or drugs \nin excess to stimulate yourself.");
  Suggestion CENTAURY = new Suggestion("Centaury", "Helps when you find it hard to say no, and therefore easily get imposed on. \nYou often find yourself serving others, neglecting your own particulate \nmission in life.");
  Suggestion WALNUT = new Suggestion("Walnut", "Helps you break free from old ties and at times of major life changes. \nIt helps you move forward and make necessary changes in order to be happy. \nWalnut gives consistency and protection from outside influences.");
  Suggestion HOLLY = new Suggestion("Holly", "Helps when you suffer from angry thoughts such as jealousy, envy, revenge \nand/or suspicion.");
  Suggestion[] SENSI_SUGG = new Suggestion[] {AGRIMONY, CENTAURY, WALNUT, HOLLY};

  Suggestion PINE = new Suggestion("Pine", "Helps when you feel guilt and self-reproach, often for other people's \nmistakes or just anything that goes wrong. You are never content \nwith our effort and results.");
  Suggestion ELM = new Suggestion("Elm", "Helps when your responsibilities ovewhelm you. You feel depressed \nand exhuasted and may lose self-esteem.");
  Suggestion WILLOW = new Suggestion("Willow", "Helps when you have suffered adversity or misfortune and find it \ndifficult to accept. You feel sorry for yourself and are grumble and sulky.");
  Suggestion OAK = new Suggestion("Oak", "Helps when your inner strength wanes, usually because you are \nan over-achiever and will overwork and ignore your tiredness.");
  Suggestion[] DESPAIR_SUGG = new Suggestion[] {PINE, ELM, WILLOW, OAK};

  Suggestion VERVAIN = new Suggestion("Vervain", "For strong-willed people who hold strong views. They put unnecessary effort into \neverything they undertake, your mind race ahead of events, you may suffer from \nlack of sleep due to an overactive mind.");
  Suggestion CHICORY = new Suggestion("Chicory", "Helps you to be less critical, opinionated and argumentative. You always find something \nabout others that you believe should be put right.");
  Suggestion VINE = new Suggestion("Vine", "Helps you respect other people's views and ideas, you tend to try to persuade other people \nto do things your way.");
  Suggestion BEECH = new Suggestion("Beech", "Helps you be less critical toward other people and accept them as they are.");
  Suggestion ROCK_WATER = new Suggestion("Rock water", "Helps when you expect too much of yourself.");
  Suggestion[] OVERCARE_SUGG = new Suggestion[] {VERVAIN, CHICORY, VINE, BEECH, ROCK_WATER};

  Suggestion[] HAPPY_SUGG = new Suggestion[] {};
  Suggestion[][] suggestions = new Suggestion[][] {FEAR_SUGG, UNCERTAIN_SUGG, INSUFF_SUGG, LONELINESS_SUGG, SENSI_SUGG, DESPAIR_SUGG, OVERCARE_SUGG, HAPPY_SUGG};

  boolean IS_HAPPY = false;

  int newState = 0;

  float[] angles = {45, 45, 45, 45, 45, 45, 45, 45};
  color[] pieColors = {color(255, 0, 0), color(255, 102, 102), color(204, 102, 0), color(0, 76, 153), color(76, 0, 153), color(153, 153, 0), color(0, 204, 204), color(153, 255, 51)};
  String[] emotionLabel = {"Fear", "Uncertainty", "Insuff", "Loneliness", "Sensitivity", "Despair", "Overcaring", "Happiness"};
  int numofEmotions = 8;
  float pieChartWidth = 300;
  float tSize = 15;
  float offset = -90; // 90 degree offset counter clockwise; arrow is on top; offset needs to be negative to go counter-clockwise
  float mouseX1, mouseY1, rotateAngle, rotateDisplacement;
  Emotion[] arrayEmotions = new Emotion[numofEmotions];
  float chartLoc = 150;
  float lastAngle = 0;

  Page newSugg;
  void pageSetup(){
    
  }
  
  Wheel() {
    rotateAngle = radians(angles[0]/2);
    // set up emotion objects
    for (int i = (numofEmotions - 1); i >= 0; i--) {
      arrayEmotions[i] = new Emotion(emotionLabel[i], lastAngle, offset, angles[i], suggestions[i]);
      lastAngle += radians(angles[i]);
    }
  }

  void run() {

    // to allow for a little angular displacement
    displaceUpdate();
    background(100);
    image(textIcon, width/2, height/2, iconSize, iconSize);
    image(bible, width/2+iconSize, height/2, iconSize, iconSize);
    image(info, width/2, height/2-iconSize, iconSize, iconSize);
    image(logg, width/2+iconSize, height/2-iconSize, iconSize, iconSize);
    image(back, width - iconSize, 0, iconSize, iconSize);
    pointer();
    displayRec();
    pieChart(pieChartWidth, angles);
    redraw();
  }



  void mousePress() {
    float center = iconSize/2;
    if (dist(mouseX, mouseY, width/2, center) < iconSize) {
      state = sugg;
      setup();
    } else if (dist(mouseX, mouseY, width/2 + center, height/2 + center) < iconSize/2) {
      state = text;
    } else if (dist(mouseX, mouseY, width/2 + iconSize + center, height/2 + center) < iconSize/2) {
      state = audio;
    } else if (dist(mouseX, mouseY, width/2 + center, height/2 - iconSize + center) < iconSize/2) {
      state = instruct;
    } else if (dist(mouseX, mouseY, width/2 + iconSize + center, height/2 - iconSize + center) < iconSize/2) {
      state = log;
    }
  }

  void mouseDrag() {
    if (dist(mouseX, mouseY, chartLoc, height/2) < pieChartWidth/2) {
      // atan2(y,x) to convert cartesian to polar coordinates and find angle from center of circle
      rotateDisplacement =  atan2(mouseY-height/2, mouseX-chartLoc)-atan2(mouseY1-height/2, mouseX1-chartLoc);
      rotateAngle += rotateDisplacement;
    }
  }

  void keyPress() {
  }

  int getState() {
    return 0;
  }

  void pieChart(float diameter, float[] data) {
    // translate since atan2 rotates as if the circle were at the origin
    translate(chartLoc, height/2);
    rotate(rotateAngle);
    float lastAngle = 0;
    for (int i = 0; i < numofEmotions; i++) {
      fill(pieColors[i]);
      arc(0, 0, diameter, diameter, lastAngle, lastAngle + radians(data[i])); 
      lastAngle += radians(data[i]);
    }

    // change how the labels work
    // rotate label to middle of arc  
    rotate(radians(data[0])/2);
    for (int i = 0; i < numofEmotions; i++) {
      fill(0);
      text(emotionLabel[i], diameter/5, 0);
      rotate(radians(data[i]));
    }
  }

  void pointer() {
    fill(0);
    triangle( chartLoc, height/2 - pieChartWidth/2, chartLoc + tSize, height/2  - pieChartWidth/2 - tSize, chartLoc - tSize, height/2 - pieChartWidth/2-tSize );
  }

  void displayRec() {
    for (Emotion currentEmo : arrayEmotions) 
      if (currentEmo.isinRange(degrees(rotateAngle)%360)) {
        text(currentEmo.getLabel(), width/2, iconSize); // this will be the recommendation page
        IS_HAPPY = (currentEmo.getLabel().equals("Happiness"));
        pages[sugg] = new Sugg(currentEmo, IS_HAPPY);
      }
  }

  void displaceUpdate() {
    if (rotateAngle < 0)
      rotateAngle = radians(359.9);
    mouseX1 = mouseX;
    mouseY1 = mouseY;
  }
  void mouseRelease(){}
}
