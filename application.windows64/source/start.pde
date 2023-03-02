float exsc,collsc,runsc,setsc;
int xrain,yrain;
PFont policemenu;
PFont policetitle;
void start1(){
  background(0);
   for (int zx = 0; zx < 5; zx++) {
  for (int zy = 0; zy < 3; zy++) {
    tint(100);
    image(startwall,0+zx*width*663/2560,0+zy*width*663/2560,width*663/2560,width*663/2560);
  }}
  cursor();
  //pluie
  rotateZ(70);
  stroke(255);
  strokeWeight(1*height/1440);
  textAlign(CENTER,CENTER);
  fill(255);
  rotateZ(-70);
  //texte
  textFont(policetitle);
  textSize(height*200/1440);
  text("CAVE RUNNER",width/2,height/8);
  textFont(policemenu);
  textSize(height*80/1440+runsc);
  text(languesel[1],width/2,height*3/8);
  textSize(height*80/1440+collsc);
  text(languesel[2],width/2,height*4/8);
  textSize(height*80/1440+setsc);
  text(languesel[3],width/2,height*5/8);
  textSize(height*80/1440+exsc);
  text(languesel[4],width/2,height*6/8);
  //animation texte
  if(mouseButton==LEFT&&mouseX<width*2/3&&mouseX>width/3&&mouseY<height*3.5/8&&mouseY>height*2.5/8){page="pregame";secondes=0;minutes=0;gametimer=millis();}  
  if(mouseButton==LEFT&&mouseX<width*2/3&&mouseX>width/3&&mouseY<height*4.5/8&&mouseY>height*3.5/8){page="coll";} 
  if(mouseButton==LEFT&&mouseX<width*2/3&&mouseX>width/3&&mouseY<height*5.5/8&&mouseY>height*4.5/8){page="set";} 
  if(mouseButton==LEFT&&mouseX<width*2/3&&mouseX>width/3&&mouseY<height*6.5/8&&mouseY>height*5.5/8){exit();} 
  //RUN
  if(mouseX<width*2/3&&mouseX>width/3&&mouseY<height*3.5/8&&mouseY>height*2.5/8){
  if(runsc<height*40/1440){delay(1);runsc=runsc+height*3/1440;}
}  else if(runsc>0){delay(1);runsc=runsc-height*3/1440;}
//collec
  if(mouseX<width*2/3&&mouseX>width/3&&mouseY<height*4.5/8&&mouseY>height*3.5/8){
  if(collsc<height*40/1440){delay(1);collsc=collsc+height*3/1440;}
}  else if(collsc>0){delay(1);collsc=collsc-height*3/1440;}
//EXIT
  if(mouseX<width*2/3&&mouseX>width/3&&mouseY<height*6.5/8&&mouseY>height*5.5/8){
  if(exsc<height*40/1440){delay(1);exsc=exsc+height*3/1440;}
}  else if(exsc>0){delay(1);exsc=exsc-height*3/1440;}
//parametres
  if(mouseX<width*2/3&&mouseX>width/3&&mouseY<height*5.5/8&&mouseY>height*4.5/8){
  if(setsc<height*40/1440){delay(1);setsc=setsc+height*3/1440;}
}  else if(setsc>0){delay(1);setsc=setsc-height*3/1440;}
}
