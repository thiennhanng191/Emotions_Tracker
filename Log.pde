import java.io.*; 
import java.util.*; 
import android.os.Environment; 

/**
 * Class representing the Note Log Page implementing the Page interface
 */
class Log implements Page {
  float yPos;
  String[] noteFiles; 
  int count = 0; 

  double startTime; 

  double endTime; 
  double pressTime; 
  boolean timerOn = false; 

  boolean scrollableUp = true; 
  boolean scrollableDown = true; 
  boolean nextScreen = false;
  boolean mouseReleased = false; 

  int curNoteId = 0; 

  int pageID = 0; 
  float scrollDownLimit;

  PFont textFont; 
  float pageHeaderHeight;
  float backToMainButHeight; 

  List<NoteList> noteList = new ArrayList<NoteList>(); 
  NoteList noteItem; 

  Button backButton;
  Button backToMainButton; 


  File sdCard; 
  File dir; 

  Log() {
  }

  void pageSetup() {
    frameRate(30);
    yPos = 0.5*height; 
    pageHeaderHeight = 0.12*height;
    backToMainButHeight = 0.1*height; 
    //getNote();
    listView();
  }
  void run() {
    background(255);
    rectMode(CENTER); 

    checkClickOnItems(); 
    if (pageID == 1) {
      checkItems();
    } else if (pageID == 0) {
      renderListView();
    }
  }

  /*
* method to get all the notes files from the sd card
   */
  void listView() {
    sdCard = Environment.getExternalStorageDirectory();
    dir = new File (sdCard.getAbsolutePath(), "note_items");

    noteFiles = dir.list(); 
    for (String note : noteFiles) {
      println("note file " + note);
    } 
    float xPos = 0.5*width; 
    float yPos = 2*0.167*height; //yPos of the first highest item
    for (int i = 0; i < noteFiles.length; i++) {
      File noteFile = new File(dir, noteFiles[i]); 
      println(noteFiles[i]);
      noteItem = new NoteList(xPos, yPos, trimNoteTitle(noteFiles[i]), noteFile, i); 
      noteList.add(noteItem); 
      if (i == 3) {
        scrollDownLimit = yPos;
      }
      yPos += 0.167*height;
    }
  }

  /*
* method to move the page header as the user scrolls the page
   */
  void pageHeaderUpdate() {
    if (checkMouse) {
      if (mouseY - pmouseY >=5) {
        pageHeaderHeight += 15;
        backToMainButHeight += 15;
      }
      if (mouseY - pmouseY <= -5) {
        pageHeaderHeight -= 15;
        backToMainButHeight -=15;
      }
    }
  }

  /*
* method to move the page header up as the user scrolls up the page
   */
  void pageHeaderUp() {
    if (checkMouse) {
      if (mouseY - pmouseY <= -5) {
        pageHeaderHeight -= 15;
        backToMainButHeight -= 15;
      }
    }
  }

  /*
* method to move the page header down as the user scrolls up the page
   */
  void pageHeaderDown() {
    if (checkMouse) {
      if (mouseY - pmouseY >=5) {
        pageHeaderHeight += 15;
        backToMainButHeight += 15;
      }
    }
  }

  /*
* method to render the page header
   */
  void pageHeaderRender() {
    textFont = createFont("Roboto-Medium.ttf", 50); 
    textFont(textFont);
    fill(36);
    textAlign(LEFT, CENTER); 
    text("Feelings Log", 0.05*width, pageHeaderHeight);
    backToMainButton = new Button(0.8*width, backToMainButHeight, 60, "<", 2);
    backToMainButton.display();
  }

