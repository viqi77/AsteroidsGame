class Spaceship extends Floater {
  public Spaceship(double x, double y) {
    corners = 4;
    xCorners = new int[]{-20, 30, -20, -5};
    yCorners = new int[]{-25, 0, 25, 0};
    myColor = color(255);
    myCenterX = x;
    myCenterY = y;
    myXspeed = 0;
    myYspeed = 0;
    myPointDirection = 0;
  }
  public double getX() {
    return myCenterX;
  }
  public double getY() {
    return myCenterY;
  }
  public double getPointDirection() {
    return myPointDirection;
  }
  public void setXspeed(double x) {
    myXspeed = x;
  }
  public void setYspeed(double y) {
    myYspeed = y;
  }
  public void setCenterX(double x) {
    myCenterX = x;
  }
  public void setCenterY(double y) {
    myCenterY = y;
  }
  public void show () 
  {
    fill(myColor);
    stroke(myColor);

    translate((float)myCenterX, (float)myCenterY);

    float dRadians = (float)(myPointDirection*(Math.PI/180));

    rotate(dRadians);

    beginShape();
    for (int nI = 0; nI < corners; nI++)
    {
      vertex(xCorners[nI], yCorners[nI]);
    }
    endShape(CLOSE);
    //"unrotate" and "untranslate" in reverse order
    rotate(-1*dRadians);
    translate(-1*(float)myCenterX, -1*(float)myCenterY);
  }
} //hello
