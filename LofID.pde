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
  
  boolean isOne() { 
    return ids.size() == 1; 
  }
  

}
