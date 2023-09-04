class Snake {

  IntVector vel = new IntVector(0, -1);
  int len = 3;
  int score = 0;
  IntVector pos;
  ArrayList<IntVector> pieces = new ArrayList<IntVector>(1000);
  int pieceSize;
  IntVector screenSize;
  boolean alive = true;
  IntVector removed;
  IntVector added;
  String motion;
  MyList turnUpLeft = new MyList(1000);
  MyList turnUpRight = new MyList(1000);
  MyList turnDownLeft = new MyList(1000);
  MyList turnDownRight = new MyList(1000);
  MyList turnRightUp = new MyList(1000);
  MyList turnLeftUp = new MyList(1000);
  MyList turnRightDown = new MyList(1000);
  MyList turnLeftDown = new MyList(1000);

  public Snake() {
  
    pieceSize = 25;
    screenSize = new IntVector(1250/pieceSize, 900/pieceSize);
    pos = new IntVector(screenSize.x/2, screenSize.y/2);
    motion = "up";
  
  }
  
  public Snake(int x, int y, int z) {
    
    pieceSize = z;
    screenSize = new IntVector(x/pieceSize, y/pieceSize);
    pos = new IntVector(screenSize.x/2, screenSize.y/2);
    motion = "up";
    
  }
  
  public Snake(int x, int y, int z, int startingPosx, int startingPosy) {
    
    pieceSize = z;
    pos = new IntVector(startingPosx, startingPosy);
    screenSize = new IntVector(x/pieceSize, y/pieceSize);
    motion = "up";
    
  }
  
  
  public void updateSnake(int[][] screen) {
  
    if (vel.x == 1) {
      motion = "right";
    }
    else if (vel.x == -1) {
      motion = "left";
    }
    else if (vel.y == 1) {
      motion = "down";
    }
    else if (vel.y == -1) {
      motion = "up";
    }
    
    if (hitBad(screen, int(pos.x) + int(vel.x), int(pos.y) + int(vel.y))) {
      alive = false;
    }
    if (eat(screen)) {
      len += 3;
    }
    
    pos.x += vel.x;
    pos.y += vel.y;
    
    if (alive) {
      pieces.add(new IntVector(pos.x, pos.y));
      if (eat(screen)) {
        len += 3;
        score +=1;
      }
      if (pieces.size() > len) {
        removed = pieces.get(0);
        manageCorners();
        pieces.remove(0);
      }
    }
    
  }
  
  public boolean hitBad(int[][] screen, int x, int y) {
    
    if (screen[int(x)][int(y)] == 1 || screen[int(x)][int(y)] == 2 || screen[int(x)][int(y)] == 4) {
      vel = new IntVector(0, 0);
      return true;
    }
    else {
      return false;
    }
    
  }
  
  public void addTurn(String turnDir) {
    String theTurn = motion + turnDir;
    
    switch (theTurn) {
      
      case "upLeft":
      turnUpLeft.add(new IntVector(pos.x, pos.y));
      break;
      
      case "upRight":
      turnUpRight.add(new IntVector(pos.x, pos.y));
      break;
      
      case "downLeft":
      turnDownLeft.add(new IntVector(pos.x, pos.y));
      break;
      
      case "downRight":
      turnDownRight.add(new IntVector(pos.x, pos.y));
      break;
      
      case "rightDown":
      turnRightDown.add(new IntVector(pos.x, pos.y));
      break;
      
      case "leftDown":
      turnLeftDown.add(new IntVector(pos.x, pos.y));
      break;
      
      case "rightUp":
      turnRightUp.add(new IntVector(pos.x, pos.y));
      break;
      
      case "leftUp":
      turnLeftUp.add(new IntVector(pos.x, pos.y));
      break;
    }
  }
  
  public void manageCorners() {
    if (turnUpLeft.size() > 0 && pieces.get(0).x == turnUpLeft.get(0).x && pieces.get(0).y == turnUpLeft.get(0).y) {
      turnUpLeft.remove(0);
    } else if (turnDownLeft.size() > 0 && pieces.get(0).x == turnDownLeft.get(0).x && pieces.get(0).y == turnDownLeft.get(0).y) {
      turnDownLeft.remove(0);
    } else if (turnDownRight.size() > 0 && pieces.get(0).x == turnDownRight.get(0).x && pieces.get(0).y == turnDownRight.get(0).y) {
      turnDownRight.remove(0);
    } else if (turnUpRight.size() > 0 && pieces.get(0).x == turnUpRight.get(0).x && pieces.get(0).y == turnUpRight.get(0).y) {
      turnUpRight.remove(0);
    } else if (turnLeftUp.size() > 0 && pieces.get(0).x == turnLeftUp.get(0).x && pieces.get(0).y == turnLeftUp.get(0).y) {
      turnLeftUp.remove(0);
    } else if (turnLeftDown.size() > 0 && pieces.get(0).x == turnLeftDown.get(0).x && pieces.get(0).y == turnLeftDown.get(0).y) {
      turnLeftDown.remove(0);
    } else if (turnRightUp.size() > 0 && pieces.get(0).x == turnRightUp.get(0).x && pieces.get(0).y == turnRightUp.get(0).y) {
      turnRightUp.remove(0);
    } else if (turnRightDown.size() > 0 && pieces.get(0).x == turnRightDown.get(0).x && pieces.get(0).y == turnRightDown.get(0).y) {
      turnRightDown.remove(0);
    }
  }
  
  public boolean eat(int[][] screen) {
  
    if (screen[int(pos.x)][int(pos.y)] == 3) {
      return true;
    }
    else {
      return false;
    }
  
  }

}
