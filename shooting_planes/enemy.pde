class Enemy extends GameObject{
  int cd,th;
  Enemy(){
    super(random(width),-20,0,5,40,yellow,1);
  }
  void act() {
    super.act();
    th=50;
    //managing guns
    cd++;
    if(cd>=th) {
      objects.add(new EnemyBullet(x,y,0,10));
      cd=0;
    }
    //collisions
    int i=0;
    while (i<objects.size()){
      GameObject obj=objects.get(i);
      if (obj instanceof Bullet) {
        if (collidingWith(obj)) {
          hp--;
          obj.hp=0;
        }
      }
      i++;
    }
    if(offScreen()) hp=0;
  }
}

class EnemyBullet extends GameObject{
  EnemyBullet(float x, float y, float vx, float vy) {
    super(x,y,vx,vy,10,yellow,1);
  }
}
