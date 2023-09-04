class MyList {

  ArrayList<IntVector> list;
  
  public MyList(int size) {
  
    list = new ArrayList<IntVector>(size);
    
  }
  
  public boolean listContains(IntVector vec) {
  
    for (int i = 0; i <= list.size() - 1; i++) {
    
      if (list.get(i).x == vec.x && list.get(i).y == vec.y) {
        return true;
      }
      
    }
    return false;
    
  }
  
  public void add(IntVector v) {
    list.add(v);
  }
  
  public void remove(int e) {
    list.remove(e);
  }
  
  public int size() {
    return list.size();
  }
  
  public IntVector get(int index) {
    return list.get(index);
  }


}
