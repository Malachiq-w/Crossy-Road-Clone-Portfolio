// Malachi Chaya
class Chicken {
  int x, y, w, h;

  Chicken(int x, int y) {
    this.x = x;
    this.y = y;
    w = 30;
    h = 30;
  }

  void display(float camY) { // Added camY for scrolling
    fill(245, 200, 60);
    rect(x, y + int(camY), 25, 28, 5);
    rect(x + 5, y + 1 + int(camY), 15, 15);
    fill(220, 50, 40);
    rect(x + 10, y + 5 + int(camY), 5, 10);
    fill(255, 140, 0);
    rect(x + 9, y - 8 + int(camY), 7, 10);
  }

  boolean checkCollision(ArrayList<Vehicle> vehicles, ArrayList<Train> trains) {
    // Vehicle collision
    for (Vehicle v : vehicles) {
      if (x + w > v.x && x < v.x + v.w &&
          y + h > v.y && y < v.y + v.h) {
        return true;
      }
    }
    // Train collision
    for (Train t : trains) {
      if (x + w > t.x && x < t.x + t.length &&
          y + h > t.y - 20 && y < t.y + 20) {
        return true;
      }
    }
    return false;
  }

  boolean isOutOfBounds() {
    return x < 0 || x + w > width;
  }

  void rideLog(ArrayList<Log> logs) {
    boolean onLog = false;
    for (Log l : logs) {
      if (x + w > l.x && x < l.x + l.w &&
          y + h > l.y && y + h < l.y + l.h + 5) { // chicken standing on log
        x += l.speed; // move with the log
        onLog = true;
        break;
      }
    }
    // If chicken is in the water area and not on a log
    if (!onLog && y >= 100 && y <= 300) { // adjust according to your water row
      screen = 'g'; // game over
    }
  }
}
