boolean isLeft, isRight, isUp, isDown, isForward, isBack,isBoost,isNoClip,isInfo,isStat,isPaused; 
boolean Click;
  float dashreload=-10000;
  float dash;
boolean noclip=false;
boolean Stat=false;
void keyPressed() {
  setMove(keyCode, true);
  setMove(key, true);
   if (key == 'v'){
    noclip=!noclip;}
   if (keyCode == 99){
    isInfo=!isInfo;}
  if (key == ESC) {
    isPaused=!isPaused;
    pause="pause";
    key = 0;  // Empêche d'utiliser la touche ESC
  }
  if (key == SHIFT){
    key = 0;  // Cancel MAJ
  }
  if (key == TAB){
    setup();  // RESET
  }
  if (key == DELETE) {
    key = ESC;  // Supr >>> Echap
  }
  if(millis()-dashreload>1000){
  if (key == ' ') {
    isBoost=true;  // Supr >>> Echap
    dashreload=millis();
    dash=millis();
  }}
}

void keyReleased() {
  setMove(keyCode, false);
  setMove(key, false);
}
 
boolean setMove(int k, boolean b) {
  switch (k) {
  case 'z':
    return isUp = b;
 
  case 's':
    return isDown = b;
    
  case 'n':
    return isBoost = b;
 
  case 'q':
    return isLeft = b;
 
  case 'd':
    return isRight = b;
    
    case 'v':
    return isNoClip = b;
    
    case TAB:
    return Stat = b;
 
  default:
    return b;
  }
}
void mousePressed(){
  if(page=="game"&&pause=="pause"){
  if(mouseButton==LEFT&&mouseX<width*2/3&&mouseX>width/3&&mouseY<height*5.5/8&&mouseY>height*4.5/8){pause="setingame";}
  }
  if(page=="set"||pause=="setingame"){if(settings=="jeu"){
    //cursor selection
  if(mouseButton==LEFT&&mouseX<width/2-width*50/2560&&mouseX>width/2-width*200/2560&&mouseY<height*3.3/8&&mouseY>height*2.7/8){cursorset++;}  
  if(mouseButton==LEFT&&mouseX<width/2+width*200/2560&&mouseX>width/2+width*50/2560&&mouseY<height*3.3/8&&mouseY>height*2.7/8){cursorset--;}
  if(mouseButton==LEFT&&mouseX<width/2+600*width/2560-width*50/2560&&mouseX>width/2+600*width/2560-width*200/2560&&mouseY<height*3.3/8&&mouseY>height*2.7/8){cursorcolorset++;}  
  if(mouseButton==LEFT&&mouseX<width/2+600*width/2560+width*200/2560&&mouseX>width/2+600*width/2560+width*50/2560&&mouseY<height*3.3/8&&mouseY>height*2.7/8){cursorcolorset--;}  
      //langue selection
  if(mouseButton==LEFT&&mouseX<width/2+600*width/2560-width*50/2560&&mouseX>width/2+600*width/2560-width*200/2560&&mouseY<height*4.3/8&&mouseY>height*3.7/8){langueset++;}  
  if(mouseButton==LEFT&&mouseX<width/2+600*width/2560+width*200/2560&&mouseX>width/2+600*width/2560+width*50/2560&&mouseY<height*4.3/8&&mouseY>height*3.7/8){langueset--;}
  // all set with apply
  if(mouseButton==LEFT&&mouseX<width/2+700*width/2560&&mouseX>width/2+500*width/2560&&mouseY<height*7.3/8&&mouseY>height*6.7/8){
    if(settings=="jeu"){if(langueset==1)languesel=English;if(langueset==2)languesel=Francais;}
  }
}
  if(mouseButton==LEFT&&mouseX<width/2+600*width/2560-width*50/2560&&mouseX>width/2+600*width/2560-width*200/2560&&mouseY<height*3.3/8&&mouseY>height*2.7/8){reso++;}  
  if(mouseButton==LEFT&&mouseX<width/2+600*width/2560+width*200/2560&&mouseX>width/2+600*width/2560+width*50/2560&&mouseY<height*3.3/8&&mouseY>height*2.7/8){reso--;}  
  if(mouseButton==LEFT&&mouseX<width/2+700*width/2560&&mouseX>width/2+500*width/2560&&mouseY<height*7.3/8&&mouseY>height*6.7/8){
    if(settings=="video"){settings2();}
  }
}}
void mouseReleased(){
}
