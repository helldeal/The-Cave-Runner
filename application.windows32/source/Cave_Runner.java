import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.List; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Cave_Runner extends PApplet {


int gametimer;int msecondes;int savemsecondes;int secondes;int minutes;
String page;String stage;
int diff=199;
int nbrmob=2;int size;int size2;
float pluiex[]= new float[diff+1];
float pluiey[]= new float[diff+1];
PImage stone;PImage stonewall;PImage startwall;PImage portef;PImage porteo;PImage light;PImage light2;
PImage ICON;
public void settings(){
  fullScreen(P3D,1);
  PJOGL.setIcon("torch.png"); 
}
public void settings2(){
  if(reso==3){size=720*16/9;size2=720;}
 if(reso==2){size=1080*16/9;size2=1080;}
 if(reso==1){size=displayWidth;size2=displayHeight;}
 surface.setSize(size,size2 );
  
}
boolean load=true;
public void load(){
  surface.setTitle("Cave Runner");
  light=loadImage("light.png");
  portef=loadImage("portef.png");
  porteo=loadImage("porteo.png");
  stone=loadImage("stone.jpg");
  stonewall=loadImage("stonewall.jpg");
  startwall=loadImage("startwall.png");
  policemenu=createFont("PAPYRUS.TTF",80);
  policegame=createFont("dungeon.TTF",80);
  policetitle=createFont("coffinstone.ttf",80);
  smooth();
  frameRate(120);
  background(0);
  stage="1";
  page="prestart";
  loaddata();
  load=false;
}
public void setup(){
  surface.setResizable(true);
  if(load)load();
  settings2();
}

public void draw(){
  println(reso+" ");
  cache1();
  if (page=="prestart"){
    prestart();
  }
  if (page=="set"){
    setting();
  }
  if (page=="start"){
    start1();
  }
  if (page=="game"){
    game();
  }
  if (page=="pregame"){
    pregame();
  }
}
public void pregame(){
  mob.clear();
  visionmobG=false;
  visionmobGd=false;
  x=0;
  y=-height;
  for(int i=0; i<=nbrmob; i++){
     mob.add(new mob (random(width/3.5f,width*3.2f/4.5f),random(-height/2.2f,height/2)));
   }
   page="game";   
}
public void prestart(){
   settings="jeu";
   if(mouseButton==LEFT);else page="start";
}

String[] cursorcolor;
String[] cursor;
String[] Francais;String[] English;String[] langue;String[] languesel;int langueset;String[] resolution;int display=1;int reso;
PImage cursor1;PImage cursor2;PImage cursor3;PImage cursor4;int cursorset;int cursorcolorset;
public void loaddata(){
  cursorcolor = loadStrings("cursorcolor.txt");
  cursorcolorset=PApplet.parseInt(cursorcolor[0]);
  cursor = loadStrings("cursor.txt");
  cursorset=PApplet.parseInt(cursor[0]);
  cursor1 = loadImage("cursor1.png");cursor2 = loadImage("cursor2.png");cursor3 = loadImage("cursor3.png");cursor4 = loadImage("cursor4.png");  
  langue = loadStrings("langue.txt");
  langueset=PApplet.parseInt(langue[0]);
  Francais= loadStrings("français.txt");
  English= loadStrings("anglais.txt"); 
  if(langueset==1)languesel=English;if(langueset==2)languesel=Francais;
  resolution= loadStrings("size.txt"); 
  reso=PApplet.parseInt(resolution[0]);
}
public void cache1(){ 
  //cursor
    cursorcolor[0]=str(cursorcolorset);
      saveStrings("cursorcolor.txt",cursorcolor);
    cursor[0]=str(cursorset);
      saveStrings("cursor.txt",cursor);
  //langue
    langue[0]=str(langueset);
      saveStrings("langue.txt",langue);
    //résolution
    resolution[0]=str(reso);
    saveStrings("size.txt",resolution);
}
boolean isLeft, isRight, isUp, isDown, isForward, isBack,isBoost,isNoClip,isInfo,isStat,isPaused; 
boolean Click;
  float dashreload=-10000;
  float dash;
boolean noclip=false;
boolean Stat=false;
public void keyPressed() {
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

public void keyReleased() {
  setMove(keyCode, false);
  setMove(key, false);
}
 
public boolean setMove(int k, boolean b) {
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
public void mousePressed(){
  if(page=="game"&&pause=="pause"){
  if(mouseButton==LEFT&&mouseX<width*2/3&&mouseX>width/3&&mouseY<height*5.5f/8&&mouseY>height*4.5f/8){pause="setingame";}
  }
  if(page=="set"||pause=="setingame"){if(settings=="jeu"){
    //cursor selection
  if(mouseButton==LEFT&&mouseX<width/2-width*50/2560&&mouseX>width/2-width*200/2560&&mouseY<height*3.3f/8&&mouseY>height*2.7f/8){cursorset++;}  
  if(mouseButton==LEFT&&mouseX<width/2+width*200/2560&&mouseX>width/2+width*50/2560&&mouseY<height*3.3f/8&&mouseY>height*2.7f/8){cursorset--;}
  if(mouseButton==LEFT&&mouseX<width/2+600*width/2560-width*50/2560&&mouseX>width/2+600*width/2560-width*200/2560&&mouseY<height*3.3f/8&&mouseY>height*2.7f/8){cursorcolorset++;}  
  if(mouseButton==LEFT&&mouseX<width/2+600*width/2560+width*200/2560&&mouseX>width/2+600*width/2560+width*50/2560&&mouseY<height*3.3f/8&&mouseY>height*2.7f/8){cursorcolorset--;}  
      //langue selection
  if(mouseButton==LEFT&&mouseX<width/2+600*width/2560-width*50/2560&&mouseX>width/2+600*width/2560-width*200/2560&&mouseY<height*4.3f/8&&mouseY>height*3.7f/8){langueset++;}  
  if(mouseButton==LEFT&&mouseX<width/2+600*width/2560+width*200/2560&&mouseX>width/2+600*width/2560+width*50/2560&&mouseY<height*4.3f/8&&mouseY>height*3.7f/8){langueset--;}
  // all set with apply
  if(mouseButton==LEFT&&mouseX<width/2+700*width/2560&&mouseX>width/2+500*width/2560&&mouseY<height*7.3f/8&&mouseY>height*6.7f/8){
    if(settings=="jeu"){if(langueset==1)languesel=English;if(langueset==2)languesel=Francais;}
  }
}
  if(mouseButton==LEFT&&mouseX<width/2+600*width/2560-width*50/2560&&mouseX>width/2+600*width/2560-width*200/2560&&mouseY<height*3.3f/8&&mouseY>height*2.7f/8){reso++;}  
  if(mouseButton==LEFT&&mouseX<width/2+600*width/2560+width*200/2560&&mouseX>width/2+600*width/2560+width*50/2560&&mouseY<height*3.3f/8&&mouseY>height*2.7f/8){reso--;}  
  if(mouseButton==LEFT&&mouseX<width/2+700*width/2560&&mouseX>width/2+500*width/2560&&mouseY<height*7.3f/8&&mouseY>height*6.7f/8){
    if(settings=="video"){settings2();}
  }
}}
public void mouseReleased(){
}
float x,y,boost;
PFont policegame;
public void game(){
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
  rect(width/2+x,1.5f*height+y+width*40/2560,width*80/2560,width*80/2560);
  tint(200);
  image(portef,width/2+x-0.88f*width*80/2560,-height/2+y-width*160/2560,0.88f*width*160/2560,width*160/2560);
  tint(200,100);
  image(portef,width/2+x-0.88f*width*80/2560,1.5f*height+y-width*80/2560,0.88f*width*160/2560,width*160/2560);
  translate(0,0,-1*height/1440);
  //déplacement
  if(!isPaused){
  if(isBoost&&!hit){if(millis()-dash<200)boost=4;else isBoost=false;}else boost=1;
  if(isUp&&!hit)y=y+2.2f*height/1440*boost;
  if(isDown&&!hit)y=y-2.2f*height/1440*boost;
  if(isLeft&&!hit)x=x+2.2f*width/2560*boost;
  if(isRight&&!hit)x=x-2.2f*width/2560*boost;
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
  rect(width/4+x-width*600/2560,1.5f*height+y+width*80/2560,2*width,height);
  translate(0,0,-1*height/1440);
   //curseur
  noFill();
  stroke(255);
  strokeWeight(1*height/1440);
  if(isInfo)line(mouseX,mouseY,width/2,height/2);
  noCursor();
  imageMode(CENTER);
  if(cursorcolorset==1)tint(255);if(cursorcolorset==2)tint(255,0,0);if(cursorcolorset==3)tint(0,255,0);if(cursorcolorset==4)tint(0,0,255);if(cursorcolorset==5)tint(0xffFFF92E);if(cursorcolorset==6)tint(0xffB200FF);
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
  text(minutes+":"+secondes+":"+msecondes,50*width/2560,100*width/2560);
  //pause
  if(isPaused)pause();
  hint(ENABLE_DEPTH_TEST);
}
List<mob> mob = new ArrayList<mob>();
boolean visionmobG;
boolean visionmobGd;
boolean hit;
float gracetimeG;
      class mob{
      boolean grace;
      boolean moveblock;
      float gracetime;
      float a;
      float b;
      float ymob;
      float xmob;
      float angle=0;
      float knockback=0.03f;
      boolean visionmob;
      mob(float xmob,float ymob){
        this.xmob=xmob;
        this.ymob=ymob;
      }
      
    public void zombie(){
      noFill();
      if(millis()-gracetime>500){grace=false;angle=0;}
      if(millis()-gracetimeG>500){hit=false;}
      if (visionmobG==false)visionmob=false;
      float abstandX=width/2-xmob-x;
      float abstandY=height/2-ymob-y;
      //afficher mob
      ellipseMode(CENTER);
      strokeWeight(3*height/1440);
      if(visionmob)stroke(255,0,0); else stroke(0xffFFF80F);
      if(isInfo)line(xmob+x,ymob+y,width/2,height/2);
      if(isInfo)ellipse(xmob+x,ymob+y,1500*width/2560,1500*width/2560);
      stroke(255,0,0);
      rectMode(CENTER);
      rect(xmob+x,ymob+y,80*width/2560,80*width/2560);
      //script mob
      if(grace==false&&xmob+x<width/2+80*width/2560&&xmob+x>width/2-80*width/2560&&ymob+y<height/2+80*height/1440&&ymob+y>height/2-80*height/1440){
        if(!hit)grace=true;
        if(!hit)hit=true;
        gracetime=millis();
        gracetimeG=millis();
      }
      if(xmob+x<width/2+80*width/2560&&xmob+x>width/2-80*width/2560&&ymob+y<height/2+80*height/1440&&ymob+y>height/2-80*height/1440)moveblock=true;else moveblock=false;
       if(grace)hit=true;
       if(grace&&sqrt(sq(width/2-(xmob+x))+sq(height/2-(ymob+y)))<250*width/2560){delay(1);x=x-knockback*(width/2-(xmob+x));}
       if(grace&&sqrt(sq(width/2-(xmob+x))+sq(height/2-(ymob+y)))<250*width/2560){delay(1);angle=angle+0.18f;y=y-knockback*(height/2-(ymob+y))+3*sin(angle);}
      if(visionmobGd||visionmob||sqrt(sq(width/2-(xmob+x))+sq(height/2-(ymob+y)))<790*width/2560){
      if(!grace&&!moveblock&&!isPaused)xmob=xmob+a;
      if(!grace&&!moveblock&&!isPaused)ymob=ymob+b;
      visionmob=true;
      visionmobG=true;
      }
      //suivi zombie
      if(abstandX>0 && abstandY>0)                        
        {
        if(abstandX>abstandY){a=2*height/1440; b=abstandY/abstandX;}
        if(abstandX<abstandY){b=2*height/1440; a=abstandX/abstandY;}
        }
      
      if(abstandX>0 && abstandY<0)                          
        {
        if(abstandX>-abstandY){a=2*height/1440; b=abstandY/abstandX;}
        if(abstandX<-abstandY){b=-2*height/1440; a=abstandX/-abstandY;}
        }
      
      if(abstandX<0 && abstandY>0)                         
        {
        if(-abstandX>abstandY){a=-2*height/1440; b=abstandY/-abstandX;}
        if(-abstandX<abstandY){b=2*height/1440; a=-abstandX/-abstandY;}
        }
      
      if(abstandX<0 && abstandY<0)                         
        {
        if(-abstandX>-abstandY){a=-2*height/1440; b=abstandY/-abstandX;}
        if(-abstandX<-abstandY){b=-2*height/1440; a=-abstandX/abstandY;}
        }
}

    }
String pause="pause";
public void pause(){
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
  if(mouseButton==LEFT&&mouseX<width*2/3&&mouseX>width/3&&mouseY<height*3.5f/8&&mouseY>height*2.5f/8){isPaused=false;}  
  if(mouseButton==LEFT&&mouseX<width*2/3&&mouseX>width/3&&mouseY<height*6.5f/8&&mouseY>height*5.5f/8){page="prestart";} 
  //RUN
  if(mouseX<width*2/3&&mouseX>width/3&&mouseY<height*3.5f/8&&mouseY>height*2.5f/8){
  if(runsc<height*40/1440){delay(1);runsc=runsc+height*3/1440;}
}  else if(runsc>0){delay(1);runsc=runsc-height*3/1440;}
//EXIT
  if(mouseX<width*2/3&&mouseX>width/3&&mouseY<height*6.5f/8&&mouseY>height*5.5f/8){
  if(exsc<height*40/1440){delay(1);exsc=exsc+height*3/1440;}
}  else if(exsc>0){delay(1);exsc=exsc-height*3/1440;}
//parametres
  if(mouseX<width*2/3&&mouseX>width/3&&mouseY<height*5.5f/8&&mouseY>height*4.5f/8){
  if(setsc<height*40/1440){delay(1);setsc=setsc+height*3/1440;}
}  else if(setsc>0){delay(1);setsc=setsc-height*3/1440;}
}}

int appsc;
String settings;
public void setting(){
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
  if(cursorcolorset==1)tint(255);if(cursorcolorset==2)tint(255,0,0);if(cursorcolorset==3)tint(0,255,0);if(cursorcolorset==4)tint(0,0,255);if(cursorcolorset==5)tint(0xffFFF92E);if(cursorcolorset==6)tint(0xffB200FF);
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
  if(mouseButton==LEFT&&mouseX<width*3/5&&mouseX>width*2/5&&mouseY<height*7.3f/8&&mouseY>height*6.7f/8){page="prestart";} 
  if(mouseButton==LEFT&&mouseX<width/4+100*width/2560&&mouseX>width/4-100*width/2560&&mouseY<height*3.5f/8&&mouseY>height*2.5f/8){settings="jeu";}   
  if(mouseButton==LEFT&&mouseX<width/4+100*width/2560&&mouseX>width/4-100*width/2560&&mouseY<height*4.5f/8&&mouseY>height*3.5f/8){settings="video";}   
  if(mouseButton==LEFT&&mouseX<width/4+100*width/2560&&mouseX>width/4-100*width/2560&&mouseY<height*5.5f/8&&mouseY>height*4.5f/8){settings="audio";}   
//animation
  if(settings=="jeu"||mouseX<width/4+100*width/2560&&mouseX>width/4-100*width/2560&&mouseY<height*3.5f/8&&mouseY>height*2.5f/8){
  if(runsc<height*40/1440){delay(1);runsc=runsc+height*3/1440;}
}  else if(runsc>0){delay(1);runsc=runsc-height*3/1440;}
  if(settings=="video"||mouseX<width/4+100*width/2560&&mouseX>width/4-100*width/2560&&mouseY<height*4.5f/8&&mouseY>height*3.5f/8){
  if(collsc<height*40/1440){delay(1);collsc=collsc+height*3/1440;}
}  else if(collsc>0){delay(1);collsc=collsc-height*3/1440;}
  if(settings=="audio"||mouseX<width/4+100*width/2560&&mouseX>width/4-100*width/2560&&mouseY<height*5.5f/8&&mouseY>height*4.5f/8){
  if(setsc<height*40/1440){delay(1);setsc=setsc+height*3/1440;}
}  else if(setsc>0){delay(1);setsc=setsc-height*3/1440;}
  if(mouseX<width*3/5&&mouseX>width*2/5&&mouseY<height*7.3f/8&&mouseY>height*6.7f/8){
  if(exsc<height*20/1440){delay(1);exsc=exsc+height*3/1440;}
}  else if(exsc>0){delay(1);exsc=exsc-height*3/1440;}
  if(mouseX<width/2+700*width/2560&&mouseX>width/2+500*width/2560&&mouseY<height*7.3f/8&&mouseY>height*6.7f/8){
  if(appsc<height*20/1440){delay(1);appsc=appsc+height*3/1440;}
}  else if(appsc>0){delay(1);appsc=appsc-height*3/1440;}

}
public void settingingame(){
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
  translate(0,0,1*height/1440);if(cursorcolorset==1)tint(255);if(cursorcolorset==2)tint(255,0,0);if(cursorcolorset==3)tint(0,255,0);if(cursorcolorset==4)tint(0,0,255);if(cursorcolorset==5)tint(0xffFFF92E);if(cursorcolorset==6)tint(0xffB200FF);
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
  if(mouseButton==LEFT&&mouseX<width*3/5&&mouseX>width*2/5&&mouseY<height*7.3f/8&&mouseY>height*6.7f/8){pause="pause";}  
  if(mouseButton==LEFT&&mouseX<width/4+100*width/2560&&mouseX>width/4-100*width/2560&&mouseY<height*3.5f/8&&mouseY>height*2.5f/8){settings="jeu";}   
  if(mouseButton==LEFT&&mouseX<width/4+100*width/2560&&mouseX>width/4-100*width/2560&&mouseY<height*4.5f/8&&mouseY>height*3.5f/8){settings="video";}   
  if(mouseButton==LEFT&&mouseX<width/4+100*width/2560&&mouseX>width/4-100*width/2560&&mouseY<height*5.5f/8&&mouseY>height*4.5f/8){settings="audio";}    
//animation texte
 if(settings=="jeu"||mouseX<width/4+100*width/2560&&mouseX>width/4-100*width/2560&&mouseY<height*3.5f/8&&mouseY>height*2.5f/8){
  if(runsc<height*40/1440){delay(1);runsc=runsc+height*3/1440;}
}  else if(runsc>0){delay(1);runsc=runsc-height*3/1440;}
  if(settings=="video"||mouseX<width/4+100*width/2560&&mouseX>width/4-100*width/2560&&mouseY<height*4.5f/8&&mouseY>height*3.5f/8){
  if(collsc<height*40/1440){delay(1);collsc=collsc+height*3/1440;}
}  else if(collsc>0){delay(1);collsc=collsc-height*3/1440;}
  if(settings=="audio"||mouseX<width/4+100*width/2560&&mouseX>width/4-100*width/2560&&mouseY<height*5.5f/8&&mouseY>height*4.5f/8){
  if(setsc<height*40/1440){delay(1);setsc=setsc+height*3/1440;}
}  else if(setsc>0){delay(1);setsc=setsc-height*3/1440;}
  if(mouseX<width*3/5&&mouseX>width*2/5&&mouseY<height*7.3f/8&&mouseY>height*6.7f/8){
  if(exsc<height*20/1440){delay(1);exsc=exsc+height*3/1440;}
}  else if(exsc>0){delay(1);exsc=exsc-height*3/1440;}
  if(mouseX<width/2+700*width/2560&&mouseX>width/2+500*width/2560&&mouseY<height*7.3f/8&&mouseY>height*6.7f/8){
  if(appsc<height*20/1440){delay(1);appsc=appsc+height*3/1440;}
}  else if(appsc>0){delay(1);appsc=appsc-height*3/1440;}

}
float exsc,collsc,runsc,setsc;
int xrain,yrain;
PFont policemenu;
PFont policetitle;
public void start1(){
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
  if(mouseButton==LEFT&&mouseX<width*2/3&&mouseX>width/3&&mouseY<height*3.5f/8&&mouseY>height*2.5f/8){page="pregame";secondes=0;minutes=0;gametimer=millis();}  
  if(mouseButton==LEFT&&mouseX<width*2/3&&mouseX>width/3&&mouseY<height*4.5f/8&&mouseY>height*3.5f/8){page="coll";} 
  if(mouseButton==LEFT&&mouseX<width*2/3&&mouseX>width/3&&mouseY<height*5.5f/8&&mouseY>height*4.5f/8){page="set";} 
  if(mouseButton==LEFT&&mouseX<width*2/3&&mouseX>width/3&&mouseY<height*6.5f/8&&mouseY>height*5.5f/8){exit();} 
  //RUN
  if(mouseX<width*2/3&&mouseX>width/3&&mouseY<height*3.5f/8&&mouseY>height*2.5f/8){
  if(runsc<height*40/1440){delay(1);runsc=runsc+height*3/1440;}
}  else if(runsc>0){delay(1);runsc=runsc-height*3/1440;}
//collec
  if(mouseX<width*2/3&&mouseX>width/3&&mouseY<height*4.5f/8&&mouseY>height*3.5f/8){
  if(collsc<height*40/1440){delay(1);collsc=collsc+height*3/1440;}
}  else if(collsc>0){delay(1);collsc=collsc-height*3/1440;}
//EXIT
  if(mouseX<width*2/3&&mouseX>width/3&&mouseY<height*6.5f/8&&mouseY>height*5.5f/8){
  if(exsc<height*40/1440){delay(1);exsc=exsc+height*3/1440;}
}  else if(exsc>0){delay(1);exsc=exsc-height*3/1440;}
//parametres
  if(mouseX<width*2/3&&mouseX>width/3&&mouseY<height*5.5f/8&&mouseY>height*4.5f/8){
  if(setsc<height*40/1440){delay(1);setsc=setsc+height*3/1440;}
}  else if(setsc>0){delay(1);setsc=setsc-height*3/1440;}
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Cave_Runner" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
