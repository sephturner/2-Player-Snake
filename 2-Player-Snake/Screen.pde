import java.util.Random;

class Screen {
  
  IntVector size;
  int[][] screenRep;
  int square;
  Snake snake1;
  Snake snake2;
  IntVector apple = new IntVector(0, 0);
  Random random = new Random();
  boolean time = true;
  int greenColor = 255;
  boolean greenIn = false;
  int blueColor = 100;
  boolean blueIn = false;
  boolean multiplayer;
  
  public Screen() {
  
    size = new IntVector(1250, 900);
    square = 25;
    initScreen();
    snake1 = new Snake();
    multiplayer = false;
  
  }
  
  public Screen(int x, int y, int z, boolean multi) {
    
    size = new IntVector(x, y);
    square = z;
    initScreen();
    snake1 = new Snake(x, y, z);
    multiplayer = multi;
    if (multiplayer) {
      snake1 = new Snake(size.x, size.y, square, size.x/square/4, size.y/square/2);
      snake2 = new Snake(size.x, size.y, square, (size.x/square/4) * 3, size.y/square/2);
    } else {
      snake1 = new Snake(size.x, size.y, square, size.x/square/2, size.y/square/2);
    }

  }
  
  
  public void initScreen() {
  
   screenRep = new int[int(size.x/square)][int(size.y/square)];
   
   for (int x = 0; x < size.x/square; x++) {
     for (int y = 0; y < size.y/square; y++) {
       
       if (x == 0 || y == 0 || x == size.x/square - 1 || y == size.y/square - 1) {
         screenRep[x][y] = 1;
       }
       else {
         screenRep[x][y] = 0;
       }
       
     }
   }
   
  }
  
  public void drawScreen() {
  
    background(0, 0, 0);
    stroke(255, 255, 255);
    line(square, square, size.x-square, square);
    line(square, square, square, size.y-square);
    line(square, size.y-square, size.x-square, size.y-square);
    line(size.x-square, square, size.x-square, size.y-square);
    fill(255, 255, 255);
    textSize(square/2);
    
    if (!multiplayer) {
      text("Score: " + snake1.score, size.x/2 - 30, square/2);
    } else {
      text("Green Score: " + snake1.score, size.x/4 - 60, square/2);
      text("Blue Score: " + snake2.score, (size.x/4 * 3) - 50, square/2);
    }
    
    noStroke();
    fill(0, greenColor, blueColor);
    
    if (snake1.motion == "up") {
      rect(int(snake1.pos.x) * square, int(snake1.pos.y) * square, square, square, square/2, square/2, 0, 0);
    }
    else if (snake1.motion == "down") {
      rect(int(snake1.pos.x) * square, int(snake1.pos.y) * square, square, square, 0, 0, square/2, square/2);
    }
    else if (snake1.motion == "left") {
      rect(int(snake1.pos.x) * square, int(snake1.pos.y) * square, square, square, square/2, 0, 0, square/2);
    }
    else {
      rect(int(snake1.pos.x) * square, int(snake1.pos.y) * square, square, square, 0, square/2, square/2, 0);
    }
    
    if (multiplayer) {
      fill(0, blueColor, greenColor);
      if (snake2.motion == "up") {
        rect(int(snake2.pos.x) * square, int(snake2.pos.y) * square, square, square, square/2, square/2, 0, 0);
      }
      else if (snake2.motion == "down") {
        rect(int(snake2.pos.x) * square, int(snake2.pos.y) * square, square, square, 0, 0, square/2, square/2);
      }
      else if (snake2.motion == "left") {
        rect(int(snake2.pos.x) * square, int(snake2.pos.y) * square, square, square, square/2, 0, 0, square/2);
      }
      else {
        rect(int(snake2.pos.x) * square, int(snake2.pos.y) * square, square, square, 0, square/2, square/2, 0);
      }
      
    }
    if (multiplayer) {
      
      for (int x = 1; x < screenRep.length - 1; x++) {
        for (int y = 1; y < screenRep[x].length - 1; y++) {
          fill(0, greenColor, blueColor);
          if ((snake1.turnUpLeft.listContains(new IntVector(x, y))) || (snake1.turnRightDown.listContains(new IntVector(x, y)))) {
            rect(x*square, y*square, square, square, 0, square/2, 0, 0);
          } else if ((snake1.turnUpRight.listContains(new IntVector(x, y))) || (snake1.turnLeftDown.listContains(new IntVector(x, y)))) {
            rect(x*square, y*square, square, square, square/2, 0, 0, 0);
          } else if ((snake1.turnDownLeft.listContains(new IntVector(x, y))) || (snake1.turnRightUp.listContains(new IntVector(x, y)))) {
            rect(x*square, y*square, square, square, 0, 0, square/2, 0);
          } else if ((snake1.turnDownRight.listContains(new IntVector(x, y))) || (snake1.turnLeftUp.listContains(new IntVector(x, y)))) {
            rect(x*square, y*square, square, square, 0, 0, 0, square/2);
          } else if ((snake2.turnUpLeft.listContains(new IntVector(x, y))) || (snake2.turnRightDown.listContains(new IntVector(x, y)))) {
            fill(0, blueColor, greenColor);
            rect(x*square, y*square, square, square, 0, square/2, 0, 0);
          } else if ((snake2.turnUpRight.listContains(new IntVector(x, y))) || (snake2.turnLeftDown.listContains(new IntVector(x, y)))) {
            fill(0, blueColor, greenColor);
            rect(x*square, y*square, square, square, square/2, 0, 0, 0);
          } else if ((snake2.turnDownLeft.listContains(new IntVector(x, y))) || (snake2.turnRightUp.listContains(new IntVector(x, y)))) {
            fill(0, blueColor, greenColor);
            rect(x*square, y*square, square, square, 0, 0, square/2, 0);
          } else if ((snake2.turnDownRight.listContains(new IntVector(x, y))) || (snake2.turnLeftUp.listContains(new IntVector(x, y)))) {
            fill(0, blueColor, greenColor);
            rect(x*square, y*square, square, square, 0, 0, 0, square/2);
          } else {
            if (screenRep[x][y] == 2 && !(x == int(snake1.pos.x) && y == int(snake1.pos.y))) {
              fill(0, greenColor, blueColor);
              rect(x*square, y*square, square, square);
            } else if (screenRep[x][y] == 4 && !(x == int(snake2.pos.x) && y == int(snake2.pos.y))) {
              fill(0, blueColor, greenColor);
              rect(x*square, y*square, square, square);
            } else if (screenRep[x][y] == 3) {
              fill(255, 0, 0);
              ellipse(x*square + square/2, y*square + square/2, square - square/5, square - square/5);
            }
          }
        }
      }
      
    } else {
      
      for (int x = 1; x < screenRep.length - 1; x++) {
        for (int y = 1; y < screenRep[x].length - 1; y++) {
          fill(0, greenColor, blueColor);
          if ((snake1.turnUpLeft.listContains(new IntVector(x, y))) || (snake1.turnRightDown.listContains(new IntVector(x, y)))) {
            rect(x*square, y*square, square, square, 0, square/2, 0, 0);
          } else if ((snake1.turnUpRight.listContains(new IntVector(x, y))) || (snake1.turnLeftDown.listContains(new IntVector(x, y)))) {
            rect(x*square, y*square, square, square, square/2, 0, 0, 0);
          } else if ((snake1.turnDownLeft.listContains(new IntVector(x, y))) || (snake1.turnRightUp.listContains(new IntVector(x, y)))) {
            rect(x*square, y*square, square, square, 0, 0, square/2, 0);
          } else if ((snake1.turnDownRight.listContains(new IntVector(x, y))) || (snake1.turnLeftUp.listContains(new IntVector(x, y)))) {
            rect(x*square, y*square, square, square, 0, 0, 0, square/2);
          } else {
            if (screenRep[x][y] == 2 && !(x == int(snake1.pos.x) && y == int(snake1.pos.y))) {
              fill(0, greenColor, blueColor);
              rect(x*square, y*square, square, square);
            }
            else if (screenRep[x][y] == 4 && !(x == int(snake2.pos.x) && y == int(snake2.pos.y))) {
              fill(0, blueColor, greenColor);
              rect(x*square, y*square, square, square);
            }
            else if (screenRep[x][y] == 3) {
              fill(255, 0, 0);
              ellipse(x*square + square/2, y*square + square/2, square - square/5, square - square/5);
            }
          }
        }
      }
      
    }
    
  }
  
