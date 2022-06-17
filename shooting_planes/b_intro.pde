void intro(){
  textFont(font);
  textSize(80);
  theme.play();
  background(255);
  image(bg, 400, 400);
  fill(red);
  text("super",390,300);
  text("star",390,390);
  text("shooter",390,480);
  fill(255);
  text("super",400,300);
  text("star",400,390);
  text("shooter",400,480);
  
  //start button
  fill(255);
  strokeWeight(2);
  stroke(purple);
  tactile(200,575,400,50);
  rect(400,600,400,50,20);
  textSize(30);
  fill(purple);
  text("press here to start", 400,600);
}

void introClicks(){
  if (mouseX>200 && mouseX<600 && mouseY>575 && mouseY<625) mode=GAME;
}
