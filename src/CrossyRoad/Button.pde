
// -------------------------------------------
// BUTTON CLASS (ADDED)
// -------------------------------------------

class Button {
  String label;
  float x, y, w, h;
  boolean hover = false;

  Button(String label, float x, float y, float w, float h) {
    this.label = label;
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }

  void display() {
    hover = isMouseHover();

    if (hover) fill(220);
    else fill(200);

    stroke(0);
    strokeWeight(2);
    rect(x, y, w, h, 12);

    fill(0);
    textAlign(CENTER, CENTER);
    textSize(20);
    text(label, x + w/2, y + h/2);
  }

  boolean isMouseHover() {
    return mouseX > x &&
           mouseX < x + w &&
           mouseY > y &&
           mouseY < y + h;
  }

  boolean clicked() {
    return isMouseHover();
  }
}