  public void newApple() {
    while (screenRep[int(apple.x)][int(apple.y)] == 4 || screenRep[int(apple.x)][int(apple.y)] == 2 || apple.x == 0 || apple.y == 0) {
      apple.x = random.nextInt(int(size.x/square)-1);
      apple.y = random.nextInt(int(size.y/square)-1);
    }
  }
  
  
  public void updateScreen() {
  
    if (!multiplayer) {
      if (snake1.alive) {
        newApple();
        screenRep[int(apple.x)][int(apple.y)] = 3;
        snake1.updateSnake(screenRep);
        screenRep[int(snake1.pos.x)][int(snake1.pos.y)] = 2;
        if (snake1.removed != null) {
          screenRep[int(snake1.removed.x)][int(snake1.removed.y)] = 0;
        }
      }
    } else {
      if (snake2.alive || snake1.alive) {
        newApple();
        screenRep[int(apple.x)][int(apple.y)] = 3;
        snake1.updateSnake(screenRep);
        snake2.updateSnake(screenRep);
        screenRep[int(snake1.pos.x)][int(snake1.pos.y)] = 2;
        screenRep[int(snake2.pos.x)][int(snake2.pos.y)] = 4;
        if (snake1.removed != null) {
          screenRep[int(snake1.removed.x)][int(snake1.removed.y)] = 0;
        }
        if (snake2.removed != null) {
          screenRep[int(snake2.removed.x)][int(snake2.removed.y)] = 0;
        }
      }
    }
    
    drawScreen();
    
  }
  
  public void pause() {
    if (time == true) {
      time = false;
    }
    else {
      time = true;
    }
  }
  
  public void changeSnakeColor() {
    
    if (greenColor >= 255) {
      greenIn = false;
    } else if (greenColor <= 150) {
      greenIn = true;
    }
    
    if (greenIn) {
      greenColor += 1;
    } else {
      greenColor -= 1;
    }
    
    
    
    if (blueColor >= 150) {
      blueIn = false;
    } else if (blueColor <= 30) {
      blueIn = true;
    }
    
    if (blueIn) {
      blueColor += 1;
    } else {
      blueColor -= 1;
    }
    
  }
  
}
