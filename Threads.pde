AEC aec;
int scale;
int x1; 
int y1; 


int x2; 
int y2; 

int lastX; 
int lastY; 

void setup() {
  size(1200, 400);
  scale = 0;

  aec = new AEC();
  aec.init();
  
  x1 = 30; 
  y1 = 0; 
  
  
  x2 = 40; 
  y2 = 0;
  
  lastX = 40; 
  lastY = 0; 
  
  frameRate(5);
}


void draw() {
  aec.beginDraw();

  strokeWeight(0.5);
  stroke(color (255, 0, 0)); 
  
  //float rand = random(1, 3);
  if (x1 < 41) { 
    x1++;  
    x2 -= 2;
  } 
  
  if (y1 < 21) { 
    y1 += 2;
    if (y2 % 2 == 0) { 
       y2 += 3;
    } else { 
      y2 += 1;
    }
    
    
  }

  line (30, 0, x1, y1); 
 

  
  
  stroke(color (144, 230, 255));
  line(lastX, lastY, x2, y2);

  lastX = x2; 
  lastY = y2; 

  if (second() % 3 == 0) {
    if (scale < 50) {
      scale++;
    }
  }

  noStroke();

  ////green
  //fill(color (0, 255, 0, 125));
  //ellipse(38, 5, scale/aec.getScaleX(), scale/aec.getScaleX());


  ////orange
  //fill(color (255, 127, 0, 125));
  //ellipse(38, 15, scale/aec.getScaleX(), scale/aec.getScaleX());


  //purple
  fill(color (255, 0, 255, 125));
  ellipse(33.5, 7.5, scale/aec.getScaleX(), scale/aec.getScaleX());





  aec.endDraw();
  aec.drawSides();
}
