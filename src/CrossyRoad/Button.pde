// Malachi Chaya
class Train {
  int x, y, length, height, speed;
  boolean remove;

  Train(int x, int y) {
    this.x = x;
    this.y = y;
    length = 120;
    height = 25;
    speed = int(random(2, 4));
    remove = false;
  }

  void display(float camY) { // Added camY for vertical scrolling
    fill(100, 100, 100); // Gray train body, same as original graphics
    rect(x, y + int(camY), length, height, 5);
    fill(200, 0, 0); // Windows or details
    rect(x + 10, y + 5 + int(camY), length - 20, height - 10, 3);
  }

  void move() {
    x += speed;
    if (x > width) {
      remove = true;
    }
  }
}
