PImage bg;
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
  //image and font
  bg = loadImage("bg.jpg");
  //minim
  
  //initialize keyboard vars
  left=right=up=down=space;
  
  //array
  objects=new ArrayList<GameObject>();
  player1=new Plane();
  objects.add(player1);
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
