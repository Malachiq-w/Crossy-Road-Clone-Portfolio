Train;

void setup() {
  size(600, 600);
  train = new Train(-200, 280, 3);   // start off-screen
}

void draw() {
  background(220);
  
  drawCrossroads();
  
  train.update();
  train.display();
}

class Train {
  float x, y;     // position
  float speed;    // speed
  float length;   // train length
  
  Train(float startX, float startY, float speed_) {
    x = startX;
    y = startY;
    speed = speed_;
    length = 180;
  }
  
  void update() {
    x += speed;

    // Wrap around so it keeps looping
    if (x > width + length) {
      x = -length;
    }
  }
  
  void display() {
    // Body
    fill(200, 0, 0);
    rect(x, y - 20, length, 40);

    // Windows
    fill(255, 220);
    for (int i = 0; i < 5; i++) {
      rect(x + 20 + i*30, y - 10, 20, 20);
    }
  }
}

void drawCrossroads() {
  stroke(0);
  strokeWeight(4);
  
  // Horizontal road
  fill(80);
  rect(0, 250, width, 100);
  
  // Vertical road
  rect(250, 0, 100, height);

  // Center lines
  stroke(255, 255, 0);
  strokeWeight(3);

  // Horizontal dashed line
  for (int i = 0; i < width; i += 20) {
    line(i, 300, i + 10, 300);
  }
  
  // Vertical dashed line
  for (int j = 0; j < height; j += 20) {
    line(300, j, 300, j + 10);
  }
}
