class Stars {
  private int myX, myY, myColor;
  public Stars() {
    myX = (int)(Math.random()*800);
    myY = (int)(Math.random()*800);
  }
  public void show() {
    fill ((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
    ellipse (myX, myY, 5, 5);
  }
} //test
