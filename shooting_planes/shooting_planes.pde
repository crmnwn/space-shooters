import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
PFont font;
PImage bg,go;
PImage p1,e1,e2,e3;
PImage powerup;
boolean op, opp;
int score;
int mode;
final int INTRO=1;
final int GAME=2;
final int PAUSE=3;
final int GAMEOVER=4;

color yellow = #FFF689;
color green = #CFFFB0;
color blue = #5998C5;
color darkblue = #000022;
color red = #E03616;
color purple = #59355E;
//keyboard variables
boolean up, down, right, left, space;
//sound variables
Minim minim;
AudioPlayer theme, coin, bump, gameover;
//stars
  ArrayList<GameObject> objects;
//plane
  Plane player1;

void setup(){
  size(800,800);
  mode=INTRO;
  background(0);
  imageMode(CENTER);
  rectMode(CENTER);
  textAlign(CENTER,CENTER);
  textSize(50);
  noStroke();
  colorMode(RGB);
  //image and font
  font = createFont("HIGH SPEED.ttf", 50);
  bg = loadImage("bg.jpg");
  go = loadImage("go.jpg");
  p1 = loadImage("p1.png");
  e1 = loadImage("e1.png");
  e2 = loadImage("e2.png");
  e3 = loadImage("asteroid.png");
  powerup = loadImage("powerup.png");
  //minim
  minim = new Minim(this);
  theme=minim.loadFile("theme.mp3");
  coin=minim.loadFile("coin.wav");
  bump=minim.loadFile("bump.wav");
  gameover=minim.loadFile("evolution.mp3");
  
  reset();
}

void draw() {
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == GAMEOVER) {
    gameover();
  } else {
    println("Mode is :" + mode);
  }
}
