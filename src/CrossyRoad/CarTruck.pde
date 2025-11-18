Vehicle car;
Vehicle truck;

void setup() {
  size(700, 700);

  car = new Vehicle(0, 150, 2, 40, 20, color(255, 0, 0));   // red car
  truck = new Vehicle(0, 250, 1, 80, 30, color(0, 0, 255)); // blue truck
}

void draw() {
  background(300);

  car.update();
  car.show();

  truck.update();
  truck.show();
}


class Vehicle {
  float x, y;
  float speed;
  float w, h;
  color c;

  Vehicle(float x, float y, float speed, float w, float h, color c) {
    this.x = x;
    this.y = y;
    this.speed = speed;
    this.w = w;
    this.h = h;
    this.c = c;
  }

  void update() {
    x += speed;

    // reset when off screen (loop like Crossy Road)
    if (x > width) {
      x = -w;
    }
  }

  void show() {
    fill(c);
    rect(x, y, w, h);
  }
}
