Joshua Maki
class Train {
  float x, y, length, speed;
  boolean remove;

  Train(float startX, float startY) {
    x = startX;
    y = startY;
    length = 180;
    speed = random(1, 3);
    remove = false;
  }

  void display() {
    fill(200, 0, 0);
    rect(x, y - 20, length, 40);

    fill(255, 220);
    for (int i = 0; i < 5; i++) {
      rect(x + 20 + i*30, y - 10, 20, 20);
    }
  }

  void move() {
    x += speed;
    if (x > width + length) remove = true;
  }
}
