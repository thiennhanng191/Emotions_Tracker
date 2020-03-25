import java.io.*;
import android.os.Environment; 

/**
 * Class representing the note input from user
 */
class Text implements Page {
  boolean keyboard = false;
  String myText = "";
  String noteTitle = "";


  RectButton saveButton; 

  TextBox titleBox; 
  TextBox contentBox; 

  Text() {
  }
  void pageSetup() {
  }

  void run() {
    background(255);
    image(back, width - iconSize, 0, iconSize, iconSize);
    fill(20); 
    titleFont = createFont("Roboto-Light.ttf", 28); 
    textFont(titleFont);
    textAlign(LEFT); 
    text("Please share your thoughts and feelings! Tap to enable keyboard.", 15, 45);

    instructionFont = createFont("Roboto-Medium.ttf", 24); 
    textFont(instructionFont); 
    textAlign(LEFT);
    text("What is the title of your note?", 15, 75);
    text("How are you feeling today?", 15, 170);
    titleBox = new TextBox(15, 95, width - 30, 45, noteTitle);
    titleBox.display(); 

    contentBox = new TextBox(15, 190, width - 30, height * 0.36, myText); 
    contentBox.display();

    saveButton = new RectButton("Save", 0.5*width, 0.75*height, 0.12*width, 0.1*height, color(100), 0);
    saveButton.display();
    clickOnSave();
  }

/*
*  method to save text input from user to a file on the sd card
*/
  void saveText(String fileName) {
    try {
      File sdCard = Environment.getExternalStorageDirectory();
      if (!sdCard.canWrite()) {
        println("sdCard cannot write");
      }
      println("state " + Environment.getExternalStorageState()); 
      File dir = new File (sdCard.getAbsolutePath(), "note_items");
      if (!dir.exists()) {
        dir.mkdirs();
      }
      File noteFile = new File (dir, fileName + ".txt"); 
      FileWriter fw = new FileWriter(noteFile); 
      String textData = myText; 
      fw.write(textData);
      fw.flush(); 
      fw.close();
    }
    catch (FileNotFoundException e) {
      e.printStackTrace();
    } 
    catch (IOException e) {
      e.printStackTrace();
    }
  }

/*
* method to check if the user click on the save button
*/
  void clickOnSave() {
    if (mousePressed && saveButton.checkMouseOverButton()) {
      saveText(noteTitle);
      noteTitle = "";
      myText = "";
    }
  }


  void keyPress() {
    if (contentBox.checkMouseOverBox()) {
      println("checkpoint"); 
      myText = inputField(myText); 
      println("my text" + myText);
    } else if (titleBox.checkMouseOverBox()) {
      println("checkpoint notetitle");
      noteTitle = inputField(noteTitle);
    }
  }
  
  /*
  * method to return the text input from user's press on the virtual keyboard
  */
  String inputField(String text) {
    if (keyCode == BACKSPACE) {
      if (text.length() > 0) {
        text = text.substring(0, text.length()-1);
      }
    } else if (keyCode == DELETE) {
      //myText = "";
      println("check delete");
      text = text.substring(0, text.length()-2);
    } else {
      text = text + key;
      println("checkpoint text");
      println("text: " + text);
    }
    return text;
  }

  void mousePress() {
    if (width-100 <= mouseX && 100 >= mouseY) {
      state = 0;
      setup();
    } /*else if (saveButton.checkMouseOverButton()) {
      saveText(noteTitle);
      noteTitle = "";
      myText = "";
      
    }*/ else if (!keyboard) {
      //showVirtualKeyboard(); 
      openKeyboard();
      keyboard = true;
    } else {
      println("close Keyboard"); 
      closeKeyboard();
      keyboard = false;
    }
  }

  void mouseDrag() {
  }
  void mouseRelease() {
  }
}
