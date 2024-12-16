Spaceship Chan = new Spaceship();
Star[] sky = new Star[200];
ArrayList <Asteroid> jacky = new ArrayList <Asteroid>();
ArrayList <Bullet> Crabtree = new ArrayList<Bullet>();
public void setup() 
{
 size(500, 500);
 for(int i = 0; i < sky.length; i++){
   sky[i] = new Star();
 }
 for(int i = 0; i < 10; i++){
   jacky.add(new Asteroid());
}
}
public void draw() 
{
 background(0);
 for(int i = 0; i < sky.length; i++){
   sky[i].show();
 }
    Chan.show();
   Chan.move();
for (int i = 0; i < jacky.size(); i++) {
    jacky.get(i).move();
    jacky.get(i).show();
    float d = dist(Chan.getX(), Chan.getY(), jacky.get(i).getCenterX(), jacky.get(i).getCenterY());
    if (d<10){
      jacky.remove(i);
    }
}

  for(int q=0; q<Crabtree.size(); q++){
    Crabtree.get(q).move();
    Crabtree.get(q).show();
  for(int i = 0; i < jacky.size(); i++) {
  float di = dist((float)Crabtree.get(q).myCenterX, (float)Crabtree.get(q).myCenterY, (float)jacky.get(i).myCenterX, (float)jacky.get(i).myCenterY);
  if(di<10){
  Crabtree.remove(q);
jacky.remove(i);
break;
    }
}
  }  


}




public void keyPressed(){
  if(keyPressed){
    if(key == 'a' || key == 'A'){
    Chan.turn(-20);
    }
    if(key == 'd' || key == 'D'){
      Chan.turn(20); }
    if(key == 'w' || key == 'W') {
      Chan.accelerate(1); }
  }
  if(key == ' '){
    Chan.restart();
  }
  if(key == 's' || key == 'S') {
     Chan.accelerate(-1);
  }
  if(key == 'h' || key == 'H'){
    Chan.hyperspace();
  }
  if(key == 'b' || key == 'B'){
  Crabtree.add(new Bullet(Chan));
  }
  if(Chan.myXspeed>10){
  Chan.myXspeed=10;
}
if(Chan.myYspeed>10){
  Chan.myYspeed=10;
}
}
