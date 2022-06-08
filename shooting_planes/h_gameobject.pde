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
    square(x,y,size);
  }
  boolean collidingWith(GameObject obj) {
    return (dist(obj.x,obj.y,x,y) < (obj.size/2 + size/2));
  }
  boolean offScreen() {
    return x<-20||x>width+20||y<-20||y>height+20;
  }
}
