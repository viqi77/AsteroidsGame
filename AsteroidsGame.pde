Spaceship logan = new Spaceship();
Star [] alice = new Star[400];
ArrayList <ShootingStar> boom = new ArrayList<ShootingStar>();
ArrayList <Asteroid> rock = new ArrayList <Asteroid>() ;
ArrayList <Bullet> lance = new ArrayList<Bullet>();
int n = 0;
int t = 0;
int points = 0;
boolean mark = false;
boolean lose = false;
public void setup(){
  size(1000,600);
  for (int i =0; i < alice.length; i++){
    alice[i] = new Star();
    logan.setX(250);
    logan.setY(250);
  }
  boom.add(new ShootingStar((int)(Math.random()*300),0));
}
public void draw(){
//System.out.println(lose);
int reset = 0;
  background(0);
    for (int i = 0; i<alice.length;i++){
    alice[i].show();
    alice[i].twinkle();
  }
if (lose == false){
   points = t/5;
  for (int i = 0; i<boom.size();i++){
  if((t%501 == 0) && reset == 0){
   boom.add(new ShootingStar((int)(Math.random()*300),0));
   reset++;
  }
  }
  for (int i = 0; i<boom.size();i++){
  boom.get(i).move();
  boom.get(i).show();
  if (dist((float)(logan.getX()), (float)(logan.getY()), (float)(boom.get(i).getX()), (float)(boom.get(i).getY())) < 30) {
        //  System.out.println("hit");
          lose = true;
        }
  }
  if (n <8+(t/500)){
  for (int i =0; i < 1; i++){
    n++;
    rock.add(new Asteroid(173));
    if (dist((float)(logan.getX()), (float)(logan.getY()), (float)(rock.get(i).getX()), (float)(rock.get(i).getY())) < 50*rock.get(i).getDilation()) {
    rock.get(i).setX((int)(Math.random()*300));
    rock.get(i).setY(0);
    }
  }}

  
    for (int i = lance.size() - 1; i >= 0; i--) {
    lance.get(i).move();
    lance.get(i).show();
  }
  for (int i = 0; i < rock.size(); i++) {
    rock.get(i).show();
    rock.get(i).move();
     if (rock.get(i).getXSpeed() == 0){
    rock.get(i).accelerate(.5);
    }
  }
  ArrayList <Integer> rockRemove = new ArrayList <Integer>();
    ArrayList <Integer> lanceRemove = new ArrayList <Integer>();
    for (int i = rock.size() - 1; i >= 0; i--) {
      for (int j = lance.size() - 1; j >= 0; j--) {
        if (dist((float)(lance.get(j).getX()), (float)(lance.get(j).getY()), (float)(rock.get(i).getX()), (float)(rock.get(i).getY())) < 15*rock.get(i).getDilation()) {
          lanceRemove.add(j);
          rockRemove.add(i);
          t+=100;
        } 
        
      }
      if (dist((float)(logan.getX()), (float)(logan.getY()), (float)(rock.get(i).getX()), (float)(rock.get(i).getY())) < 30) {
        //  System.out.println("hit");
         lose = true;
          rockRemove.add(i);
           mark = true;
        }
        
    }

    for (int i : rockRemove) {
      if (i>= 0&& i<rock.size()){
      rock.remove(i);
      }
      n--;
    }
    for (int j : lanceRemove) {
     if (j>=0 && j<lance.size()){
      lance.remove(j);
    }
    }

  logan.show();
  logan.move();
  t++;
  textSize(30);
  text("Score: "+points,0,30);
}
else{
  textSize(150);
  text("Game Over!",50,150);
  textSize(100);
  text("Score: "+points,50,275);
}
}

public void keyReleased() {
 
 if (key == 'r') {
   int ding = (int)(Math.random()*500);
   int speed = (int)(Math.random()*500);
   int wilbur = (int)(Math.random()*360);
   logan.setX(ding);
   logan.setY(speed);
   logan.setYSpeed(0);
   logan.setXSpeed(0);
   logan.setDirect((double)wilbur);
 }
}
public void keyPressed() {
 if (key == 'w') {
  logan.accelerate(.5); 

 }
 
 if(key == 's') {
  logan.accelerate(-.5); 
 }
 
  if(key == 'd') {
  logan.turn(10); 
 }
 
 if(key == 'a') {
  logan.turn(-10); 
 }
 if (key == 'q'){
 logan.setXSpeed(0);
 logan.setYSpeed(0);
 }
 if(key == ' '){
 lance.add(new Bullet(logan));
 }
 if(key == 'p'){
 lose = false;
 }
}
