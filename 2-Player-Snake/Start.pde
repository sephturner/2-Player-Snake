class Start {

  int size;
  boolean start;
  IntVector screenSize;
  IntVector pos25;
  IntVector pos50;
  IntVector speedFast;
  IntVector speedSlow;
  IntVector singlePlayer;
  IntVector multiPlayerB;
  int speed;
  boolean speedPick = false;
  boolean sizePick = false;
  boolean multiPick = false;
  Vector3 lineColor = new Vector3(255, 0, 127);
  boolean rIn = false;
  boolean gIn = true;
  boolean bIn = true;
  Random random = new Random();
  boolean multiplayer;
  IntVector colorSquare;
  IntVector colorSize;
  
  public Start() {
    size = 25;
    start = true;
    screenSize = new IntVector(1250, 900);
    pos25 = new IntVector(screenSize.x/2 - 300, screenSize.y/2 - 50);
    pos50 = new IntVector(screenSize.x/2, screenSize.y/2 - 50);
    speedFast = new IntVector(screenSize.x/2 - 300, screenSize.y/2 + 100);
    speedSlow = new IntVector(screenSize.x/2, screenSize.y/2 + 100);
    singlePlayer = new IntVector(screenSize.x/2, screenSize.y/2 + 250);
    multiPlayerB = new IntVector(screenSize.x/2 - 300, screenSize.y/2 + 250);
    colorSquare = new IntVector(screenSize.x/3, screenSize.y/(3/2));
    colorSize = new IntVector(255, 100);
  }
  
  public Start(int square, IntVector sizeS) {
    size = square;
    start = true;
    screenSize = new IntVector(sizeS.x, sizeS.y);
    pos25 = new IntVector(screenSize.x/2 - 300, screenSize.y/2 - 50);
    pos50 = new IntVector(screenSize.x/2, screenSize.y/2 - 50);
    speedFast = new IntVector(screenSize.x/2 - 300, screenSize.y/2 + 100);
    speedSlow = new IntVector(screenSize.x/2, screenSize.y/2 + 100);
    singlePlayer = new IntVector(screenSize.x/2, screenSize.y/2 + 250);
    multiPlayerB = new IntVector(screenSize.x/2 - 300, screenSize.y/2 + 250);
    colorSquare = new IntVector(screenSize.x/3, screenSize.y/(3/2));
    colorSize = new IntVector(255, 100);
  }
  
  public void drawStart() {
    background(0, 0, 0);
    changeLineColor();
    fill(lineColor.x, lineColor.y, lineColor.z);
    noStroke();
    rect(0, 0, 15, screenSize.y);
    rect(0, 0, screenSize.x, 15);
    rect(screenSize.x - 15, 15, screenSize.x - 15, screenSize.y - 15);
    rect(0, screenSize.y - 15, screenSize.x, 15);
    textSize(75);
    fill(0, 255, 0);
    text("Snake", screenSize.x/2 - 95, 175);
    textSize(25);
    stroke(0, 0, 0);
    fill(255);
    text("Choose Settings", screenSize.x/2 - 90, (screenSize.y/2) - 175);
    text("Controls:\nW-A-S-D or Arrows to Move\nP to Pause / Unpause", 100, 100);
    text("Recommended:\nSmall / Fast / Multiplayer\nBig / Slow / Single Player", screenSize.x - 400, 100);
    fill(255, 0, 255);
    rect(pos25.x, pos25.y, 300, 100);
    fill(0);
    text("Small", pos25.x + 120, screenSize.y/2 + 10);
    fill(0, 255, 255);
    rect(pos50.x, pos50.y, 300, 100);
    fill(0);
    text("Big", pos50.x + 130, screenSize.y/2 + 10);
    
    fill(255, 0, 255);
    rect(speedFast.x, speedFast.y, 300, 100);
    fill(0);
    text("Fast", speedFast.x + 120, screenSize.y/2 + 160);
    fill(0, 255, 255);
    rect(speedSlow.x, speedSlow.y, 300, 100);
    fill(0);
    text("Slow", speedSlow.x + 130, screenSize.y/2 + 160);
    
    fill(255, 0, 255);
    rect(multiPlayerB.x, multiPlayerB.y, 300, 100);
    fill(0);
    text("Multiplayer", multiPlayerB.x + 90, screenSize.y/2 + 310);
    fill(0, 255, 255);
    rect(singlePlayer.x, singlePlayer.y, 300, 100);
    fill(0);
    text("Single Player", singlePlayer.x + 80, screenSize.y/2 + 310);
    
  }
  
  public void checkTouch(int x, int y) {
    if (x >= pos25.x && x <= pos25.x + 300 && y >= pos25.y && y <= pos25.y + 100) {
      size = 25;
      sizePick = true;
    } else if (x >= pos50.x && x <= pos50.x + 300 && y >= pos50.y && y <= pos50.y + 100) {
      size = 50;
      sizePick = true;
    } else if (x >= speedFast.x && x <= speedFast.x + 300 && y >= speedFast.y && y <= speedFast.y + 100) {
      speed = 7;
      speedPick = true;
    } else if (x >= speedSlow.x && x <= speedSlow.x + 300 && y >= speedSlow.y && y <= speedSlow.y + 100) {
      speed = 10;
      speedPick = true;
    } 
    
    else if (x >= multiPlayerB.x && x <= multiPlayerB.x + 300 && y >= multiPlayerB.y && y <= multiPlayerB.y + 100) {
      multiplayer = true;
      multiPick = true;
    } else if (x >= singlePlayer.x && x <= singlePlayer.x + 300 && y >= singlePlayer.y && y <= singlePlayer.y + 100) {
      multiplayer = false;
      multiPick = true;
    }
    
    if (speedPick && sizePick && multiPick) {
      start = false;
    }
    
  }
  
  public void changeLineColor() {
    if (lineColor.x >= 255) {
      rIn = false;
    } else if (lineColor.x < 0) {
      rIn = true;
    }
    if (lineColor.y >= 255) {
      gIn = false;
    } else if (lineColor.y < 0) {
      gIn = true;
    }
    if (lineColor.z >= 255) {
      bIn = false;
    } else if (lineColor.z < 0) {
      bIn = true;
    }
    
    if (rIn) {
      lineColor.x += random.nextInt(4);
    } else {
      lineColor.x -= random.nextInt(4);
    }
    if (gIn) {
      lineColor.y += random.nextInt(4);
    } else {
      lineColor.y -= random.nextInt(4);
    }
    if (bIn) {
      lineColor.z += random.nextInt(4);
    } else {
      lineColor.z -= random.nextInt(4);
    }
    
    
  }


}
