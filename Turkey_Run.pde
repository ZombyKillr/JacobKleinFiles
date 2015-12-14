
Turkey myTurkey;
Hunters myHunters;
Score myScore;

PImage cookedTurkey;

void setup() {
  size(800, 600);
  myTurkey = new Turkey();
  myHunters = new Hunters();
  myScore = new Score();
  myHunters.spawn();
}

void draw() {

  if (dead == false) {


    background(#FA6108);

    myScore.staticText();
    myScore.calculateScore();
    myHunters.display();
    myHunters.bulletsSpawn();
    myHunters.bulletsUpdate();
    myTurkey.display();
    myTurkey.update();


    if (keyPressed == false) {
      yspeed = 0;
      xspeed = 0;
    }
  } else {
    background(0);
    fill(255);
    textSize(50);
    text("You have died", (width / 2) - 190, height / 2);
    cookedTurkey = loadImage("https://cloud.githubusercontent.com/assets/14265895/11790872/b50ce85e-a263-11e5-820a-99e0f85edaba.png");
    image(cookedTurkey, (width / 2) - 50, (height / 2) + 30, 120, 120);
    
    
    
  }
}

void keyPressed() {
  if (key == 'w') {
    yspeed = -5;
  }
  if (key == 's') {
    yspeed = 5;
  }
  if (key == 'a') {
    xspeed = -5;
  }
  if (key == 'd') {
    xspeed = 5;
  }
}

int [] huntersX;
int [] huntersY;
int [] huntersSpeed;
int randomSpeed1;
int randomSpeed2;
int randomSpeed3;
int randomSpeed4;
int [] bulletX;
int [] bulletSpeed;
int [] bulletY;
boolean despawn0 = false;
boolean despawn1 = false;
boolean despawn2 = false;
boolean despawn3 = false;



class Hunters {
  int[] huntersX = new int [4];
  int[] huntersY = new int [4];
  int[] bulletX = new int[4];
  int[] bulletY = new int[4];
  int[] bulletSpeed = new int[4];

  void spawn() {

    huntersX[0] = 50;
    huntersX[1] = 750;
    huntersY[0] = height / 2;
    huntersY[1] = height / 2;
    huntersX[2] = 50;
    huntersX[3] = 750;
    huntersY[2] = height / 2;
    huntersY[3] = height / 2;
  }

  void display() {

    int[] huntersSpeed = new int [4];

    randomSpeed1 = (round(random(-15, 15)));
    randomSpeed2 = (round(random(-15, 15)));
    randomSpeed3 = (round(random(-15, 15)));
    randomSpeed4 = (round(random(-15, 15)));

    huntersSpeed[0] = randomSpeed1;
    huntersSpeed[1] = randomSpeed2;
    huntersSpeed[2] = randomSpeed3;
    huntersSpeed[3] = randomSpeed4;

    huntersY[0] = huntersY[0] + huntersSpeed[0];
    huntersY[1] = huntersY[1] + huntersSpeed[1];
    huntersY[2] = huntersY[2] + huntersSpeed[2];
    huntersY[3] = huntersY[3] + huntersSpeed[3];

    ellipseMode(CENTER);
    fill(#097E23);
    ellipse(huntersX[0], huntersY[0], 50, 50);
    ellipse(huntersX[1], huntersY[1], 50, 50);
    ellipse(huntersX[2], huntersY[2], 50, 50);
    ellipse(huntersX[3], huntersY[3], 50, 50);

    if (huntersY[0] < 0) {
      huntersY[0] = 0;
    }
    if (huntersY[0] > height) {
      huntersY[0] = height;
    }
    if (huntersY[1] < 0) {
      huntersY[1] = 0;
    }
    if (huntersY[1] > height) {
      huntersY[1] = height;
    }
    if (huntersY[2] < 0) {
      huntersY[2] = 0;
    }
    if (huntersY[3] > height) {
      huntersY[3] = height;
    }
  }

  void bulletsSpawn() {

    if (despawn0 == true) {

      bulletX[0] = huntersX[0];
      bulletY[0] = huntersY[0];
    }

    if (despawn1 == true) {
      bulletX[1] = huntersX[1];
      bulletY[1] = huntersY[1];
    }
    if (despawn2 == true) {
      bulletX[2] = huntersX[2];
      bulletY[2] = huntersY[2];
    }

    if (despawn3 == true) {
      bulletX[3] = huntersX[3];
      bulletY[3] = huntersY[3];
    }


    rectMode(CENTER);
    fill(255, 255, 0);
    rect(bulletX[0], bulletY[0], 30, 10);
    rect(bulletX[1], bulletY[1], 30, 10);
    rect(bulletX[2], bulletY[2], 30, 10);
    rect(bulletX[3], bulletY[3], 30, 10);
  }

  void bulletsUpdate() {

    bulletSpeed[0] = 10;
    bulletSpeed[1] = 10;
    bulletSpeed[2] = 10;
    bulletSpeed[3] = 10;


    if (bulletX[0] > width) {
      despawn0 = true;
    } else {
      despawn0 = false;
    }

    if (despawn0 == false) {
      bulletX[0] = bulletX[0] + bulletSpeed[0];
    }

    if (bulletX[1] < 0) {
      despawn1 = true;
    } else {
      despawn1 = false;
    }

    if (despawn1 == false) {
      bulletX[1] = bulletX[1] - bulletSpeed[1];
    }

    if (bulletX[2] > width) {
      despawn2 = true;
    } else {
      despawn2 = false;
    }

    if (despawn2 == false) {
      bulletX[2] = bulletX[2] + bulletSpeed[2];
    }

    if (bulletX[3] < 0) {
      despawn3 = true;
    } else {
      despawn3 = false;
    }

    if (despawn3 == false) {
      bulletX[3] = bulletX[3] - bulletSpeed[3];
    }
  }
}

boolean dead = false;
int score = 0;

class Score {

  void staticText() {
    textSize(30);
    fill(255, 255, 0);
    text("Score: " + score, (width / 2) - 100, 30);
  }

  void calculateScore() {
    if (dead == false) {
      score += 1;
    }

    if (myHunters.bulletX[0] > turkeyX && myHunters.bulletX[0] < turkeyX + 75 && myHunters.bulletY[0] > turkeyY && myHunters.bulletY[0] < turkeyY + 75) {
      dead = true;
    }

    if (myHunters.bulletX[1] > turkeyX && myHunters.bulletX[1] < turkeyX + 75 && myHunters.bulletY[1] > turkeyY && myHunters.bulletY[1] < turkeyY + 75) {
      dead = true;
    }

    if (myHunters.bulletX[2] > turkeyX && myHunters.bulletX[2] < turkeyX + 75 && myHunters.bulletY[2] > turkeyY && myHunters.bulletY[2] < turkeyY + 75) {
      dead = true;
    }

    if (myHunters.bulletX[3] > turkeyX && myHunters.bulletX[3] < turkeyX + 75 && myHunters.bulletY[3] > turkeyY && myHunters.bulletY[3] < turkeyY + 75) {
      dead = true;
    }
  }
}

int xspeed = 0;
int yspeed = 0;
int turkeyX = 400;
int turkeyY = 300;
PImage turkeyPic;

class Turkey {

  void display() {

    turkeyPic = loadImage("https://cloud.githubusercontent.com/assets/14265895/11790861/a70da022-a263-11e5-894c-9ef56a935048.png");
    image(turkeyPic, turkeyX, turkeyY, 75, 75);
  }

  void update() {
    turkeyX += xspeed;
    turkeyY += yspeed;

    if (turkeyX + 50 >= 800) {
      turkeyX = 749;
    }
    if (turkeyX <= 0) {
      turkeyX = 1;
    }
    if (turkeyY <= 0) {
      turkeyY = 1;
    }
    if (turkeyY + 50 >= 600) {
      turkeyY = 549;
    }
  }
}

