//3 classes: Move, Timer, One you wrote yourself
//2 scenes (states)
//1 image
//Theme: Animals
//Game like Rock, Paper, Scissors. Each player picks an animal, after a few seconds, 
//the animals, and the winner, is revealed

MenuText myMenuText;
Images myImages;
Game myGame;
Reveal myReveal;


void setup() {
  size(800, 600);
  myMenuText = new MenuText();
  myImages = new Images();
  myGame = new Game();
}

void draw() {
  background(#AD6B00);
  myMenuText.showText();
  myImages.showImage();

  //game screen
  if (menu == false && game == true) {
    myGame.showAnimalChoices();
    myGame.turns();
    myGame.keyPressed();
  }
  //winner screen
  if (myGame.player1turn == false && myGame.player2turn == false && myGame.pause == false) {
    menu = false;
    game = false;
    myReveal = new Reveal(6000);
    textSize(50);
    fill(#FC0303);
    text("And the winner is...", 150, 100);



    // 1 = turtle, 2 = rabbit, 3 = eagle

    //revealing choices
    if (myReveal.isFinished() == true) {
      if (myGame.player1choice == 1) {
        textSize(30);
        fill(#3AFF00);
        text("Player 1 chose Turtle!", 50, 300);
      }
      if (myGame.player1choice == 2) {
        textSize(30);
        fill(#743C04);
        text("Player 1 chose Rabbit!", 50, 300);
      }
      if (myGame.player1choice == 3) {
        textSize(30);
        fill(#CDD1CA);
        text("Player 1 chose Eagle!", 50, 300);
      }
      if (myGame.player2choice == 1) {
        textSize(30);
        fill(#3AFF00);
        text("Player 2 chose Turtle!", 450, 300);
      }
      if (myGame.player2choice == 2) {
        textSize(30);
        fill(#743C04);
        text("Player 2 chose Rabbit!", 450, 300);
      }
      if (myGame.player2choice == 3) {
        textSize(30);
        fill(#CDD1CA);
        text("Player 2 chose Eagle!", 450, 300);
      }
      //show winner
      //PLAYER 1 WINS           
      if (myGame.player1choice == 1 && myGame.player2choice == 2) {
        textSize(50);
        fill(#FC0303);
        text("Player 1 Wins!", 200, 500);
      }
      if (myGame.player1choice == 2 && myGame.player2choice == 3) {
        textSize(50);
        fill(#FC0303);
        text("Player 1 Wins!", 200, 500);
      }
      if (myGame.player1choice == 3 && myGame.player2choice == 1) {
        textSize(50);
        fill(#FC0303);
        text("Player 1 Wins!", 200, 500);
      }
      //PLAYER 2 WINS
      if (myGame.player2choice == 1 && myGame.player1choice == 2) {
        textSize(50);
        fill(#FC0303);
        text("Player 2 Wins!", 200, 500);
      }
      if (myGame.player2choice == 2 && myGame.player1choice == 3) {
        textSize(50);
        fill(#FC0303);
        text("Player 2 Wins!", 200, 500);
      }
      if (myGame.player2choice == 3 && myGame.player1choice == 1) {
        textSize(50);
        fill(#FC0303);
        text("Player 2 Wins!", 200, 500);
      }
      //TIE GAME
      if (myGame.player2choice == 1 && myGame.player1choice == 1) {
        textSize(50);
        fill(#FC0303);
        text("It's a Tie!", 200, 500);
      }
      if (myGame.player2choice == 2 && myGame.player1choice == 2) {
        textSize(50);
        fill(#FC0303);
        text("It's a Tie!", 200, 500);
      }
      if (myGame.player2choice == 3 && myGame.player1choice == 3) {
        textSize(50);
        fill(#FC0303);
        text("It's a Tie!", 200, 500);
      }
    }
  }
}


//Clicking buttons
void mousePressed() {
  if (mouseX > 120 && mouseX < 720 && mouseY > 70 && mouseY < 230) {
    menu = false;
    game = true;
  }

  if (mouseX > 120 && mouseX < 720 && mouseY < 620 && mouseY > 460) {
    exit();
  }
}

class Game {

  //    turtle, rabbit, eagle


  boolean player1turn = true;
  boolean player2turn = false;
  boolean pause = false;
  int player1choice;
  int player2choice;

  void showAnimalChoices() {
    textSize(60);
    fill(#3AFF00);
    text("TURTLE (PRESS T)", 180, 100);
    fill(#743C04);
    text("RABBIT (PRESS R)", 180, 200);
    fill(#CDD1CA);
    text("EAGLE (PRESS E)", 180, 300);
    textSize(25);
    fill(#FC0303);
    text("Turtle outruns Rabbit, Rabbit catches Eagle, Eagle picks up Turtle", 1, 370);
  }


  void turns() {
    if (player1turn == true && pause == false) {
      textSize(40);
      text("Player 1, choose your animal!", 150, 450);
    }

    if (pause == true) {
      textSize(20);
      text("Player 1, look away! Player 2, press space to start your turn!", 100, 450);
    }

    if (player2turn == true && pause == false) {
      textSize(40);
      text("Player 2, choose your animal!", 150, 450);
    }
  }

  void keyPressed() {
    if (player1turn == true && key == 't') {
      player1choice = 1;
      player1turn = false;
      player2turn = false;
      pause = true;
    } else if (player1turn == true && key == 'r') {
      player1choice = 2;
      player1turn = false;
      player2turn = false;
      pause = true;
    } else if (player1turn == true && key == 'e') {
      player1choice = 3;
      player1turn = false;
      player2turn = false;
      pause = true;
    }

    if (player1turn == false && player2turn == false && pause == true && key == ' ') {
      player1turn = false;
      pause = false;
      player2turn = true;
    }

    if (player2turn == true && key == 't') {
      player2choice = 1;
      player1turn = false;
      player2turn = false;
      pause = false;
    } else if (player2turn == true && key == 'r') {
      player2choice = 2;
      player1turn = false;
      player2turn = false;
      pause = false;
    } else if (player2turn == true && key == 'e') {
      player2choice = 3;
      player1turn = false;
      player2turn = false;
      pause = false;
    }
  }
}

PImage animalsPic;
int imageX = 10;
boolean edge = false;
int speed;
class Images {

  void showImage() {
    if (menu == true && game == false) {
      if (imageX >= width - 200) {
        edge = true;
      }

      if (imageX <= 0) {
        edge = false;
      }

      if (edge == false) {
        speed = 10;
      } else {
        speed = -10;
      }

      imageX = imageX + speed;

      animalsPic = loadImage("https://cloud.githubusercontent.com/assets/14265895/11695273/f391efa0-9e73-11e5-9b18-444f67f70dee.png");
      image(animalsPic, imageX, 330, 200, 150);
    }
  }
}

boolean game = false;
boolean menu = true;

class MenuText {


  void showText() {
    if (game == false && menu == true) {
      textSize(40);
      text("ZOO BATTLE", 300, 80);
      rectMode(CENTER);
      noFill();
      rect(420, 150, 300, 80);
      text("PLAY", 370, 160);
      rect(420, 540, 300, 80);
      text("QUIT", 370, 550);
      textSize(20);
      text("Select the animal for Player 1", 220, 220);
      text("Then, Select the animal for Player 2", 210, 250);
      text("Don't look when the other player is selecting an animal", 190, 280);
      text("After both players have selected, a winner will be declared", 170, 310);
    }
  }
}

class Reveal {
  int startingTime;  // When Timer started
  int finalTime;  // How long Timer should last

  // The constructor, set how long the Timer last with integer value
  Reveal(int _finalTime) {
    finalTime = _finalTime;
  }

  // Start the Timer
  void start() {
    startingTime = millis();
  }

  boolean isFinished() {
    // check how much time has passed
    int passedTime = millis() - startingTime;
    if (passedTime > finalTime) {
      return true;
    } else {
      return false;
    }
  }
}

