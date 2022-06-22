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
    image(p1,x,y,50,50);
    th=50;
    cd=th;
  }
  void act(){
    super.act();
    //managing guns
    cd++;
    if(space&&cd>=th) {
      objects.add(new Bullet(0,-10));
      shot.play();
      shot.rewind();
      cd=0;
      if (op==true) objects.add(new Bullet(0,10));
      if (opp==true) {
        objects.add(new Bullet(-10,0));
        objects.add(new Bullet(10,0));
      }
      if (biggun==true) {
        objects.add(new Bullet(2,-10));
        objects.add(new Bullet(-2,-10));
        objects.add(new Bullet(2,10));
        objects.add(new Bullet(-2,10));
        objects.add(new Bullet(-10,2));
        objects.add(new Bullet(-10,-2));
        objects.add(new Bullet(10,2));
        objects.add(new Bullet(10,-2));
      }
    } 
      
    //collisions
    //powerups
    int i=0;
    while (i<objects.size()){ 
      GameObject obj=objects.get(i);
      if (obj instanceof Powerups) {
        if (collidingWith(obj)) {
          score++;
          if (th>20) th--;
          obj.hp=0;
        }
      }
    //recov
      if (obj instanceof Recov) {
        if (collidingWith(obj)) {
          hp++;
          //screen flash green
            noFill();
            strokeWeight(75);
            stroke(green);
            rect(400,400,750,750,50);
          obj.hp=0;
        }
        }
      //enemy bullet
      if (obj instanceof EnemyBullet) {
        if (collidingWith(obj)) {
          hp--;
          bump.rewind();
          bump.play();
          //screen flash red
            noFill();
            strokeWeight(75);
            stroke(red);
            rect(400,400,750,750,50);
          //particles
            int m=0;
            while(m<30) {
              objects.add(new Particles(x,y,0,0,c));
              m++;
            }
          obj.hp=0;
        }
        }
      //asteroid
      if (obj instanceof Rock) {
        if(collidingWith(obj)) {
          hp--;
          bump.rewind();
          bump.play();
          //screen flash red
            noFill();
            strokeWeight(75);
            stroke(red);
            rect(400,400,750,750,50);
          //particles
            int m=0;
            while(m<30) {
              objects.add(new Particles(x,y,0,0,c));
              m++;
            }
            m=0;
          obj.hp=0;
        }
      }
      i++;
    }
    //moving
    if(x<size/2) x=size/2;
    if(x>width-size/2) x=width-size/2;
    if(y<size/2) y=size/2;
    if(y>height-size/2) y=height-size/2;
    if(left==true) x=x-4;
    if(right==true) x=x+4;
    if(up==true) y=y-4;
    if(down==true) y=y+4;
    //decelerate
    if(!up && !down) vy=vy*0.9;
    if(!right && !left) vx=vx*0.9;
  }
  void show() {
    image(p1, player1.x, player1.y, 50,50);
  }
    
}

class Bullet extends GameObject{
  Bullet(float vx, float vy){
    super(player1.x, player1.y, vx, vy, 10, yellow, 1);
  }
  void act(){
    super.act();
    if(offScreen()) hp=0;
  }
}
