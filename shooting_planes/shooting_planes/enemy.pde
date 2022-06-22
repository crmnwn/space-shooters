class Enemy1 extends GameObject{
  int cd,th;
  Enemy1(){
    super(random(width),-20,0,4,40,blue,1);
  }
  void act() {
    super.act();
    th=50;
    //managing guns
    cd++;
    if(cd>=th) {
      if(boss1==false){
      objects.add(new EnemyBullet(x,y,0,10));
      }
      if(boss1==true){
        objects.add(new EnemyBullet(x-10,y,0,10));
        objects.add(new EnemyBullet(x+10,y,0,10));
      }
      if(boss2==true){
        objects.add(new EnemyBullet(x,y,0,10));
        objects.add(new EnemyBullet(x,y,2,10));
        objects.add(new EnemyBullet(x,y,-2,10));
      }
      cd=0;
    }
    //collisions
    int i=0;
    while (i<objects.size()){
      GameObject obj=objects.get(i);
      if (obj instanceof Bullet) {
        if (collidingWith(obj)) {
          hp--;
          coin.rewind();
          coin.play();
          int g=(int)random(0,5); 
          if (g==1) {
            objects.add(new Recov(x,y));
          } else {
            objects.add(new Powerups(x,y));
          }

          //particles
            int m=0;
            while(m<30) {
              objects.add(new EnemyParticles(x,y,0,0,c));
               m++;
            }
            m=0;
        }
      }
      i++;
    }
    if(offScreen()) hp=0;

    } 
  void show() {
    image(e1, x, y, 50,50);
  }
}
class Enemy2 extends GameObject{
  int cd,th;
  Enemy2(){
    super(-20,random(height),5,0,40,green,1);
  }
  void act() {
    super.act();
    th=50;
    //managing guns
    cd++;
    if(cd>=th) {
      if(boss1==false){
      objects.add(new EnemyBullet(x,y,10,0));
      }
      if(boss1==true){
        objects.add(new EnemyBullet(x,y-10,10,0));
        objects.add(new EnemyBullet(x,y+10,10,0));
      }
      if(boss2==true){
        objects.add(new EnemyBullet(x,y,10,0));
        objects.add(new EnemyBullet(x,y,10,2));
        objects.add(new EnemyBullet(x,y,10,-2));
      }
      cd=0;
    }
    //collisions
    int i=0;
    while (i<objects.size()){
      GameObject obj=objects.get(i);
      if (obj instanceof Bullet) {
        if (collidingWith(obj)) {
          hp--;
          coin.rewind();
          coin.play();
          int g=(int)random(0,5); 
          if (g==1) {
            objects.add(new Recov(x,y));
          } else {
            objects.add(new Powerups(x,y));
          }

          //particles
            int m=0;
            while(m<30) {
              objects.add(new EnemyParticles(x,y,0,0,c));
               m++;
            }
            m=0;
          obj.hp=0;
        }
      }
      i++;
    }
    if(offScreen()) hp=0;
  }
  void show() {
    image(e2, x, y, 50,50);
  }
}
class Rock extends GameObject{
  int cd,th;
  Rock(){
    super(400,0,3,0,40,yellow,1);
    int d= (int) random(0,4);
    //up
    if (d==0) {
      x=random(width);
      y=820;
      vx=random(-5,5);
      vy=random(-1,-10);
    }
    //down
    if (d==1) {
      x=random(width);
      y=-20;
      vx=random(-5,5);
      vy=random(1,10);
    }
    //left
    if (d==2) {
      x=820;
      y=random(height);
      vx=random(-1,-10);
      vy=random(-5,5);
    }
    //right
    if (d==3) {
      x=-20;
      y=random(height);
      vx=random(1,10);
      vy=random(-5,5);
    }
  }
  void act() {
    super.act();
    //collisions
    int i=0;
    while (i<objects.size()){
      GameObject obj=objects.get(i);
      if (obj instanceof Bullet) {
        if (collidingWith(obj)) {
          hp--;
          coin.rewind();
          coin.play();
          int g=(int)random(0,5); 
          if (g==1) {
            objects.add(new Recov(x,y));
          } else {
            objects.add(new Powerups(x,y));
          }

          //particles
            int m=0;
            while(m<30) {
              objects.add(new EnemyParticles(x,y,0,0,c));
               m++;
            }
            m=0;
          obj.hp=0;
        }
      }
      i++;
    }
    if(offScreen()) hp=0;
  }
  void show() {
    image(e3, x, y, 40,40);
  }
}

class EnemyBullet extends GameObject{
  EnemyBullet(float x, float y, float vx, float vy) {
    super(x,y,vx,vy,10,red,1);
  }
}
