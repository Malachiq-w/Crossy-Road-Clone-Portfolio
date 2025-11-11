class Log {
  int x, y, w, h, speed;

  Log (int x, int y) {
    this.x = x;
    this.y = y;
    w = 80;
    h = 30;
    speed = int(random(1, 5));
  }

  void display() {
    fill(#341C1C);
    rect(x, y, w, h, 5);
  }
}
