class Chicken {
  int x, y, w, h, speed;

  Chicken (int x, int y) {
    this.x = x;
    this.y = y;
    w = 30;
    h = 30;
    speed = int(random(1, 5));
  }

  void display() {
    fill(245, 200, 60);
    rect(x, y, 25, 28, 5);
    rect(x+5,y+1,15,15);
    fill(220, 50, 40);
    rect(x+10,y+5,5,10);
    fill(255, 140, 0);  
    rect(x+9, y-8, 7, 10);
  }
}
