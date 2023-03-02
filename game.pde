float x,y,boost;
PFont policegame;
void game(){
  //background
  background(20);
  rectMode(CENTER);
  imageMode(CORNER);
  tint(255);
  for (int zx = 0; zx < 11; zx++) {
  for (int zy = 0; zy < 22; zy++) {
    image(startwall,width/4+x+zx*width*160/2560-width*160/2560,-height/2+y+zy*width*160/2560-width*320/2560,width*160/2560,width*160/2560);
  }}
  tint(150);
  for (int zx = 0; zx < 8; zx++) {
  for (int zy = 0; zy < 18; zy++) {
    image(stone,width/4+x+zx*width*160/2560,-height/2+y+zy*width*160/2560,width*160/2560,width*160/2560);
  }}
  fill(20);noStroke();translate(0,0,1*height/1440);
  rect(width/2+x,1.5*height+y+width*40/2560,width*80/2560,width*80/2560);
  tint(200);
  image(portef,width/2+x-0.88*width*80/2560,-height/2+y-width*160/2560,0.88*width*160/2560,width*160/2560);
  tint(200,100);
  image(portef,width/2+x-0.88*width*80/2560,1.5*height+y-width*80/2560,0.88*width*160/2560,width*160/2560);
  translate(0,0,-1*height/1440);
  //déplacement
  if(!isPaused){
  if(isBoost&&!hit){if(millis()-dash<200)boost=4;else isBoost=false;}else boost=1;
  if(isUp&&!hit)y=y+2.2*height/1440*boost;
  if(isDown&&!hit)y=y-2.2*height/1440*boost;
  if(isLeft&&!hit)x=x+2.2*width/2560*boost;
  if(isRight&&!hit)x=x-2.2*width/2560*boost;
  }
  //mob
  for(int i=0; i<=nbrmob; i++){
  mob.get(i).zombie();}
  //collision
  stroke(0,255,0);
  noFill();
  rectMode(CENTER);
  rect(width/2,height/2,width*80/2560,width*80/2560);
  if(x<-width/4+width*40/2560)x=-width/4+width*40/2560;
  if(x>width/4-width*40/2560)x=width/4-width*40/2560;
  if(y<-2*height/2+width*40/2560)y=-2*height/2+width*40/2560;
  if(y>2*height/2-width*40/2560)y=2*height/2-width*40/2560;
  //light
  translate(0,0,1*height/1440);
  tint(255,150);
  image(light,0,0,width,height);
  translate(0,0,-1*height/1440);
  //noLight
  translate(0,0,1*height/1440);
  fill(20);
  rectMode(CORNER);
  noStroke();
  rect(width/4+x-width*80/2560,-height/2+y-width*240/2560,-width,3*height);
  rect(width*3/4+x+width*80/2560,-height/2+y-width*240/2560,width,3*height);
  rect(width/4+x-width,-height/2+y-width*240/2560,2*width,-height);
  rect(width/4+x-width*600/2560,1.5*height+y+width*80/2560,2*width,height);
  translate(0,0,-1*height/1440);
   //curseur
  noFill();
  stroke(255);
  strokeWeight(1*height/1440);
  if(isInfo)line(mouseX,mouseY,width/2,height/2);
  noCursor();
  imageMode(CENTER);
  if(cursorcolorset==1)tint(255);if(cursorcolorset==2)tint(255,0,0);if(cursorcolorset==3)tint(0,255,0);if(cursorcolorset==4)tint(0,0,255);if(cursorcolorset==5)tint(#FFF92E);if(cursorcolorset==6)tint(#B200FF);
  translate(0,0,1*height/1440);
  if(!isPaused&&cursorset==1){image(cursor1,mouseX,mouseY,width*40/2560,width*40/2560);translate(0,0,-1*height/1440);}
  if(!isPaused&&cursorset==2){image(cursor2,mouseX,mouseY,width*40/2560,width*40/2560);translate(0,0,-1*height/1440);}
  if(!isPaused&&cursorset==3){image(cursor3,mouseX,mouseY,width*40/2560,width*40/2560);translate(0,0,-1*height/1440);}
  if(!isPaused&&cursorset==4){image(cursor4,mouseX,mouseY,width*40/2560,width*40/2560);translate(0,0,-1*height/1440);}
  //HUD
  fill(255);
  hint(DISABLE_DEPTH_TEST);
  noLights();
  textAlign(LEFT);
  textSize(height*80/1440);
  if(!isPaused){
  if(millis()-gametimer+savemsecondes>999){secondes++;gametimer=millis();savemsecondes=0;}
  if(secondes>59){minutes++;secondes=0;}
  msecondes=(millis()-gametimer+savemsecondes)/10;
  }
  text(minutes+":"+secondes,50*width/2560,100*width/2560);
  //pause
  if(isPaused)pause();
  rectMode(CORNER);
  noStroke();
   fill(0,transinoir);
   rect(0,0,width,height);
   if(transinoir>0)transinoir=transinoir-3;
  hint(ENABLE_DEPTH_TEST);
}
