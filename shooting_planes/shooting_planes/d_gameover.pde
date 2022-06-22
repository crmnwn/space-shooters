void gameover(){
  theme.pause();
  background(255,0,0);
  if (win==false){
  bbq.play();
  image(go, 400, 400);
  fill(red);
  textSize(100);
  text("you died",390,400);
  fill(255);
  text("you died",400,400);
  } else if (win==true){
  gameover.play();
  image(winner, 400, 400);
  fill(purple);
  textSize(100);
  text("you win!",390,400);
  fill(255);
  text("you win!",400,400);
  }
  
  //restart button
  fill(255);
  strokeWeight(2);
  stroke(purple);
  tactile(200,575,300,50);
  rect(400,600,300,50,20);
  textSize(30);
  fill(purple);
  text("play again", 400,600);
  
  //exit button
  fill(255);
  strokeWeight(2);
  stroke(purple);
  tactile(650,675,100,50);
  rect(700,700,100,50,20);
  textSize(30);
  fill(purple);
  text("quit", 700,700);
}

void gameoverClicks(){
  if (mouseX>250 && mouseX<550 && mouseY>575 && mouseY<625){
  reset();
  mode=INTRO;
  gameover.pause();
  gameover.rewind();
  bbq.pause();
  bbq.rewind();
  theme.rewind();
  }
  if (mouseX>650 && mouseX<750 && mouseY>675 && mouseY<725) exit();
}
