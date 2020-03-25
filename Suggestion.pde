
// two fields: name and description
class Suggestion {
  String remedy;
  String description;

  Suggestion (String r, String d) {
    remedy = r;
    description = d;
  }

  void renderSuggestion() {
    // float textX = (displayWidth-textWidth(description))/4;
    // textAlign(CENTER, TOP);
    text(description, 60, height/2-50);
  }
}
