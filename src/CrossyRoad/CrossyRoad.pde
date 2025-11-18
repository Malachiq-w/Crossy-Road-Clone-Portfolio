//Crossy Road

ArrayList<Log> logs = new ArrayList<Log>();
ArrayList<Train> trains = new ArrayList<Train>();
Chicken chicken1;

int tile = 20;

void setup() {
  size(700, 700);
  chicken1 = new Chicken(350, 600);
  logs.add(new Log(-50, 100));
  logs.add(new Log(-200, 200));
  logs.add(new Log(-350, 300));

  trains.add(new Train(100, 400));
  trains.add(new Train(-150, 445));
  trains.add(new Train(-300, 490));
}

void draw() {
  background(255);
  
  for (int i = 0; i < logs.size(); i++) {
    Log l = logs.get(i);
    l.display();
    l.move();
    if (l.remove) {
      logs.remove(i);
      logs.add(new Log(-100, l.y));
    }
  }

  for (int i = 0; i < trains.size(); i++) {
    Train t = trains.get(i);
    t.display();
    t.move();
    if (t.remove) {
      trains.remove(i);
      trains.add(new Train(-t.length, t.y));
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
