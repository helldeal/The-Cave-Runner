float exsc,collsc,runsc,setsc;
int xrain,yrain;
PFont policemenu;
PFont policetitle;
float spawnfill=0;
float spawnfillI;
boolean spawnfilletat;
int transinoir;
void start1(){
  backstart();
  cursor();
  //pluie
  stroke(255);
  strokeWeight(1*height/1440);
  textAlign(CENTER,CENTER);
  spawnfillI= map(spawnfill,255,0,0,255);
  if(spawnfill<255)spawnfill=spawnfill+5;
  if(spawnfilletat){
   translate(2.5*663*width/2560,0);
  fill(255,spawnfillI);
  settext();
   translate(-2.5*663*width/2560,0);
 }
  //texte
  fill(255,spawnfill);
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
  if(mouseButton==LEFT&&mouseX<width*2/3&&mouseX>width/3&&mouseY<height*5.5/8&&mouseY>height*4.5/8){page="preset";transstart=-2.5*663*width/2560;} 
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
   translate(0,0,animstart);
  hint(DISABLE_DEPTH_TEST);
  rectMode(CORNER);
  noStroke();
   fill(0,transinoir);
   rect(0,0,width,height);
   if(transinoir>0)transinoir=transinoir-3;
  hint(ENABLE_DEPTH_TEST);
}
float animtransstart;float animstart;
void animstart(){
   spawnfill=0;
  transinoir=255;
  spawnfilletat=false;
  animstart=2000;decalstart=0;transstart=0;animtransstart=0;
  backstart();
   translate(0,0,animstart);
   page="prestart";
}
void preset(){ 
  spawnfilletat=true;
  if(languesel==English)langueset=1;
  if(languesel==Francais)langueset=2;
  if(size2==720){reso=2;}
  if(size2==1080){reso=3;}
  if(size2==displayHeight){reso=1;}
   spawnfill=0;
   page="set";
}
void prestart(){
   spawnfill=0;
   page="start";
   settings="jeu";  
}
