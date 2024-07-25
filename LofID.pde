class LofID {
  ArrayList<Integer> ids;

  LofID() {
    ids = new ArrayList<Integer>();
  }

  LofID(ArrayList<Integer> idsList) {
    ids = idsList;
  }
  
  void addID(int id) {
    ids.add(id); 
  }
  
  int getFirst() { 
    if(ids.size() > 0) {
      return ids.get(0);
    } else {
      return -1; 
    }
  }
  
  int sizeID() { 
    return ids.size(); 
  }
  
  boolean isMoreThanOne() {
    if (ids.size() > 1) { 
      int temp = ids.get(0); 
      for (int i = 1; i < ids.size(); i++) { 
        if (ids.get(i) != temp){
          return true; 
        }
      }
    }
    return false; 
  }
  
  

}
