class Log {
  //Member Variables
  int x,y,w,h, speed;
  PImage l1;

  //Constructor
  Log() {
    l1 = loadImage("log1.png")

  }

  //Member Methods

  void display() {
    image(l1,x,y);
  }

void move() {
}

}
