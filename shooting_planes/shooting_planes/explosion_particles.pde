class EnemyParticles extends GameObject{
  EnemyParticles(float x, float y, float vx, float vy, color c){
  super(x, y, random(vx-5,vx+5), random(vy-5,vy+5), 3, c, 1);
  }
  void show(){
    super.show();
  }
  void act(){
    super.act();
    int timer=0;
    if (timer<20) {
       timer++;
      } else {
        hp=0;
        timer=0;
      }
    if(offScreen()) hp=0;
  }
}
class Particles extends GameObject{
  Particles(float x, float y, float vx, float vy, color c){
  super(player1.x, player1.y, random(vx-5,vx+5), random(vy-5,vy+5), 3, c, 1);
  }
  void show(){
    super.show();
  }
  void act(){
    super.act();
    if(offScreen()) hp=0;
  }
}
