AEC aec;
int scale;


color red = color(255, 0, 0); 
color orange = color(255, 146, 0);
color yellow = color(255, 255, 0);
color green = color(0, 255, 0);
color blue = color(0, 180, 255);
color purple = color(155, 60, 255);
color pink = color(255, 0, 255); 


color[] colors = {red, blue, yellow, pink, green, orange, purple}; 

boolean isBlink; 

//73 = width 
//26 = height 
LofID[][] grid = new LofID[73][26]; 


void setup() {
  size(1200, 400);

  aec = new AEC();
  aec.init();

  background(0, 0, 0);
  setupPharus();
  
  for (int row = 0; row < 73; row++) { 
    for (int col = 0; col < 26; col++) { 
      grid[row][col] = new LofID(); 
    }
  }
  
}


void draw() {

  aec.beginDraw();

  
  //background(0, 0, 0);
  stroke(255, 126, 0); 
  strokeWeight(0.5);
  line(10, 0, 10, 20); 
  line(20, 0, 20, 20); 
  line(30, 0, 30, 20); 


  noStroke();

  if (second()%2 == 0) { 
    isBlink = true; 
  } else { 
    isBlink = false; 
  }
  
  drawPharus();
  aec.endDraw();
  aec.drawSides();
}
