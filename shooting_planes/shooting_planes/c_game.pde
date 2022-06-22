void game(){
  if (mode==GAME){
  timer++;
  if (score>30) boss1=op=true;
  if (score>60) opp=true;
  if (score>100) {
    boss2=true;
    boss1=false;
  }
  if(score>120) {
    biggun=true;
  }
  background(darkblue);
  addObjects();
  gameEngine();
  debug();
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
  //pause
  tactile(335,25,50,50);
  fill(255);
  rect(370,50,50,50,20);
  strokeWeight(3);
  line(360,40,360,60);
  line(380,40,380,60);
  //gameover
  if(player1.hp ==0) mode=GAMEOVER;
  if(score==200) {
    win=true;
    mode=GAMEOVER;
  }
  }
}

void addObjects() {
  objects.add(new Star()); 
  if(timer>2000 && frameCount % 50 ==0) objects.add(new Enemy1());
  if(timer>1000 && frameCount % 60 ==0) objects.add(new Enemy2());
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
  if (mouseX > 335 && mouseX < 495 && mouseY > 25 && mouseY < 75) {
    mode = PAUSE;
  }
}
