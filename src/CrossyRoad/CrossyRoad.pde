// -------------------------------------------
// GLOBALS
// -------------------------------------------
char screen = 's';   // s = start, m = menu, t = settings, p = play, u = pause, g = game over, a = app stats
Button btnPlay, btnPause, btnUnpause;

// Crossy Road globals
ArrayList<Log> logs = new ArrayList<Log>();
ArrayList<Train> trains = new ArrayList<Train>();
Chicken chicken1;
int tile = 20;

// -------------------------------------------
void setup() {
  size(700, 700);
  
  // Buttons
  btnPlay = new Button("Play Game", width/2 - 100, height/2, 200, 60); // Centered Play button
  btnPause = new Button("Pause", 550, 20, 100, 50);
  btnUnpause = new Button("Resume", width/2 - 100, height/2, 200, 60); // Centered Resume button
  
  // Initialize game objects
  chicken1 = new Chicken(350, 600);
  logs.add(new Log(-50, 100));
  logs.add(new Log(-200, 200));
  logs.add(new Log(-350, 300));

  trains.add(new Train(100, 400));
  trains.add(new Train(-150, 445));
  trains.add(new Train(-300, 490));
}

// -------------------------------------------
void draw() {
  background(255);
  
  switch(screen) {
    case 's':
      drawStart();
      break;
    case 'p':
      drawPlay();
      break;
    case 'u':
      drawPause();
      break;
    case 'g':
      drawGameOver();
      break;
    case 'a':
      drawStats();
      break;
    case 'm':
      drawMenu();
      break;
    case 't':
      drawSettings();
      break;
  }
}

// -------------------------------------------
// MOUSE CLICK HANDLER
// -------------------------------------------
void mousePressed() {
  switch(screen) {
    case 's':
      if (btnPlay.clicked()) {
        screen = 'p';
      }
      break;
    case 'p':
      if (btnPause.clicked()) {
        screen = 'u';
      }
      break;
    case 'u':
      if (btnUnpause.clicked()) {
        screen = 'p';
      }
      break;
  }
}

// -------------------------------------------
// SCREEN DRAW METHODS
// -------------------------------------------
void drawStart() {
  background(100, 160, 200); // Blue background
  textAlign(CENTER);
  
  // Game title
  textSize(64);
  fill(255);
  text("CROSSY ROAD", width/2, height/2 - 150);
  
  // Instructions
  textSize(24);
  text("Use Arrow Keys or WASD to move the chicken", width/2, height/2 - 80);
  text("Press 'P' to pause/unpause during the game", width/2, height/2 - 50);
  
  // Play button
  btnPlay.display();
}

void drawPlay() {
  background(200);
  
  // Draw logs
  for (int i = 0; i < logs.size(); i++) {
    Log l = logs.get(i);
    l.display();
    l.move();
    if (l.remove) {
      logs.remove(i);
      logs.add(new Log(-100, l.y));
    }
  }

  // Draw trains
  for (int i = 0; i < trains.size(); i++) {
    Train t = trains.get(i);
    t.display();
    t.move();
    if (t.remove) {
      trains.remove(i);
      trains.add(new Train(-t.length, t.y));
    }
  }

  // Draw chicken
  chicken1.display();
  
  // Draw pause button
  btnPause.display();
}

void drawPause() {
  background(180, 180, 255);
  textAlign(CENTER);
  textSize(48);
  fill(0);
  text("PAUSE", width/2, height/2 - 100);
  
  // Draw Resume button (centered)
  btnUnpause.display();
}

void drawGameOver() {
  background(255, 100, 100);
  textAlign(CENTER);
  textSize(48);
  fill(0);
  text("GAME OVER", width/2, height/2);
}

void drawStats() {
  background(255, 255, 150);
  textAlign(CENTER);
  textSize(48);
  fill(0);
  text("STATS", width/2, height/2);
}

void drawMenu() {
  background(120, 200, 140);
  textAlign(CENTER);
  textSize(48);
  fill(0);
  text("MENU", width/2, 50);
}

void drawSettings() {
  background(200, 150, 120);
  textAlign(CENTER);
  textSize(48);
  fill(0);
  text("SETTINGS", width/2, 50);
}

// -------------------------------------------
// KEYBOARD CONTROLS
// -------------------------------------------
void keyPressed() {
  // Toggle pause with 'P' key
  if (key == 'p' || key == 'P') {
    if (screen == 'p') screen = 'u';
    else if (screen == 'u') screen = 'p';
  }

  // Only move chicken in play screen
  if (screen == 'p') {
    if (keyCode == LEFT || key == 'A' || key == 'a') chicken1.x -= tile;
    if (keyCode == UP || key == 'W' || key == 'w') chicken1.y -= tile;
    if (keyCode == RIGHT || key == 'D' || key == 'd') chicken1.x += tile;
    if (keyCode == DOWN || key == 'S' || key == 's') chicken1.y += tile;
  }
}

// -------------------------------------------
// BUTTON CLASS
// -------------------------------------------
class Button {
  String label;
  float x, y, w, h;
  
  Button(String label, float x, float y, float w, float h) {
    this.label = label;
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  
  void display() {
    fill(100);
    rect(x, y, w, h, 10);
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(20);
    text(label, x + w/2, y + h/2);
  }
  
  boolean clicked() {
    return mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h;
  }
}
