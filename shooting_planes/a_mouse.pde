void mouseReleased() {
  if (mode == INTRO) {
    introClicks();
  } else if (mode == GAME) {
    gameClicks();
  } else if (mode == PAUSE) {
    pauseClicks();
  } else if (mode == GAMEOVER) {
    gameoverClicks();
  } 
}
void tactile(int x, int y, int w, int h) {
  if (mouseX < x+w && mouseX > x && mouseY < y+h && mouseY > y) {
    //stroke(purple);
  } else {
    //stroke(darkpurple);
  }
}
