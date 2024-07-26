class Intersection { 
  int startTime; 
  int size; 
  
  Intersection(int start) { 
    size = 1; 
    startTime = start; 
  } 
  
  Intersection(int start, int val) { 
    size = val; 
    startTime = start; 
  } 
  
  
  int getSize() {
    return size; 
  }
  
  int getTime() { 
    return startTime; 
  }
  
  
}
