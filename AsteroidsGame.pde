class Asteroid extends Floater {
  private double rotSpeed;
  public Asteroid(){
    rotSpeed = (int)(Math.random()*9)-4;
    myCenterX = (int)(Math.random()*1000);
    myCenterY = (int)(Math.random()*700);
    corners = 8;
    xCorners = new int[] {-9, 7, 13, 5, -11, -5, -5, 10};
    yCorners = new int[] { -5, -8, 7, 10, 8, 0, 0 ,8};
    myPointDirection = Math.random()*2*PI;
    myColor=(#d3d3d3); 
    
  }
  public void move(){
  myXspeed += Math.random()*0.1 - 0.05;
  myYspeed += Math.random()*0.1 - 0.05;
  myCenterX += myXspeed;    
  myCenterY += myYspeed;
  turn(rotSpeed);
  super.move();
  }
  public int getY(){
  return (int)myCenterY;
}  
  public int getX(){
  return (int)myCenterX;
}  
}
Spaceship ship = new Spaceship();
Star[] stars;
ArrayList <Asteroid> ast = new ArrayList <Asteroid>();
ArrayList <Bullet> bul = new ArrayList <Bullet>();
boolean Accel, Deccel, Rright, Rleft, Shoot;

  public void setup() 
  {
    size(1000,700);
    stars = new Star[200];
    for(int i = 0; i < stars.length; i++){
      stars[i] = new Star();
    }
    for(int i = 0; i < 50; i++){
      ast.add(new Asteroid());
    }
  }

public void draw() 
{
  background(81,75,75);
  for(int i = 0; i< stars.length; i++){
    stars[i].show();
  }
  if(Accel == true){
    ship.accelerate(.15);
    ship.show();
  }
  ship.move();
  ship.show();
  for(int i = 0; i < ast.size(); i++){
    ast.get(i).move();
    ast.get(i).show();
    if(dist(ship.getX(), ship.getY(), ast.get(i).getX(), ast.get(i).getY()) < 30){
      ast.remove(i);
    }
  }
  if(ast.size() < 15){
    ast.add(new Asteroid());
    ast.add(new Asteroid());
  }
  for (int i = 0; i<ast.size();i++){
    for (int j = 0; j < bul.size();j++){
      if(dist(bul.get(j).getX(), bul.get(j).getY(), ast.get(i).getX(), ast.get(i).getY())<20){
        ast.remove(i);
        bul.remove(j);
        break;
      }
    }
  }
  for (int i = 0; i< bul.size(); i++){
   bul.get(i).move();
   bul.get(i).show();
  if ((bul.get(i).getX()) > width || (bul.get(i).getX()<0) || (bul.get(i).getY() > height) || (bul.get(i).getX()< 0)){
    bul.remove(i);
  }

  }

  if(Deccel == true){
    ship.accelerate(-0.1); 
  }
  if(Accel == true){
    ship.accelerate(0.1);
  }
  if(Rright == true)ship.turn(3);
  if(Rleft == true)ship.turn(-3);
  
  
}

  public void keyPressed(){
    if(keyCode == UP){Accel=true;}
    if(keyCode == DOWN){Deccel=true;}
    if(keyCode == RIGHT){Rright=true;}
    if(keyCode == LEFT){Rleft=true;}
    if(keyCode == 32){
      bul.add(new Bullet(ship));
     
    }
    if(keyCode == 72){
      ship.setX(500);
      ship.setY(500);
      ship.setDirection(0);
      ship.setSpeed(0);
      ship.setDirection((int)(Math.random()*360));
    }
  }

  public void keyReleased(){
    if(keyCode == UP){Accel=false;}
    if(keyCode == DOWN){Deccel=false;}
    if(keyCode == RIGHT){Rright=false;}
    if(keyCode == LEFT){Rleft=false;}
    
  }
  class Bullet extends Floater {
  public Bullet(Spaceship ship){
    myCenterX = ship.getX();
    myCenterY = ship.getY();
    myPointDirection = ship.getDirection();
    myXspeed = 10* Math.cos(myPointDirection*(Math.PI/180)) + ship.getXspeed();
    myYspeed = 10* Math.sin(myPointDirection*(Math.PI/180)) + ship.getYspeed();
    myColor = #FF1F1F;
  } 
    public void show ()  
  {        
    noStroke();
    fill(myColor);       
  
    ellipse((float)(myCenterX+Math.cos(myPointDirection*(Math.PI/180))),(float)(myCenterY+Math.sin(myPointDirection*(Math.PI/180))),10,10);

    
  }   
  public int getX(){
    return (int)myCenterX;
  }
  public int getY(){
    return (int)myCenterY;
  }
  public void setDirection(double x){
    myPointDirection = x;
  }
  public double getDirection(){
    return myPointDirection;
  }
public void move(){
    myCenterX += myXspeed;
    myCenterY += myYspeed;
  }
}

