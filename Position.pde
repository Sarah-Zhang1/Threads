class Position { 
  int row; 
  int col; 
  
  Position(int r, int c) { 
    row = r; 
    col = c; 
  }
  
  boolean isSame(int r, int c) { 
    return (row == r && col == c); 
  }
  
  int getRow() { 
    return row; 
  }
  
  int getCol() { 
    return col; 
  }
}
