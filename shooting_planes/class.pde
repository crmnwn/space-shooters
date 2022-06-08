class Star extends GameObject{
  Star() {
    super(random(width), 0, 0, 0, random(1,5), #FFFFFF, 1);
    vy=size;
  }
  void act(){
    super.act();
    if(y>height){
      hp=0;
    }
  }
}

class Plane extends GameObject{
  int cd, th;
  Plane() {
    super(400,400,0,0,50,#FFFFFF,3);
    th=20;
    cd=th;
  }
  void act(){
    super.act();
    //managing guns
    cd++;
    if(space&&cd>=th) {
      objects.add(new Bullet());
      cd=0;
    }
    //collisions
    int i=0;
    while (i<objects.size()){
      GameObject obj=objects.get(i);
    if (obj instanceof EnemyBullet) {
        if (collidingWith(obj)) {
          hp--;
        }
        i++;
      }
    }
    //moving
    if(left==true) x=x-5;
    if(right==true) x=x+5;
    if(up==true) y=y-5;
    if(down==true) y=y+5;
    //decelerate
    if(!up && !down) vy=vy*0.9;
    if(!right && !left) vx=vx*0.9;
  }
    
}

class Bullet extends GameObject{
  Bullet(){
    super(player1.x, player1.y, 0, -10, 10, red, 1);
  }
  void act(){
    super.act();
    if(offScreen()) hp=0;
  }
}
