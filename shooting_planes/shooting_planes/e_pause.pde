void pause(){
  theme.pause();
  tactile(335,25,50,50);
  fill(255);
  rect(370,50,50,50,20);
  strokeWeight(3);
  triangle(360,40,360,60,380,50);
  fill(255);
  textSize(80);
  text("-PAUSED-", 400,400);
}

void pauseClicks(){
  if (mouseX > 335 && mouseX < 495 && mouseY > 25 && mouseY < 75) {
    theme.play();
    mode=GAME;
  }
}
