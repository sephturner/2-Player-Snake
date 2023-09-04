Start myStart = new Start();
Screen myScreen;
int highScore = 0;
String high = "";

void setup() {

  size(1250, 900);
  frameRate(100);
  
}

int frame = 0;

void draw() {
  
  if (myStart.start) {
    myStart.drawStart();
  }
  if (!myStart.start && myScreen.multiplayer) {
    if (highScore < myScreen.snake1.score) {
      highScore = myScreen.snake1.score;
      high = "Green";
    } else if (highScore < myScreen.snake2.score) {
      highScore = myScreen.snake2.score;
      high = "Blue";
    }
  } else if (!myStart.start && !myScreen.multiplayer) { 
    if (!myStart.start && highScore < myScreen.snake1.score) {
      highScore = myScreen.snake1.score;
    }
  }
  if (!myStart.start && myScreen.multiplayer) {
    if (!myStart.start && myScreen.time && (myScreen.snake1.alive || myScreen.snake2.alive)) {
      if (frame % myStart.speed == 0) {
        myScreen.updateScreen();
        textSize(myStart.size/2);
        fill(255, 255, 255);
        if (highScore == 0) {
          text("High Score:" + highScore, myScreen.size.x/2 - 65, myScreen.size.y - myStart.size/2);
        } else {
          text("High Score - " + high + ": " + highScore, myScreen.size.x/2 - 65, myScreen.size.y - myStart.size/2);
        }
      }
      frame += 1;
      myScreen.changeSnakeColor();
    }
  } else if (!myStart.start) {
    if (!myStart.start && myScreen.time && myScreen.snake1.alive) {
      if (frame % myStart.speed == 0) {
        myScreen.updateScreen();
        textSize(myStart.size/2);
        fill(255, 255, 255);
        text("High Score: " + highScore, myScreen.size.x/2 - 65, myScreen.size.y - myStart.size/2);
      }
      frame += 1;
      myScreen.changeSnakeColor();
    }
  }
  
  if (!myStart.start && !myScreen.time) {
    textSize(50);
    fill(255, 255, 255);
    text("Paused", myScreen.size.x/2 - 70, myScreen.size.y/2 - 40);
    textSize(35);
    text("P to Unpause", myScreen.size.x/2 - 100, myScreen.size.y/2 + 25);
  }
  
  if (!myStart.start && myScreen.multiplayer) {
    if (!myStart.start && !myScreen.snake1.alive && !myScreen.snake2.alive) {
      textSize(50);
      fill(255, 255, 255);
      text("Game Over", myScreen.size.x/2 - 110, myScreen.size.y/2 - 40);
      textSize(35);
      text("R to Retry", myScreen.size.x/2 - 65, myScreen.size.y/2 + 25);
    }
  } else {
    if (!myStart.start && !myScreen.snake1.alive) {
      textSize(50);
      fill(255, 255, 255);
      text("Game Over", myScreen.size.x/2 - 110, myScreen.size.y/2 - 40);
      textSize(35);
      text("R to Retry", myScreen.size.x/2 - 65, myScreen.size.y/2 + 25);
    }
  }

}

void keyPressed() {
  
  if (!myStart.start) {
    switch (key) {
      
      case 'w':
      if (myScreen.snake1.motion != "down" && myScreen.snake1.motion != "up" && myScreen.snake1.alive) {
        myScreen.snake1.vel = new IntVector(0, -1);
        myScreen.snake1.addTurn("Up");
      }
      break;
      
      case 'a':
      if (myScreen.snake1.motion != "right" && myScreen.snake1.motion != "left" && myScreen.snake1.alive) {
        myScreen.snake1.vel = new IntVector(-1, 0);
        myScreen.snake1.addTurn("Left");
      }
      break;
      
      case 's':
      if (myScreen.snake1.motion != "up" && myScreen.snake1.motion != "down" && myScreen.snake1.alive) {
        myScreen.snake1.vel = new IntVector(0, 1);
        myScreen.snake1.addTurn("Down");
      }
      break;
      
      case 'd':
      if (myScreen.snake1.motion != "left" && myScreen.snake1.motion != "right" && myScreen.snake1.alive) {
        myScreen.snake1.vel = new IntVector(1, 0);
        myScreen.snake1.addTurn("Right");
      }
      break;
      
      case 'p':
      myScreen.pause();
      break;
      
      case 'r':
      if (!myScreen.multiplayer) {
        if ((!myScreen.snake1.alive) && !myStart.start) {
          myScreen = new Screen(1250, 900, myStart.size, myStart.multiplayer);
        }
      } else {
        if ((!myScreen.snake1.alive) && !myStart.start && (!myScreen.snake2.alive)) {
          myScreen = new Screen(1250, 900, myStart.size, myStart.multiplayer);
        }
      }
      break;
    
    }
    
    if (!myScreen.multiplayer) {
      if (keyCode == UP) {
        if (myScreen.snake1.motion != "down" && myScreen.snake1.motion != "up" && myScreen.snake1.alive) {
          myScreen.snake1.vel = new IntVector(0, -1);
          myScreen.snake1.addTurn("Up");
        }
      }
      else if (keyCode == DOWN) {
        if (myScreen.snake1.motion != "up" && myScreen.snake1.motion != "down" && myScreen.snake1.alive) {
          myScreen.snake1.vel = new IntVector(0, 1);
          myScreen.snake1.addTurn("Down");
        }
      }
      else if (keyCode == LEFT) {
        if (myScreen.snake1.motion != "right" && myScreen.snake1.motion != "left" && myScreen.snake1.alive) {
          myScreen.snake1.vel = new IntVector(-1, 0);
          myScreen.snake1.addTurn("Left");
        }
      }
      else if (keyCode == RIGHT) {
        if (myScreen.snake1.motion != "left" && myScreen.snake1.motion != "right" && myScreen.snake1.alive) {
          myScreen.snake1.vel = new IntVector(1, 0);
          myScreen.snake1.addTurn("Right");
        }
      }
    }
    
  }
  
  if (myScreen.multiplayer && !myStart.start) {
    if (keyCode == UP) {
      if (myScreen.snake2.motion != "down" && myScreen.snake2.motion != "up" && myScreen.snake2.alive) {
        myScreen.snake2.vel = new IntVector(0, -1);
        myScreen.snake2.addTurn("Up");
      }
    }
    else if (keyCode == DOWN) {
      if (myScreen.snake2.motion != "up" && myScreen.snake2.motion != "down" && myScreen.snake2.alive) {
        myScreen.snake2.vel = new IntVector(0, 1);
        myScreen.snake2.addTurn("Down");
      }
    }
    else if (keyCode == LEFT) {
      if (myScreen.snake2.motion != "right" && myScreen.snake2.motion != "left" && myScreen.snake2.alive) {
        myScreen.snake2.vel = new IntVector(-1, 0);
        myScreen.snake2.addTurn("Left");
      }
    }
    else if (keyCode == RIGHT) {
      if (myScreen.snake2.motion != "left" && myScreen.snake2.motion != "right" && myScreen.snake2.alive) {
        myScreen.snake2.vel = new IntVector(1, 0);
        myScreen.snake2.addTurn("Right");
      }
    }
  }

}

void mouseClicked() {
  if (myStart.start) {
    myStart.checkTouch(mouseX, mouseY);
    myScreen = new Screen(1250, 900, myStart.size, myStart.multiplayer);
  }
}
