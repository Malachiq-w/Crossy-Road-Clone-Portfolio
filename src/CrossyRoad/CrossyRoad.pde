// -------------------------------------------
// GLOBALS
// -------------------------------------------
char screen = 's';   // s = start, m = menu, t = settings, p = play, u = pause, g = game over, a = app stats
Button btnPlay, btnPause, btnUnpause;

// Crossy Road globals
ArrayList<Log> logs = new ArrayList<Log>();
ArrayList<Train> trains = new ArrayList<Train>();
ArrayList<Vehicle> vehicles = new ArrayList<Vehicle>();
Chicken chicken1;
int tile = 20;

// -------------------------------------------
void setup() {
  size(700, 700);
  frameRate(120);
  
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
  
  // Add initial vehicles
  vehicles.add(new Vehicle(-50, 150));
  vehicles.add(new Vehicle(-200, 250));
  vehicles.add(new Vehicle(-350, 350));
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

// Shivan Sharma
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

// Malachi Chaya
void drawPlay() {
  background(200);
  
  // Draw logs
  for (int i = logs.size() - 1; i >= 0; i--) {
    Log l = logs.get(i);
    l.display();
    l.move();
    if (l.remove) {
      logs.remove(i);
      logs.add(new Log(-100, l.y));
    }
  }

  // Draw trains
  for (int i = trains.size() - 1; i >= 0; i--) {
    Train t = trains.get(i);
    t.display();
    t.move();
    if (t.remove) {
      trains.remove(i);
      trains.add(new Train(-t.length, t.y));
    }
  }
  
  // Draw vehicles
  for (int i = vehicles.size() - 1; i >= 0; i--) {
    Vehicle v = vehicles.get(i);
    v.display();
    v.move();
    if (v.remove) {
      vehicles.remove(i);
      vehicles.add(new Vehicle(-v.w, v.y)); // respawn on the left
    }
  }

  // Draw chicken
  chicken1.display();
  
  // Draw pause button
  btnPause.display();
}

// Joshua Maki
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
