AEC aec;
int scale;
int count;

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


PFont font1;

// some parameters that turned out to work best for the font we're using
float FONT_SIZE = 6;
float FONT_OFFSET_Y = 0.12;
float FONT_SCALE_X = 2.669;
float FONT_SCALE_Y = 2.67;

String message = "CONNECT.";


void setup() {
  size(1200, 400);



  aec = new AEC();
  aec.init();
  count = 0;
  font1 = createFont("FreePixel.ttf", 9, false);

  background(0);
  setupPharus();

  r = 1200/aec.getScaleX();
  c = 400/aec.getScaleY();

  face = new LofID[r][10];
  grid = new LofID[r][c];
  for (int row = 0; row < r; row++) {
    for (int col = 0; col < c; col++) {
      grid[row][col] = new LofID();
    }
  }

  for (int row = 0; row < 10; row++) {
    for (int col = 0; col < c; col++ ) {
      face[row][col] = new LofID();
    }
  }
}


void draw() {

  aec.beginDraw();


  background(0);

  //if (scale > 23 && count > 3) {
  //  background(255);
  //  noStroke();

  //  fill(255, 0, 100);

  //  // determines the speed (number of frames between text movements)
  //  int frameInterval = 3;

  //  // min and max grid positions at which the text origin should be. we scroll from max (+40) to min (-80)
  //  int minPos = -150;
  //  int maxPos = 50;
  //  int loopFrames = (maxPos-minPos) * frameInterval;

  //  // vertical grid pos
  //  int yPos = 15;

  //  displayText(max(minPos, maxPos - (frameCount%loopFrames) / frameInterval), yPos);
  //} else {

  for (int row = 0; row < r; row++ ) {
    for (int col = 0; col < c; col++ ) {
      if (col <= 40 && col >= 30) {
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



  for (int row = 0; row < r; row++) {
    for (int col = 0; col < c; col++) {
      if (grid[row][col].isMoreThanOne()) {
        print("Entereed");
        noStroke();
        fill(255);
        ellipse((int)(row - 1), (int)(col - 1), scale, scale);
        count++;
      } else if (grid[row][col].sizeID() > 0) {
        noStroke();
        fill(colors[grid[row][col].getFirst()]);
        rect((int)(row - 1), (int)(col - 1), 1, 1);
      }
    }
  }
  //}



  noStroke();

  if (second()%15 == 0) {
    scale += 0.5;
  }

  drawPharus();
  aec.endDraw();
  aec.drawSides();
}


void displayText(int x, int y)
{
  // push & translate to the text origin
  pushMatrix();
  translate(x, y+FONT_OFFSET_Y);

  // scale the font up by fixed paramteres so it fits our grid
  scale(FONT_SCALE_X, FONT_SCALE_Y);
  textFont(font1);
  textSize(FONT_SIZE);

  // draw the font glyph by glyph, because the default kerning doesn't align with our grid
  for (int i = 0; i < message.length(); i++)
  {
    text(message.charAt(i), (float)i*3, 0);
  }

  popMatrix();
}