  /*
* method to render all the note items on the page
   */
  void renderListView() {
    //textFont = loadFont("Roboto-Light-32.vlw"); 
    background(255); 
    if (noteList.size() > 3) {
      int lastItem = noteList.size() - 1; 
      boolean scrollableUp = (noteList.get(lastItem - 3).yPos >= 0.5*noteList.get(lastItem - 3).itemHeight);
      boolean scrollableDown = (noteList.get(3).yPos <= scrollDownLimit);//height + 0.5*noteList.get(5).itemHeight);
      if (scrollableUp && scrollableDown) {
        pageHeaderUpdate(); 
        pageHeaderRender();
        for (NoteList noteItem : noteList) { 
          noteItem.update();
          noteItem.display();
        }
      } else if (!scrollableUp) {
        pageHeaderDown(); 
        pageHeaderRender();
        for (NoteList noteItem : noteList) {
          noteItem.scrollDown();
          noteItem.display();
        }
      } else if (!scrollableDown) {
        pageHeaderUp(); 
        pageHeaderRender();
        for (NoteList noteItem : noteList) {
          noteItem.scrollUp();
          noteItem.display();
        }
      }
    } else {
      pageHeaderRender();
    }
    for (NoteList noteItem : noteList) {
      noteItem.display();
    }
    if (mousePressed && backToMainButton.mouseOverButton()) {
      println("checkmouse to Main"); 
      state = 0;
      setup();
    }
  }

  /*
* method to return a note item's content from a note file
   */
  String getNote(String fileName) {
    File sdCard = Environment.getExternalStorageDirectory();

    File dir = new File (sdCard.getAbsolutePath(), "note_items");
    File textFile = new File(dir, fileName);

    StringBuilder text = new StringBuilder(); 
    try {
      BufferedReader br = new BufferedReader(new FileReader(textFile));
      String line;     
      while ((line = br.readLine()) != null) {
        text.append(line); 
        text.append('\n');
      }
      br.close();
    } 
    catch(FileNotFoundException e) {
      e.printStackTrace();
    } 
    catch (IOException e) {
      e.printStackTrace();
    }
    //println("text: " + text);
    return text.toString();
  }

  /*
* method to return a note item's name from a note file
   */
  String trimNoteTitle(String text) {
    return text.substring(0, text.length() -4);
  }

  /*
* method to render the content of a note item
   */
  void printNoteItem(int id) {
    background(255); 
    backButton = new Button(0.1*width, 0.1*height, 60, "<", 2);
    backButton.display(); 

    if (mousePressed && backButton.mouseOverButton()) {
      pageID = 0;
    } else {
      fill(36);
      textSize(28);
      textAlign(LEFT, CENTER);
      text(getNote(noteFiles[id]), 0.1*width, 0.25*height);
      println("note id: " + id);
    }
  }

/*
* method to call the method to render the content of the right note item
*/
  void checkItems() {
    for (NoteList noteItem : noteList) {
      if (pressTime <= 0.2 && pressTime >= 0.07) {
        if (noteItem.checkMouseOverItem()) {
          curNoteId = noteItem.noteId;
        }
      }
    }
    printNoteItem(curNoteId);
  }

/*
* method to check if a user has clicked on a note item
*/
  void checkClickOnItems() {
    boolean flag = false; 
    for (NoteList noteItem : noteList) { 
      if (pressTime <= 0.2 && pressTime >= 0.07) {
        if (noteItem.checkMouseOverItem()) {
          flag = true;
        }
      }
    }
    if (flag) {
      pageID = 1;
      startTime = 0; 
      endTime = 0; 
      timerOn = false; 
    }
  }

  void mousePress() {
    startTime = System.nanoTime();   
    timerOn = true;
    mouseReleased = false;
  }

  void mouseDrag() {
    checkMouse = true;
    // println("mousedrag");
    mouseReleased = false;
  }

  void mouseRelease() {
    mouseReleased = true;
    //  println("mouse release"); 
    if (timerOn) {
      endTime = System.nanoTime(); 
      timerOn = false;
    }
    pressTime = (endTime - startTime) / Math.pow(10, 9); 
    if (pressTime > 2)
      checkMouse = true;
    else 
    checkMouse = false; 
    println("press time: " + pressTime);
  }

  void keyPress() {
  }
}
