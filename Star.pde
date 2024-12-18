class Star //note that this class does NOT extend Floater
{
  private int myX, myY;
  private int colorone, colortwo, colorthree;
  public Star(){
    noStroke();
    myX = (int)(Math.random()*500);
    myY = (int)(Math.random()*500);
    colorone =  (int)(Math.random()*255);
    colortwo =  (int)(Math.random()*255);
    colorthree =  (int)(Math.random()*255);
  }
  public void show(){
    fill(colorone, colortwo, colorthree);
    ellipse(myX, myY, 3, 3);
  }
}
