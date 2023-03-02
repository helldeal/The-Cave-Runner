String pause="pause";
void pause(){
  savemsecondes=msecondes*10;
  gametimer=millis();
  rectMode(CORNER);
  noFill();
  noStroke();
  rect(0,0,width,height);
  cursor();
  stroke(255);
  strokeWeight(1*height/1440);
  textAlign(CENTER,CENTER);
  //texte
  if(pause=="setingame")settingingame();
  if(pause=="pause"){
  textFont(policetitle);
  textSize(height*200/1440);
  text("CAVE RUNNER",width/2,height/8);
  textFont(policemenu);
  textSize(height*80/1440+runsc);
  text(languesel[10],width/2,height*3/8);
  textSize(height*80/1440+setsc);
  text(languesel[3],width/2,height*5/8);
  textSize(height*80/1440+exsc);
  text(languesel[8],width/2,height*6/8);
  //Click
  if(mouseButton==LEFT&&mouseX<width*2/3&&mouseX>width/3&&mouseY<height*3.5/8&&mouseY>height*2.5/8){isPaused=false;}  
  //RUN
  if(mouseX<width*2/3&&mouseX>width/3&&mouseY<height*3.5/8&&mouseY>height*2.5/8){
  if(runsc<height*40/1440){delay(1);runsc=runsc+height*3/1440;}
}  else if(runsc>0){delay(1);runsc=runsc-height*3/1440;}
//EXIT
  if(mouseX<width*2/3&&mouseX>width/3&&mouseY<height*6.5/8&&mouseY>height*5.5/8){
  if(exsc<height*40/1440){delay(1);exsc=exsc+height*3/1440;}
}  else if(exsc>0){delay(1);exsc=exsc-height*3/1440;}
//parametres
  if(mouseX<width*2/3&&mouseX>width/3&&mouseY<height*5.5/8&&mouseY>height*4.5/8){
  if(setsc<height*40/1440){delay(1);setsc=setsc+height*3/1440;}
}  else if(setsc>0){delay(1);setsc=setsc-height*3/1440;}
}}
