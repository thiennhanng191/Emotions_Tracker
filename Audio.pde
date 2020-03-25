import android.media.MediaPlayer;
import android.media.MediaMetadataRetriever;
import android.content.res.Resources;
import android.content.res.AssetFileDescriptor;
import android.content.res.AssetManager;
import android.content.Context;
import android.app.Activity;
import android.os.Bundle;
import android.util.Log;
import android.os.Environment;
import android.content.ContextWrapper;

import java.util.*;
import java.io.File; 

/**
 * Class representing the AudioPlayer Page implementing the Page interface
 */
class Audio implements Page {

  MediaPlayer audioFile = new MediaPlayer(); 

  AssetFileDescriptor fileDescriptor; 
  MediaMetadataRetriever metaRetriever = new MediaMetadataRetriever(); 

  boolean isPaused = true; 
  boolean isNextSong = false; 
  boolean audioNotFound = false; 

  String pathGlobal;

  //List<String> audioFiles = new ArrayList<String>();
  int audioIndex = 0; //current audio in audioFiles
  int audioLength = 0;
  int currentTaskID = 0; 
  int resumePosition; 
  float audioProgress; 

  Button prevButton; 
  Button nextButton; 
  Button playButton; 
  Button audioProgressButton; 
  List<Button> buttons = new ArrayList<Button>(); 

  AudioBar audioBar; 

  String[] audioFiles;
  String fileName; 
  String timePlayed;
  String timeTotal;
  String audioPlayingTitle; 

  Context context;
  Activity activity; 

  Audio() {
  }

  /**
   * method to set up the current audio player, gets called in the app's setup() metho
   */
  void pageSetup() {
    activity = getActivity();
    context = activity.getApplicationContext();
    List<File> audioFilesList = new ArrayList<File>(); 

    try {
      AssetManager mgr = context.getAssets(); 
      audioFiles = mgr.list("audio_files");
      println("audioFiles length: " + audioFiles.length); 
      for (int i = 0; i< audioFiles.length; i++) {
        println(audioFiles[i]);
        audioFilesList.add(new File(audioFiles[i]));
      }
    }
    catch (IOException e) {
      e.printStackTrace();
    }

    println("length of audioFilesList :" + audioFilesList.size());

    getCurrentAudio();
  }

  /*
  * method to render the page, called in the app's draw() method
   */
  void run() {
    background(255);
    makeButton();
    textBox(); 
    if (audioFile.isPlaying()) {
      playNextAudio();
    }
  }

  void mousePress() {
    if (width-100 <= mouseX && 100 >= mouseY) {
      state = 0;
      setup();
    } else if (checkMouseOnButtons()) {
      for (Button button : buttons) {
        if (button.mouseOverButton()) {
          currentTaskID = button.taskID;
          println("current task ID" + currentTaskID);
        }
      }
      executeTask(currentTaskID);
    } else if (checkAudioBar()) {
      currentTaskID = audioBar.taskID;
      executeTask(currentTaskID);
    }
  }
  void mouseDrag() {
  }
  void keyPress() {
  }
  int getState() {
    return 2;
  }

  /*
  * method to render buttons on the page
  */
  void makeButton() {
    buttons.clear(); //clear the button arrays every time new buttons are rendered to enhance the rendering's performance

    String playButtonText = isPaused ? ">":"||"; 
    playButton = new Button(0.5*width, 0.8*height, 45, playButtonText, 0);

    nextButton = new Button(0.6*width, 0.8*height, 45, ">|", 1);
    prevButton = new Button(0.4*width, 0.8*height, 45, "|<", 2);

    audioBar = new AudioBar(0.5*width, 0.72*height, 0.85*width, 0.01*height, color(0, 0, 0, 20), 3); 


    if ((mousePressed && nextButton.mouseOverButton()) || (mousePressed && prevButton.mouseOverButton())) {
      audioProgress = audioBar.xPos - 0.5*(audioBar.audioBarWidth);
    } else {
      audioProgress = map(audioFile.getCurrentPosition(), 0, audioFile.getDuration(), audioBar.xPos - 0.5*(audioBar.audioBarWidth), audioBar.xPos + 0.5*(audioBar.audioBarWidth));
    }

    audioProgressButton = new Button(audioProgress, audioBar.yPos, 10, "", 4);
    buttons.add(audioProgressButton); 

    buttons.add(playButton); 
    buttons.add(nextButton); 
    buttons.add(prevButton); 

    for (Button button : buttons) {
      button.display();
    }

    audioBar.display();
  }

  /*
   * method to check if the audio file input is acceptable
   * (that is the audio file has the extenstion ".mp3" or ".wav")
   */
  boolean acceptableAudio(String audioFile) {
    if (audioFile == null) 
      return false; 
    else {
      audioFile = trim(audioFile); 
      println("file name:" + audioFile); 
      if (audioFile.equals(""))
        return false; 
      else {
        String audioType = audioFile.substring(audioFile.length() - 4).toLowerCase(); 
        println("file extension:" + audioType + "check"); 
        if (audioType.equals(".mp3") || audioType.equals(".wav")) {
          return true;
        }
        return false;
      }
    }
  }

  /*
  * method to check if the mouse (or the user's touch) is on a button
  */
  boolean checkMouseOnButtons() {
    boolean boolFlag = false; 
    for (Button button : buttons) {
      if (button.mouseOverButton()) {
        boolFlag = true;
      }
    }
    return boolFlag;
  }

