AEC aec;
float scale;

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



void setup() {
  size(1200, 400);


  scale = 1;
  aec = new AEC();
  aec.init();

  background(0);
  setupPharus();

  r = 1200/aec.getScaleX();
  c = 400/aec.getScaleY();

  face = new LofID[11][c];
  grid = new LofID[r][c];
  for (int row = 0; row < r; row++) {
    for (int col = 0; col < c; col++) {
      grid[row][col] = new LofID();
    }
  }

  for (int row = 0; row < 11; row++) {
    for (int col = 0; col < c; col++ ) {
      face[row][col] = new LofID();
    }
  }
}


void draw() {

  aec.beginDraw();


  background(0);
  
 
  drawPharus(); 
  
  //repeating face patterns to all sides of the facade 
  for (int row = 0; row < r; row++ ) {
    for (int col = 0; col < c; col++ ) {
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
  
  
  //drawing paths 
  for (int row = 0; row < r; row++) {
    for (int col = 0; col < c; col++) {
      //TODO check to see if the ellipse works 
      if (grid[row][col].isMoreThanOne()) {
        print("Entereed");
        noStroke();
        fill(255);
        ellipse((int)(row - 1), (int)(col - 1), scale, scale);
      } else if (grid[row][col].sizeID() > 0) {
        noStroke();
        fill(colors[grid[row][col].getFirst()]);
        rect((int)(row - 1), (int)(col - 1), 1, 1);
      }
    }
  }


  if (second()%15 == 0) {
    scale += 1;
  }


  aec.endDraw();
  aec.drawSides();
}
