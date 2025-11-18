//Crossy Road
ArrayList<Log> logs = new ArrayList<Log>();
Chicken chicken1;
Log log;

int tile = 20; // tile size

void setup() {
  size(700, 700);
  chicken1 = new Chicken(350, 600);
  logs.add(new Log(-50, 100));
}

void draw() {
  background(255);
  for (int i = 0; i < logs.size(); i++) {
    Log l = logs.get(i);
    l.display();
    l.move();
    if (l.remove) {
      logs.remove(i);
      logs.add(new Log(-100, 100));
    }
  }
  chicken1.display();
}

void keyPressed() {
  println("Key:" + key);
  println("Keycode:" + keyCode);
  if (keyCode == 37 || keyCode == 65) {
    chicken1.x -= tile;
  }
  if (keyCode == 38 || keyCode == 87) {
    chicken1.y -= tile;
  }
  if (keyCode == 39 || keyCode == 68) {
    chicken1.x += tile;
  }
  if (keyCode == 40 || keyCode == 83) {
    chicken1.y += tile;
  }
}
