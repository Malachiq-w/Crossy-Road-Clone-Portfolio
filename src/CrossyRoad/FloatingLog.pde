class Log {
  int x, y, w, h, speed;
  boolean remove;

  Log (int x, int y) {
    this.x = x;
    this.y = y;
    w = 80;
    h = 30;
    speed = int(random(2, 4));
    remove = false;
  }

  void display() {
    fill(#341C1C);
    rect(x, y, w, h, 5);
  }

  void move() {
    x += speed;
    if (x > width) {
      remove = true;
    }
  }
}
