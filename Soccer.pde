int y = 50;
int speed;
boolean grounded = false;
int x = 100;
int ballSpeed;
boolean moving = false;
boolean crossLine = false;
boolean stopped = false;
int ballY;
int score = 0;
boolean canScore = true;
int rectHeight = 150;
int highScore;

void setup() {
  size(800, 600); 
}

void draw() {
  
  background(#26AA13);
  
  textSize(30);
  text("Score: " + score, 30, 30);
  text("High Score: " + highScore, 550, 30);
  textSize(15);
  text("Press SPACE to reset, and Q to reset score", 10, height - 10);
  
  //center line
 rect(width / 2, 0, 30, height);
  
  //Soccer Ball
  ellipse(x, ballY, 60, 60);
  
  //Goalie
  rect(650, y, 60, rectHeight);
 
  //if goalie is on bottom
  if (y >= height - rectHeight){
      grounded = true;
    }
 
 //if goalie is on top
 if (y <= 0){
   grounded = false;
 }
 
 //adjust speed
 if (grounded == true){
   speed = -25 - (5 * score);
 } else {
   speed = 25 + (5 * score);
 }
 y = y + speed;

//checks if ball is "touching" goalie on x-coordinates
if (x >= 605) {
    crossLine = true;
}

//checks the same with y-coordinate
if (crossLine == true) {
  if (ballY < y + rectHeight && ballY > y) {
    stopped = true;
    moving = false;
  }
} 
 
//allows ball to follow cursor right away
  if (moving == false){
    ballY = mouseY;
  }

//makes ball stop moving and 'stick' to goalie (catch)
if (stopped == true){
  moving = false;
  ballSpeed = 0;
  ballY = y;
}

//Ball Kick
if (moving == true){
  ballSpeed = 40;
  x = x + ballSpeed;
  }

//"Winner" appears
if (x > 799){
  for (int messages = 50; messages < 450; messages = messages + 30){
    
    fill(0);
    textSize(40);
    text("Winner!", messages + 60, messages + 60);
    fill(255);
    score();
  }
    
  }
  
if (stopped == true && moving == false && x < 799){

  x = 100;
  y = 50;
  crossLine = false;
  stopped = false;
  moving = false;
  canScore = true;
  score = 0;
  draw();
  
  
}

}
//Kick Ball
void mousePressed(){
  moving = true;
}
//Press a key to restart
void keyPressed(){
  if (key == 'q'){
    score = 0;
    highScore = 0;
  }
  
  if (key == ' '){
    
  x = 100;
  y = 50;
  crossLine = false;
  stopped = false;
  moving = false;
  canScore = true;
  draw();
  }
  
}

void score(){
  if (canScore == true){
  score = score + 1;
  canScore = false;
  }
  
  if (score > highScore){
   highScore = score; 
  }
  
  
}
