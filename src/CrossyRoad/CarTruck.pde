CarTruck {
int x;
int y;
int w;
int h;
int speed;
String direction;
}

CarTruck(int x, int y, int w, int h, int speed, String direction) {
this.x = x;
this.y = y;
this.w = w;
this.h = h;
this.speed = speed;
this.direction = direction;
}

void move() {
if (direction.equals("left")) {
x = x - speed;
} else if (direction.equals("right")) {
x = x + speed;
}
}

void display() {
System.out.println("Car/Truck at (" + x + ", " + y + ") going " + direction);
}

public static void main(String[] args) {
CarTruck truck = new CarTruck(50, 100, 60, 30, 5, "right");
truck.display();
truck.move();
truck.display();
}
}


