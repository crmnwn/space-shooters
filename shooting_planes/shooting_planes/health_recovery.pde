class Recov extends GameObject {
  Recov(float x, float y) {
    super(x,y,0,0.5,10,255,1);
    if(y>height) vy=0;
  }
  void act() {
    super.act();
  }
  void show() {
    image(pot, x, y, 20,20);
  }
}
