class Emotion {
  String label;
  float startAngle;
  float endAngle;
  Suggestion[] suggestion;

  Emotion(String label, float startAngle, float offset, float angleSize, Suggestion[] suggestion) {
    this.label = label;
    // offset makes a couple of thingies negative
    this.startAngle = (degrees(startAngle) + offset);
    this.endAngle = (degrees(startAngle) + angleSize + offset);
    this.suggestion = suggestion;
    // if one or more of the angles turn out negative
    if (this.startAngle < 0)  
      this.startAngle += 360;
    if (this.endAngle <= 0)
      this.endAngle += 360;
  }

  boolean isinRange(float pieAngle) {
    return (pieAngle >= startAngle && pieAngle < endAngle);
  }

  String getLabel() {
    return label;
  }

  Suggestion[] getSugg() {
    return suggestion;
  }
}
