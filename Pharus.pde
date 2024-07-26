// Version 4.1 //<>//

float cursor_size = 25;
PFont font;
int scaleFactor = 3;
int windowWidth = 1200;   //3030/scaleFactor; // for real Deep Space this should be 3030
int windowHeight = 400; //3712/scaleFactor; // for real Deep Space this should be 3712
int wallHeight =  0; //1914/scaleFactor; // for real Deep Space this should be 1914 (Floor is 1798)

boolean ShowTrack = true;
boolean ShowPath = true;
boolean ShowFeet = true;

int show = 0xffff;

/*
void settings()
 {
 size(windowWidth, windowHeight);
 //fullScreen(P2D, SPAN);
 }
 */

void setupPharus()
{
  noStroke();
  fill(0);

  font = createFont("Arial", 18);
  textFont(font, 18);
  textAlign(CENTER, CENTER);
  windowWidth = width / aec.getScaleX();
  windowHeight = height /2 / aec.getScaleY();
  wallHeight = 0; //(height / 2) / aec.getScaleY();
  initTracking(false, wallHeight); //wallHeight);
}

void drawPharus()
{
  if (ShowTrack) {
    for(TuioCursor cu: tuioClient.getTuioCursorList()) {  
      int id = cu.getCursorID(); 
      int x = (int)(cu.getScreenX(width)/120); 
      int y = (int)(cu.getScreenY(height)/14.8) + 2; 
      
      face[x][y].addID(id);
    
    }
  }
}

void keyPressedPharus() {
  switch(key)
  {
  case 'p':
    ShowPath = !ShowPath;
    break;
  case 't':
    ShowTrack = !ShowTrack;
    break;
  case 'f':
    ShowFeet = !ShowFeet;
    break;
  }

  // use keys <0> .. <9> to toggle foot drawing of tracks 0 .. 9
  if (key >= '0' && key <= '9')
  {
    show = show ^ (int)pow(2, key - '0');
  }
}