 /*
  * method to check if the mouse (or the user's touch) is on the audio bar
  */
  boolean checkAudioBar() {
    float leftSideX = audioBar.xPos - 0.5*audioBar.audioBarWidth;
    float rightSideX = audioBar.xPos + 0.5*audioBar.audioBarWidth; 
    float topY = audioBar.yPos -0.5*audioBar.audioBarHeight; 
    float bottomY = audioBar.yPos + 0.5*audioBar.audioBarHeight; 
    return (mouseX >=leftSideX) && (mouseX<=rightSideX)
      && (mouseY >= topY) && (mouseY<=bottomY);
  }


/*
* method to render text box for the audio's duration and length
*/ 
  void textBox() {
    fill(100); 
    textAlign(LEFT); 

    audioPlayingTitle = metaRetriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_TITLE); 
    text(audioPlayingTitle, audioBar.xPos - 0.5*audioBar.audioBarWidth, 0.2*height); 

    textSize(22); 
    timePlayed = timeConverter(audioFile.getCurrentPosition()); 
    text(timePlayed, audioBar.xPos - 0.5*audioBar.audioBarWidth, audioBar.yPos - 10); 

    textAlign(RIGHT); 
    timeTotal = timeConverter(audioFile.getDuration()); 
    text(timeTotal, audioBar.xPos + 0.5*audioBar.audioBarWidth, audioBar.yPos - 10);
  }

  /*
  * method to execute tasks corresponding to the button's id
  */
  void executeTask(int taskID) {
    switch(taskID) {
    case 0:
      isNextSong = false; 
      if (audioFile.isPlaying()) {
        audioFile.pause(); 
        isPaused=true;
      } else {
        resumePosition = audioFile.getCurrentPosition(); 
        audioFile.seekTo(resumePosition);
        audioFile.start(); 
        isPaused= false;
      }
      break;

    case 1:
      audioIndex++;
      isNextSong = true; 
      if (audioIndex >= audioFiles.length)
        audioIndex = 0; 
      if (isPaused)
        isPaused =false; 
      getCurrentAudio();
      break;

    case 2: 
      audioIndex--; 
      isNextSong = true; 
      if (audioIndex < 0)
        audioIndex = audioFiles.length-1;
      if (isPaused)
        isPaused =false; 
      getCurrentAudio(); 
      //makeButton(); 
      break;

    case 3: 
      int newAudioPos = int(map(mouseX, audioBar.xPos - 0.5*audioBar.audioBarWidth, audioBar.xPos + 0.5*audioBar.audioBarWidth, 0, (float) audioFile.getDuration()));
      audioFile.seekTo(newAudioPos); 
      //makeButton(); 
      break; 

    default: 
      println("error"); 
      break;
    }
  }

/*
* method to run the next audio
*/
  void playNextAudio() {
    if (timeConverter(audioFile.getCurrentPosition()).equals(timeConverter(audioFile.getDuration()))) {
      ; 
      executeTask(1);
    }
  }

/*
* method to convert time in milliseconds to the hh:mm:ss format
*/
  String timeConverter(int audioTime) {
    String time; 
    float sec; 
    int min;

    sec = audioTime/1000; 
    min = floor(sec / 60); 
    sec = floor(sec % 60); 

    if (min > 59) {
      int hrs = floor(min / 60); 
      min = floor(min / 60); 
      time = "" + hrs + ":" + nf(int(sec), 2);
    } else {
      time = "" + min + ":" + nf(int(sec), 2);
    }
    return time;
  }

  /*
  * method to get the current audio being played
  */
  void getCurrentAudio() {

    if (audioFiles.length>0) {
      fileName = "audio_files/" + audioFiles[audioIndex]; 
      println("file name" + fileName); 
      println("check audioFiles length " +audioFiles.length); 

      if (acceptableAudio(audioFiles[audioIndex])) {
        //stop previous audio if there is one
        if (audioFile != null ) {
          audioFile.stop(); 
          audioFile.reset();
          println("null in next song"); 
          //audioFile.release(); 

          //audioFile = null; 
          //.stop();
          // audioFile.reset();
        } 
        // audioFile.reset();
        audioNotFound = false; 
        println("File being played" + audioFiles[audioIndex]); 

        try {
          //audioFile.reset();
          println("checkpoint"); 
          fileDescriptor = context.getAssets().openFd(fileName);
          audioFile.setDataSource(fileDescriptor.getFileDescriptor(), fileDescriptor.getStartOffset(), fileDescriptor.getLength());
          metaRetriever.setDataSource(fileDescriptor.getFileDescriptor(), fileDescriptor.getStartOffset(), fileDescriptor.getLength());
          fileDescriptor.close();
          audioFile.prepare();
          //audioFile.start();
          //playNextAudio();
        }
        catch (IllegalArgumentException e) {
          e.printStackTrace();
        }
        catch (IllegalStateException e) {
          e.printStackTrace();
        } 
        catch (IOException e) {
          e.printStackTrace();
        }

      } else {
        println("there something wrong with the audio file" + audioFiles[audioIndex]);
      }
    } else {
      println("No audio file found!"); 
      audioNotFound = true;
    }
  }

  void mouseRelease() {
  }
}
