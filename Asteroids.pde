class Asteroid extends Floater {
  private double rotSpeed;
  public Asteroid() {
    corners = 10;
    xCorners = new int[]{5, 0, -5, -20, -10, -15, 0, 15, 10, 20};
    yCorners = new int[]{5, 15, 5, 5, 0, -10, -5, -10, 0, 5};
    myColor = color(200, 200, 0);
    myCenterX = (int)(Math.random()*800);
    myCenterY = (int)(Math.random()*800);
    myXspeed = (int)(Math.random()*5)-2;
    myYspeed = (int)(Math.random()*5)-2;
    myPointDirection = (int)(Math.random()*360);
    rotSpeed = (int)(Math.random()*21)-10;
  }
  public void move() {
    turn(rotSpeed);
    super.move();
  }
}
