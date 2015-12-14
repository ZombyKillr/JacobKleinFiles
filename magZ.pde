//Theme: Zombies
//Use WASD to move
//Click to shoot
//Different guns affect your speed and crosshair size
//Special zombies could spawn in, that do different things. *COULD NOT ADD IN TIME*

Player myPlayer;
TimerforSpawning myTimer;
Zombies myZombies;
MainMenu theMenu;
Store theStore;
Shooting myShooting;
Dead isDead;
boolean menu = true;
boolean game = false;
boolean store = false;
int gun = 1;
boolean shooting = false;
boolean dead = false;

void setup() {
  size(800, 600); //width, height
  myPlayer = new Player();
  theMenu = new MainMenu();
  theStore = new Store();
  myZombies = new Zombies();
  myTimer = new TimerforSpawning(1000);
  myShooting = new Shooting();
}

void draw() {

  if (menu == true && game == false && store == false) {
    theMenu.display();
    myTimer.start();
  }

  if (menu == false && game == false && store == true) {
    theStore.load();
    myTimer.start();
  }

  if (menu == false && store == false && game == true) {

    if (!myTimer.isDone()) {
      canSpawn = false;
    } else {
      canSpawn = true;
    }

    background(#2D8907);
    myShooting.crosshair();
    myPlayer.display();
    myPlayer.update();


    if (canSpawn == true) {

      myZombies.display();
      myZombies.update();
    }

    if (keyPressed == false) {
      yspeed = 0;
      xspeed = 0;
    }
  }
}

void keyPressed() { 
  //basic WASD moving
  if (key == 'w') {
    yspeed = -5;
    if (gun == 4) {
      yspeed = -3;
    }
    if (gun == 2) {
      yspeed = -7;
    }
    if (gun == 3) {
      yspeed = -4;
    }
  }
  if (key == 's') {
    yspeed = 5;
    if (gun == 4) {
      yspeed = 3;
    }
    if (gun == 2) {
      yspeed = 7;
    }
    if (gun == 3) {
      yspeed = 4;
    }
  }
  if (key == 'a') {
    xspeed = -5;
    if (gun == 4) {
      xspeed = -3;
    }
    if (gun == 2) {
      xspeed = -7;
    }
    if (gun == 3) {
      xspeed = -4;
    }
  }
  if (key == 'd') {
    xspeed = 5;
    if (gun == 4) {
      xspeed = 3;
    }
    if (gun == 2) {
      xspeed = 7;
    }
    if (gun == 3) {
      xspeed = 4;
    }
  }

  if (menu == false && game == false && store == true) {
    if (key == ' ') {
      menu = false;
      store = false;
      game = true;
    }
    if (key == 'g') {
      menu = false;
      store = false;
      game = false;
    }
  }
}

void mousePressed() {
  if (menu == true && game == false && store == false) { //clicking the play button
    if (mouseX < (width / 2) + 150 && mouseX > (width / 2) - 150 && mouseY < (height - 200) + 50 && mouseY > (height - 200) - 50) {
      menu = false;
      game = false;
      store = true;
    }
  }

  if (menu == false && game == false && store == true) { //choosing your gun
    if (mouseX < 300 && mouseX > 0 && mouseY > 0 && mouseY < 200) { //choosing beretta
      gun = 1;
    }

    if (mouseX > 400 && mouseX < 600 && mouseY > 0 && mouseY < 200) { //choosing uzi
      gun = 2;
    }

    if (mouseX > 0 && mouseX < 300 && mouseY < 480 && mouseY > 280) { //choosing desert eagle
      gun = 3;
    }

    if (mouseX > 360 && mouseX < 600 && mouseY > 280 && mouseY < height) { //choosing m4a1
      gun = 4;
    }
  }
}

class Dead {

  void display() {
    game = false;
    menu = false;
    store = false;

    background(0);
    fill(255, 0, 0);
    textSize(50);
    text("YOU HAVE DIED", 200, 200);
    text("YOU SURVIVED " + wave + " ROUNDS", 100, 240);
    text("TOTAL KILLS: " + kills, 200, 280);
  }
}

class MainMenu {

  void display() {
    background(0);
    textSize(60);
    fill(255, 0, 0);
    text("magZ", (width / 2) - 90, 50);
    text("The Fight for Survival", 90, 120); 
    text("In Game Design", 170, 180);

    rectMode(CENTER); 
    //play button
    fill(255, 0, 0);
    rect(width / 2, height - 200, 300, 100);

    textSize(50);
    fill(0);
    text("PLAY", (width / 2) - 60, height - 180);

    if (mouseX < (width / 2) + 150 && mouseX > (width / 2) - 150 && mouseY < (height - 200) + 50 && mouseY > (height - 200) - 50) { //click button
      rectMode(CENTER);
      fill(255);
      rect(width / 2, height - 200, 300, 100);

      textSize(50);
      fill(0);
      text("PLAY", (width / 2) - 60, height - 180);
    }
  }
  
  
  int playerX = 400;
int playerY = 300;
int xspeed = 0;
int yspeed = 0;
float playerHealth = 100;



class Player {

  void display() {
    fill(#000AFF);
    ellipseMode(CENTER);
    ellipse(playerX, playerY, 30, 30);
    textSize(30);
    fill(255);
    text("Health: " + round(playerHealth), 15, 35);
    text("Wave: " + wave, 600, 35);
  }

  void update() { //player cannot go outside the map
    playerX += xspeed;
    playerY += yspeed;

    if (playerX >= width) {
      playerX = width - 1;
    }
    if (playerX <= 0) {
      playerX = 1;
    }
    if (playerY <= 0) {
      playerY = 1;
    }
    if (playerY >= height) {
      playerY = height - 1;
    }
  }
}



int accuracy;


class Shooting {

  void crosshair() {
    //draw the crosshair, size is based on gun
    if (gun == 1) {
      accuracy = 20;
    }
    if (gun == 2) {
      accuracy = 15;
    }
    if (gun == 3) {
      accuracy = 30;
    }
    if (gun == 4) {
      accuracy = 40;
    }



    noFill();
    ellipseMode(CENTER);
    ellipse(mouseX, mouseY, accuracy, accuracy);
    line(mouseX, mouseY - accuracy, mouseX, mouseY + accuracy);
    line(mouseX - accuracy, mouseY, mouseX + accuracy, mouseY);
  }
}



class Store {

  PImage pistol;
  PImage deagle;
  PImage m4;
  PImage uzi;
  String gunName;

  void load() {
    background(255);
    pistol = loadImage("pistol.jpg");
    deagle = loadImage("deagle.jpg");
    m4 = loadImage("m4a1.jpg");
    uzi = loadImage("uzi.jpg");

    if (store == true) {

      image(pistol, 0, 0, 300, 200);
      fill(0);
      textSize(30);
      text("Beretta", 30, 250);
      textSize(20);
      text("Medium Accuracy", 30, 270);

      image(uzi, 400, 0, 300, 200);
      fill(0);
      textSize(30);
      text("Uzi", 400, 250);
      textSize(20);
      text("Low Accuracy, Move Faster", 400, 270);

      image(deagle, 0, 280, 300, 200);
      fill(0);
      textSize(30);
      text("Desert Eagle", 30, 500);
      textSize(20);
      text("High Accuracy, Move Slower", 30, 520);

      image(m4, 360, 280, 450, 200);
      fill(0);
      textSize(30);
      text("M4-A1", 400, 500);
      textSize(20);
      text("Highest Accuracy, Move Slowest", 400, 520);

      if (gun == 1) {
        gunName = "BERETTA";
      }

      if (gun == 2) {
        gunName = "UZI";
      }

      if (gun == 3) {
        gunName = "DESERT EAGLE";
      }

      if (gun == 4) {
        gunName = "M4-A1";
      }

      textSize(20);
      text("Your gun is: " + gunName + " Press SPACE to start", 30, 570);
    }
  }
}



class TimerforSpawning {

  int startingTime;
  int duration;

  TimerforSpawning(int totalTime) {
    duration = totalTime;
  }

  void start() {
    startingTime = millis();
  }

  boolean isDone() {
    int passedTime = millis() - startingTime;
    if (passedTime > duration) {
      return true;
    } else {
      return false;
    }
  }
}


}
