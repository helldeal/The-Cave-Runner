int appsc;
String settings;
void setting(){
  background(0);
   for (int zx = 0; zx < 5; zx++) {
  for (int zy = 0; zy < 3; zy++) {
    tint(100);
    image(startwall,0+zx*width*663/2560,0+zy*width*663/2560,width*663/2560,width*663/2560);
  }}
  imageMode(CENTER);
  rectMode(CENTER);
  cursor();
  //texte
  fill(255);
  textFont(policemenu);
  textSize(height*80/1440);
  text(languesel[3]+":",width/4,height/8);
  textSize(height*60/1440+runsc);
  text(languesel[11],width/4,height*3/8);
  textSize(height*60/1440+collsc);
  text(languesel[12],width/4,height*4/8);
  textSize(height*60/1440+setsc);
  text(languesel[13],width/4,height*5/8);
  if(settings=="video"){
    textSize(height*60/1440);
    //reso
    text(languesel[15]+":",width/2,height*3/8);
    if(reso==1)text("<Native>",width/2+600*width/2560,height*3/8);
    if(reso==2)text("<1080>",width/2+600*width/2560,height*3/8);
    if(reso==3)text("<720>",width/2+600*width/2560,height*3/8);
  if(reso<1)reso=3;
  if(reso>3)reso=1;
  //display
    text(languesel[16]+":",width/2,height*4/8);text("<>",width/2+600*width/2560,height*4/8);
  }
  if(settings=="jeu"){
  //curor
  textSize(height*60/1440);
  translate(0,0,1*height/1440);
  if(cursorcolorset==1)tint(255);if(cursorcolorset==2)tint(255,0,0);if(cursorcolorset==3)tint(0,255,0);if(cursorcolorset==4)tint(0,0,255);if(cursorcolorset==5)tint(#FFF92E);if(cursorcolorset==6)tint(#B200FF);
  if(cursorset==1){image(cursor1,width/2+300*width/2560,height*3/8+15*width/2560,width*60/2560,width*60/2560);translate(0,0,-1*height/1440);}
  if(cursorset==2){image(cursor2,width/2+300*width/2560,height*3/8+15*width/2560,width*60/2560,width*60/2560);translate(0,0,-1*height/1440);}
  if(cursorset==3){image(cursor3,width/2+300*width/2560,height*3/8+15*width/2560,width*60/2560,width*60/2560);translate(0,0,-1*height/1440);}
  if(cursorset==4){image(cursor4,width/2+300*width/2560,height*3/8+15*width/2560,width*60/2560,width*60/2560);translate(0,0,-1*height/1440);}
  text("<"+languesel[5]+">",width/2,height*3/8);text("<"+languesel[7]+">",width/2+600*width/2560,height*3/8);
  //langues
  text(languesel[6]+":",width/2,height*4/8);
  if(langueset==1)text("<English>",width/2+600*width/2560,height*4/8);
  if(langueset==2)text("<Francais>",width/2+600*width/2560,height*4/8);
  //curor
  if(cursorset<1)cursorset=4;
  if(cursorset>4)cursorset=1;
  if(cursorcolorset<1)cursorcolorset=6;
  if(cursorcolorset>6)cursorcolorset=1;
  //langue
  if(langueset<1)langueset=2;
  if(langueset>2)langueset=1;
  }
  //Retour
  textSize(height*50/1440+exsc);
  text(languesel[8],width/2,height*7/8);
  //appliquer
  textSize(height*50/1440+appsc);
  text(languesel[14],width/2+600*width/2560,height*7/8);
  //script
  if(mouseButton==LEFT&&mouseX<width*3/5&&mouseX>width*2/5&&mouseY<height*7.3/8&&mouseY>height*6.7/8){page="prestart";} 
  if(mouseButton==LEFT&&mouseX<width/4+100*width/2560&&mouseX>width/4-100*width/2560&&mouseY<height*3.5/8&&mouseY>height*2.5/8){settings="jeu";}   
  if(mouseButton==LEFT&&mouseX<width/4+100*width/2560&&mouseX>width/4-100*width/2560&&mouseY<height*4.5/8&&mouseY>height*3.5/8){settings="video";}   
  if(mouseButton==LEFT&&mouseX<width/4+100*width/2560&&mouseX>width/4-100*width/2560&&mouseY<height*5.5/8&&mouseY>height*4.5/8){settings="audio";}   
//animation
  if(settings=="jeu"||mouseX<width/4+100*width/2560&&mouseX>width/4-100*width/2560&&mouseY<height*3.5/8&&mouseY>height*2.5/8){
  if(runsc<height*40/1440){delay(1);runsc=runsc+height*3/1440;}
}  else if(runsc>0){delay(1);runsc=runsc-height*3/1440;}
  if(settings=="video"||mouseX<width/4+100*width/2560&&mouseX>width/4-100*width/2560&&mouseY<height*4.5/8&&mouseY>height*3.5/8){
  if(collsc<height*40/1440){delay(1);collsc=collsc+height*3/1440;}
}  else if(collsc>0){delay(1);collsc=collsc-height*3/1440;}
  if(settings=="audio"||mouseX<width/4+100*width/2560&&mouseX>width/4-100*width/2560&&mouseY<height*5.5/8&&mouseY>height*4.5/8){
  if(setsc<height*40/1440){delay(1);setsc=setsc+height*3/1440;}
}  else if(setsc>0){delay(1);setsc=setsc-height*3/1440;}
  if(mouseX<width*3/5&&mouseX>width*2/5&&mouseY<height*7.3/8&&mouseY>height*6.7/8){
  if(exsc<height*20/1440){delay(1);exsc=exsc+height*3/1440;}
}  else if(exsc>0){delay(1);exsc=exsc-height*3/1440;}
  if(mouseX<width/2+700*width/2560&&mouseX>width/2+500*width/2560&&mouseY<height*7.3/8&&mouseY>height*6.7/8){
  if(appsc<height*20/1440){delay(1);appsc=appsc+height*3/1440;}
}  else if(appsc>0){delay(1);appsc=appsc-height*3/1440;}

}
void settingingame(){
  imageMode(CENTER);
  rectMode(CENTER);
  cursor();
  //texte
  fill(255);
  textFont(policemenu);
  textSize(height*80/1440);
  text(languesel[3]+":",width/2-600*width/2560,height/8);
  textSize(height*60/1440+runsc);
  text(languesel[11],width/4,height*3/8);
  textSize(height*60/1440+collsc);
  text(languesel[12],width/4,height*4/8);
  textSize(height*60/1440+setsc);
  text(languesel[13],width/4,height*5/8);
  
  if(settings=="jeu"){
  //curor
  textSize(height*60/1440);
  translate(0,0,1*height/1440);if(cursorcolorset==1)tint(255);if(cursorcolorset==2)tint(255,0,0);if(cursorcolorset==3)tint(0,255,0);if(cursorcolorset==4)tint(0,0,255);if(cursorcolorset==5)tint(#FFF92E);if(cursorcolorset==6)tint(#B200FF);
  if(cursorset==1){image(cursor1,width/2+300*width/2560,height*3/8+15*width/2560,width*60/2560,width*60/2560);translate(0,0,-1*height/1440);}
  if(cursorset==2){image(cursor2,width/2+300*width/2560,height*3/8+15*width/2560,width*60/2560,width*60/2560);translate(0,0,-1*height/1440);}
  if(cursorset==3){image(cursor3,width/2+300*width/2560,height*3/8+15*width/2560,width*60/2560,width*60/2560);translate(0,0,-1*height/1440);}
  if(cursorset==4){image(cursor4,width/2+300*width/2560,height*3/8+15*width/2560,width*60/2560,width*60/2560);translate(0,0,-1*height/1440);}
  text("<"+languesel[5]+">",width/2,height*3/8);text("<"+languesel[7]+">",width/2+600*width/2560,height*3/8);
  //langues
  text(languesel[6]+":",width/2,height*4/8);
  if(langueset==1)text("<English>",width/2+600*width/2560,height*4/8);
  if(langueset==2)text("<Francais>",width/2+600*width/2560,height*4/8);
  //curor
  if(cursorset<1)cursorset=4;
  if(cursorset>4)cursorset=1;
  if(cursorcolorset<1)cursorcolorset=6;
  if(cursorcolorset>6)cursorcolorset=1;
  //langue
  if(langueset<1)langueset=2;
  if(langueset>2)langueset=1;
  }
  //Retour
  textSize(height*50/1440+exsc);
  text(languesel[9],width/2,height*7/8);
  //appliquer
  textSize(height*50/1440+appsc);
  text(languesel[14],width/2+600*width/2560,height*7/8);
  //script
  if(mouseButton==LEFT&&mouseX<width*3/5&&mouseX>width*2/5&&mouseY<height*7.3/8&&mouseY>height*6.7/8){pause="pause";}  
  if(mouseButton==LEFT&&mouseX<width/4+100*width/2560&&mouseX>width/4-100*width/2560&&mouseY<height*3.5/8&&mouseY>height*2.5/8){settings="jeu";}   
  if(mouseButton==LEFT&&mouseX<width/4+100*width/2560&&mouseX>width/4-100*width/2560&&mouseY<height*4.5/8&&mouseY>height*3.5/8){settings="video";}   
  if(mouseButton==LEFT&&mouseX<width/4+100*width/2560&&mouseX>width/4-100*width/2560&&mouseY<height*5.5/8&&mouseY>height*4.5/8){settings="audio";}    
//animation texte
 if(settings=="jeu"||mouseX<width/4+100*width/2560&&mouseX>width/4-100*width/2560&&mouseY<height*3.5/8&&mouseY>height*2.5/8){
  if(runsc<height*40/1440){delay(1);runsc=runsc+height*3/1440;}
}  else if(runsc>0){delay(1);runsc=runsc-height*3/1440;}
  if(settings=="video"||mouseX<width/4+100*width/2560&&mouseX>width/4-100*width/2560&&mouseY<height*4.5/8&&mouseY>height*3.5/8){
  if(collsc<height*40/1440){delay(1);collsc=collsc+height*3/1440;}
}  else if(collsc>0){delay(1);collsc=collsc-height*3/1440;}
  if(settings=="audio"||mouseX<width/4+100*width/2560&&mouseX>width/4-100*width/2560&&mouseY<height*5.5/8&&mouseY>height*4.5/8){
  if(setsc<height*40/1440){delay(1);setsc=setsc+height*3/1440;}
}  else if(setsc>0){delay(1);setsc=setsc-height*3/1440;}
  if(mouseX<width*3/5&&mouseX>width*2/5&&mouseY<height*7.3/8&&mouseY>height*6.7/8){
  if(exsc<height*20/1440){delay(1);exsc=exsc+height*3/1440;}
}  else if(exsc>0){delay(1);exsc=exsc-height*3/1440;}
  if(mouseX<width/2+700*width/2560&&mouseX>width/2+500*width/2560&&mouseY<height*7.3/8&&mouseY>height*6.7/8){
  if(appsc<height*20/1440){delay(1);appsc=appsc+height*3/1440;}
}  else if(appsc>0){delay(1);appsc=appsc-height*3/1440;}

}
