AEC aec;

float scale;
color black = color(0);

color red = color(255, 0, 0);
color orange = color(255, 146, 0);
color yellow = color(255, 255, 0);
color green = color(0, 255, 0);
color blue = color(0, 180, 255);
color purple = color(155, 60, 255);
color pink = color(255, 0, 255);


color[] colors = {red, blue, yellow, pink, green, orange, purple};

int r;
int c;

LofID[][] face;
LofID[][] grid;

HashMap<Position, Intersection> intersectionPoints = new HashMap<>();
ArrayList<Position> LofPosition = new ArrayList<>();

int startTime;

void setup() {
  size(1200, 400);

  scale = 1;
  aec = new AEC();
  aec.init();

  background(0);
  setupPharus();

  r = 1200/aec.getScaleX(); //75
  //c = 400/aec.getScaleY(); //50
  c = (int)(400/14.8) + 3; //27

  startTime = millis();

  face = new LofID[11][c];
  grid = new LofID[r][c];
  for (int row = 0; row < r; row++) {
    for (int col = 0; col < c; col++) {
      grid[row][col] = new LofID();
    }
  }

  for (int row = 0; row < 11; row++) {
    for (int col = 2; col < c; col++ ) {
      face[row][col] = new LofID();
    }
  }
}


void draw() {

  aec.beginDraw();

  push();

  background(0);


  drawPharus();

  if (isFilled()) {
    background(0);
    for (int row = 0; row < r; row++) {
      for (int col = 0; col < c; col++) {
        grid[row][col] = new LofID();
      }
    }
  } else {

    //repeating face patterns to all sides of the facade
    for (int row = 0; row < r; row++ ) {
      for (int col = 2; col < c; col++ ) {
        if (row <= 40 && row >= 30) {
          grid[row][col] = face[row-30][col];
        } else if (row <= 30 && row >= 20) {
          grid[row][col] = face[row-20][col];
        } else if (row <= 20 && row >= 10) {
          grid[row][col] = face[row-10][col];
        } else if (row <= 10 && row >= 0) {
          grid[row][col] = face[row][col];
        }
      }
    }


  float rectOffsetPath = 0.5;


    //drawing paths
    for (int row = 0; row < r; row++) {
      for (int col = 2; col < c; col++) {
        if (grid[row][col].hasOne()) {
          noStroke();
          rectMode(CENTER);
          fill(colors[grid[row][col].getFirst()]);
          rect((row - rectOffsetPath), (col - rectOffsetPath), 1, 1);
          rect((row - rectOffsetPath + 10), (col - rectOffsetPath), 1, 1);
          rect((row - rectOffsetPath + 20), (col - rectOffsetPath), 1, 1);
          rect((row - rectOffsetPath + 30), (col - rectOffsetPath), 1, 1);
        }
      }
    }
  }

  float rectOffset = 0.5;

  //drawing intersections
  for (int row = 0; row < r; row++) {
    for (int col = 2; col < c; col++) {
      if (row >= 0 && row <= 10) {
        if (grid[row][col].isMoreThanOne()) {
          //if the intersection point already exists
          if (doesExist(row, col)) {
            Intersection temp = intersectionPoints.get(getPositionFromList(row, col));
            noStroke();
            //println(grid[row][col].getIDS().); 
            fill(mixColors(grid[row][col].getIDS()));
            rectMode(CENTER);
            rect((row - rectOffset), (col - rectOffset), temp.getSize(), temp.getSize());
            rect((row - rectOffset + 10), (col - rectOffset), temp.getSize(), temp.getSize());
            rect((row - rectOffset + 20), (col - rectOffset), temp.getSize(), temp.getSize());
            rect((row - rectOffset + 30), (col - rectOffset), temp.getSize(), temp.getSize());
          } else {
            Position temp = new Position(row, col);
            LofPosition.add(temp);
            intersectionPoints.put(temp, new Intersection(millis()));
            noStroke();
            fill(mixColors(grid[row][col].getIDS()));
            rectMode(CENTER);
            rect((row - rectOffset), (col - rectOffset), 1, 1);
            rect((row - rectOffset + 10), (col - rectOffset), 1, 1);
            rect((row - rectOffset + 20), (col - rectOffset), 1, 1);
            rect((row - rectOffset + 30), (col - rectOffset), 1, 1);
          }
        }
      }
    }
  }




  for (Position p : intersectionPoints.keySet()) {
    Intersection val = intersectionPoints.get(p);
    if ((millis() - val.getTime()) % 1500 == 0) {
      intersectionPoints.put(p, new Intersection (val.getTime(), val.getSize() + 1));
    }
  }

  pop();
  aec.endDraw();

  aec.drawSides();
}





//checks to see if there is a position with the row and col that exists in the HashMap
boolean doesExist(int row, int col) {
  if (intersectionPoints.size() > 0) {
    for (Position p : intersectionPoints.keySet()) {
      if (p.getRow() == row && p.getCol() == col) {
        return true;
      }
    }
  }
  return false;
}


Position getPositionFromList(int row, int col) {
  for (Position p : LofPosition) {
    if (p.getRow() == row && p.getCol() == col) {
      return p;
    }
  }
  return null;
}


//check to see if the whole facade has at least one id in each cell
boolean isFilled() {
  boolean filled = true;
  for (int row = 0; row < r; row++) {
    for (int col = 2; col < c; col++) {
      int x = row * aec.getScaleX();
      int y = (int) (col * 14.8);
      color c = get(x, y);
      if (black != c) {
        filled = false;
      }
    }
  }

  return filled;
}


//mixes the colors for all the ids
color mixColors(ArrayList<Integer> ids) {
  int rtemp = 0;
  int gtemp = 0;
  int btemp = 0;
  for (int i = 0; i < ids.size(); i++ ) {
    color c = colors[ids.get(i)%7];
    rtemp += red(c);
    gtemp += green(c);
    btemp += blue(c);

    if (rtemp > 255) {
      rtemp = 255;
    }

    if (gtemp > 255) {
      gtemp = 255;
    }

    if (btemp > 255) {
      btemp = 255;
    }
  }

  return color(rtemp, gtemp, btemp);
}
