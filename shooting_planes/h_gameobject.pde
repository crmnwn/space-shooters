abstract class GameObject{
  float x,y,vx,vy,size;
  int hp;
  color c;
  GameObject(float x, float y, float vx, float vy, float size, color c, int hp){
    this.x=x;
    this.y=y;
    this.vx=vx;
    this.vy=vy;
    this.size=size;
    this.c=c;
    this.hp=hp;
  }
  void act(){
    x+=vx;
    y+=vy;
  }
  void show(){
    fill(c);
    noStroke();
    square(x,y,size);
  }
  boolean collidingWith(GameObject obj) {
    return (dist(obj.x,obj.y,x,y) < (obj.size/2 + size/2));
  }
  boolean offScreen() {
    return x<-30||x>width+30||y<-30||y>height+30;
  }
}
class Powerups extends GameObject{
  Powerups(float x, float y){
    super(x,y,0,0.5,10,255,1);
    if(y>height) vy=0;
  }
  void act() {
    super.act();
  }
  void show() {
    image(powerup, x, y, 20,20);
  }
}
