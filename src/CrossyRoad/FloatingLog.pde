// Malachi Chaya
class Log {
  int x, y, w, h, speed;
  boolean remove;

  Log (int x, int y) {
    this.x = x;
    this.y = y;
    w = 80;
    h = 30;
    speed = int(random(1, 2));
    remove = false;
  }

  void display(float camY) { // Added camY for scrolling
    fill(#341C1C);
    rect(x, y + int(camY), w, h, 5);
  }

  void move() {
    x += speed;
    if (x > width) {
      remove = true;
    }
  }
}
