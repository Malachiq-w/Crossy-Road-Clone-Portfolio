// Shivan Sharma
class Vehicle {
  int x, y, w, h, speed;
  boolean remove;
  color c;

  Vehicle(int x, int y) {
    this.x = x;
    this.y = y;
    remove = false;

    if (random(1) < 0.5) {
      // Car
      w = 40;
      h = 20;
      c = color(255, 0, 0);
      speed = int(random(2, 5));
    } else {
      // Truck
      w = 80;
      h = 30;
      c = color(0, 0, 255);
      speed = int(random(1, 3));
    }
  }

  void display(float camY) { // Added camY parameter for scrolling
    fill(c);
    rect(x, y + int(camY), w, h, 5);
  }

  void move() {
    x += speed;
    if (x > width) remove = true;
  }
}
