void game(){
  background(darkblue);
  addObjects();
  gameEngine();
  debug();
  //gameover
  
  //stars
  int i=0;
  while(i<objects.size()){
    GameObject obj = objects.get(i);
    obj.act();
    obj.show();
    if(obj.hp ==0) {
      objects.remove(i);
    } else {
    i++;
    }
  }
}

void addObjects() {
  objects.add(new Star()); 
  if(frameCount % 40 ==0) objects.add(new Enemy());
}

void gameEngine() {
  
}

void debug() {
  text(frameRate, 50, 10);
  text(objects.size(),50,30);
}

void gameClicks(){
  //mode=Pause;
  mode=GAMEOVER;
}
