AEC Aec; 

void setup() { 
  size(1200, 400); 
  
  aec = new AEC();
  aec.init();
} 


void draw() { 
  aec.beginDraw();  
  
  
  aec.endDraw();
  aec.drawSides();
}
