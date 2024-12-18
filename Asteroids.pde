class Asteroid extends Floater {
  private int rotSpeed;
  private int dilation;
  private int randColor;

  public Asteroid (int ranColor) {
    dilation = (int)(Math.random()*2)+2;
    rotSpeed = (int)(Math.random()*2)-1;
    ranColor = (int)(Math.random()*5);

      xCorners = new int[] {
        (int)(Math.random()*6)-6*dilation, 
        (int)(Math.random()*3)-9*dilation, 
        (int)(Math.random()*9)-13*dilation, 
        (int)(Math.random()*3)-17*dilation, 
        (int)(Math.random()*8)-14*dilation, 
        (int)(Math.random()*13)-6*dilation, 
        (int)(Math.random()*3)+5*dilation, 
        (int)(Math.random()*7)+10*dilation, 
        (int)(Math.random()*6)+11*dilation,
        (int)(Math.random()*11)*dilation
      };
      yCorners = new int[] {
        (int)(Math.random()*2)+12*dilation, 
        (int)(Math.random()*3)+9*dilation, 
        (int)(Math.random()*9)*dilation, 
        (int)(Math.random()*9)-9*dilation, 
        (int)(Math.random()*4)-13*dilation, 
        (int)(Math.random()*2)-14*dilation, 
        (int)(Math.random()*6)-13*dilation, 
        (int)(Math.random()*8)-13*dilation, 
        (int)(Math.random()*8)+2*dilation,
        (int)(Math.random()*5)+9*dilation
      };

      if (ranColor == 0) {
        myColor = #6c727d;
      } else if (randColor == 1) {
        myColor = #717781;
      } else if (randColor == 2) {
        myColor = #767c86;
      } else if (randColor == 3) {
        myColor = #7b818b;
      } else {
        myColor = #808690;
      }

      corners = xCorners.length;
      myCenterX = (int)(Math.random()*width);
      myCenterY = (int)(Math.random()*height);
      
      myPointDirection = (int)(Math.random()*360);

  }
  public void move() {
    turn(rotSpeed);
    super.move();
  }

  public int getDilation() {
    return dilation;
  }
/*  public double getDirectionX() { 
        return myDirectionX; 
    }
    public double getDirectionY() { 
        return myDirectionY; 
    }*/
    public double getX() { 
        return myCenterX; 
    }
    public double getY() { 
        return myCenterY; 
    }
    public double getPointDirection() {
        return myPointDirection;
    }
    public double getXSpeed(){
    return myXspeed;
  }
  public double getYSpeed(){
    return myYspeed;
  }
  public void setX(int speed) {
     myCenterX = speed;
   }
   public void setY(int speed) {
     myCenterY = speed;
   }
}
