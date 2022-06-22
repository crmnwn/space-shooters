void reset(){
  left=right=up=down=space;
  objects=new ArrayList<GameObject>();
  player1=new Plane();
  objects.add(player1);
  score=0;
  timer=0;
  boss1=boss2=false;
  
}
