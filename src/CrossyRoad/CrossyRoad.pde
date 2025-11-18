//11 Nov 2025 | Crossy Road

Log log1;

void setup() {
  size(500, 500);
  log1 = new Log(200, 250);
  train = new Train(-200, 280, 3);   // start off-screen
}

void draw() {
  background(255);
  train.update();
  train.display();
  log1.display();
}

