class Bullet extends Floater{ 
  public Bullet(Spaceship theShip){
  myCenterX = theShip.getX(); 
  myCenterY = theShip.getY();
  myColor=255;
  myPointDirection = theShip.getPointDirection();
  accelerate(0.6);
}

public void show() {
  ellipse ((float)myCenterX, (float)myCenterY,10,10);
}
}
