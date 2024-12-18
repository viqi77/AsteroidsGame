class Asteroid extends Floater{
  private double rotSpeed;
  private int size;
 public Asteroid(){
 rotSpeed = (Math.random()*10)-5;
 size = (int)(Math.random()*4);
 //9 inherited from floater
 corners = 6;
 xCorners = new int[]{-10*size,-13*size, -10*size,6*size, 12*size,7*size};
yCorners = new int[]{-8*size, 0*size, 9*size, 10*size, 0*size, -12*size};
 myColor = color(15, 20, 200);   
 myCenterX = (int)(Math.random()*500);
 myCenterY = (int)(Math.random()*500);
 myXspeed = (Math.random()*4)-2;
 myYspeed = (Math.random()*4)-2;
 myPointDirection = (Math.random()*360);
 }
 public void move(){
   turn(rotSpeed); 
   super.move();
 }
public float getCenterX(){
  return (float) myCenterX; }
  
  public float getCenterY(){
    return (float)myCenterY; }
     
  
}
