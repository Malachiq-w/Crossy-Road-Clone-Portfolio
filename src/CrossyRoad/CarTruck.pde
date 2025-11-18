class Vehicle {
  int x, y, w, h, speed;
  boolean remove;
  color c;

  Vehicle(int x, int y) {
    this.x = x;
    this.y = y;
    remove = false;

    // Randomly choose car or truck
    if (random(1) < 0.5) {
      // Car
      w = 40;
      h = 20;
      c = color(255, 0, 0); // red
      speed = int(random(2, 5));
    } else {
      // Truck
      w = 80;
      h = 30;
      c = color(0, 0, 255); // blue
      speed = int(random(1, 3));
    }
  }

  void display() {
    fill(c);
    rect(x, y, w, h, 5); // Rounded corners like Log
  }

  void move() {
    x += speed;
    if (x > width) {
      remove = true;
    }
  }
}
