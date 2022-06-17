void game(){
  if (mode==GAME){
  background(darkblue);
  addObjects();
  gameEngine();
  debug();
  //gameover
  if(player1.hp ==0) mode=GAMEOVER;
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
  //particles
  }
}

void addObjects() {
  objects.add(new Star()); 
  if(frameCount % 50 ==0) objects.add(new Enemy1());
  if(frameCount % 60 ==0) objects.add(new Enemy2());
  if(frameCount % 80 ==0) objects.add(new Rock());
}

void gameEngine() {
  
}

void debug() {
  //text(frameRate, 50, 10);
  //text(objects.size(),50,30);
  textSize(30);
  text("lives: " +player1.hp, 100,50);
  text("score: " +score, 500,50);
}

void gameClicks(){
  //mode=Pause;
  //mode=GAMEOVER;
}
