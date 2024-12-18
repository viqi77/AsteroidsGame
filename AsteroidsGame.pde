Spaceship bob;
Stars[] nightSky = new Stars[200];
ArrayList <Asteroid> asteroids = new ArrayList <Asteroid>();
ArrayList <Bullet> shots = new ArrayList <Bullet>();
boolean wPressed = false;
boolean dPressed = false;
boolean aPressed = false;
int asteroidsHit = 0;
int timesCrashed = 0;
public void setup()
{
  size(800, 800);
  background(0);
  bob = new Spaceship(width/2, height/2);
  for (int i=0; i<nightSky.length; i++) {
    nightSky[i] = new Stars();
  }
  for (int i=0; i<15; i++) {
    asteroids.add(new Asteroid());
  }
}
public void draw()
{
  background(0);
  for (int i=0; i<nightSky.length; i++) {
    nightSky[i].show();
  }
  for (int i=0; i<asteroids.size(); i++) {
    asteroids.get(i).show();
    asteroids.get(i).move();
    float d = dist((float)bob.myCenterX, (float)bob.myCenterY, (float)asteroids.get(i).myCenterX, (float)asteroids.get(i).myCenterY);
    if (d < 30) {
      asteroids.remove(i);
      i--;
      asteroids.add(new Asteroid());
      timesCrashed++;
    }
  }
  for (int i=0; i<shots.size(); i++) {
    if (shots.get(i).getX() > 790 || shots.get(i).getY() > 790) {
      shots.remove(i);
    } else {
      shots.get(i).show();
      shots.get(i).move();
      for (int j=0; j<asteroids.size(); j++) {
        float d = dist((float)shots.get(i).myCenterX, (float)shots.get(i).myCenterY, (float)asteroids.get(j).myCenterX, (float)asteroids.get(j).myCenterY);
        if (d < 25) {
          asteroids.remove(j);
          shots.remove(i);
          j--;
          asteroids.add(new Asteroid());
          asteroidsHit++;
          break;
        }
      }
    }
  }
  if (wPressed == true) {
    bob.accelerate(0.25);
  }
  if (dPressed == true) {
    bob.turn(5);
  }
  if (aPressed == true) {
    bob.turn(-5);
  }
  bob.show();
  bob.move();
}

public void keyPressed() {
  if (key == 'w' || key == 'W') {
    wPressed = true;
  }
  if (key == 'd' || key == 'D') {
    dPressed = true;
  }
  if (key == 'a' || key == 'A') {
    aPressed = true;
  }
  if (key == 'r' || key == 'R') {
    bob.setCenterX(Math.random()*600);
    bob.setCenterY(Math.random()*600);
    bob.turn(Math.random()*361);
    bob.setXspeed(0);
    bob.setYspeed(0);
  }
  if (key == 'e' || key == 'E') {
    shots.add(new Bullet(bob));
  }
}

public void keyReleased() {
  if (key == 'w' || key == 'W') {
    wPressed = false;
  }
  if (key == 'd' || key == 'D') {
    dPressed = false;
  }
  if (key == 'a' || key == 'A') {
    aPressed = false;
  }
}
