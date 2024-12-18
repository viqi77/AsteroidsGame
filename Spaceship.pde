class Spaceship extends Floater
{   
  public Spaceship() {
    corners = 6; 
//    xCorners = new int[]{14, 4, 4, -12, 4, 4};
  //    yCorners = new int[]{0, -6, -17, 0, 17, 6};
          xCorners = new int[]{13, 4, 4, -12, 4, 4};
      yCorners = new int[]{0, 17, 6, 0, -6, -17};
      myColor = color(15, 20, 200);   
      myCenterX = 250;
      myCenterY = 250;
      myXspeed = 0;
      myYspeed = 0;
     myPointDirection = 90;
  }

  public void hyperspace(){
    myCenterX = (int)(Math.random()*500);
    myCenterY = (int)(Math.random()*500);
    myXspeed = 0;
    myYspeed = 0;
    myPointDirection = (int)(Math.random()*360)+1;
  }

  public float getX(){
    return (float) myCenterX;
  }

  public float getY(){
    return (float) myCenterY;
  }
  
  public double getPointDirection(){
    return myPointDirection;
  }

  public void restart(){
    myCenterX = 250;
    myCenterY = 250;
    myXspeed = 0;
    myYspeed = 0;
    myPointDirection = 90;
  }
  
}
