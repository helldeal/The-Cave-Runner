
import java.util.List;
int gametimer;int msecondes;int savemsecondes;int secondes;int minutes;
String page;String stage;
int diff=199;
int nbrmob=2;int size;int size2;int nativescreencarre;
float pluiex[]= new float[diff+1];
float pluiey[]= new float[diff+1];
PImage stone;PImage stonewall;PImage startwall;PImage portef;PImage porteo;PImage light;PImage light2;
PImage ICON;PImage torch;
void settings(){
  fullScreen(P3D,1);
  //size(500,500,P3D);
  PJOGL.setIcon("gamelogo.png"); 
}
void settings2(){
  nativescreencarre=displayWidth*9/16;
if(reso==2){size=720*16/9;size2=720;}
if(reso==3){size=1080*16/9;size2=1080;}
if(reso==1){size=displayWidth;size2=nativescreencarre;}//displayWidth*9/16;
 surface.setSize(size,size2);
  surface.setResizable(true);
  
}
boolean load=true;
void load(){
  light=loadImage("light.png");
  portef=loadImage("portef.png");
  porteo=loadImage("porteo.png");
  stone=loadImage("stone.jpg");
  stonewall=loadImage("stonewall.jpg");
  startwall=loadImage("startwall.png");
  policemenu=createFont("PAPYRUS.TTF",80);
  policegame=createFont("dungeon.TTF",80);
  policetitle=createFont("coffinstone.ttf",80);
  stage="1";
  load=false;
}
void setup(){
  transinoir=0;
  loaddata();
  smooth();
  frameRate(120);
  surface.setTitle("Cave Runner");
  background(20,20,50);
  logo=loadImage("devlogo.png");
  logotxt=createFont("coffinstone.ttf",80);
  torch=loadImage("torch.png");
  if(load){load();settings2();}
  page="animstart";
  //page="lauch";
}
PImage logo;float lgx,lgy;PFont logotxt;
void draw(){
  if(page!="lauch"){cache1();}
   if (page=="lauch"){
    background(20,20,50);
    imageMode(CENTER);
    textAlign(CENTER,CENTER);
    image(logo,width/2,height*2/5,lgx,lgx);
    delay(1);
    if(lgx<500)lgx=lgx+0.5;
    if(lgx>=200){
    textFont(logotxt);
    textSize(1+lgy);
      fill(255);
    text("Hell Games",width/2,height*3/5);
    if(lgy<150)lgy=lgy+0.2;
  }
    if(lgy>=100){
      rectMode(CORNER);
      noStroke();
      translate(0,0,2);
      fill(0,transinoir);
      rect(0,0,width,height);
      if(transinoir<255)transinoir=transinoir+2;
      if(transinoir>=255)page="animstart";
      translate(0,0,-2);
      //load();settings2();
  }
 }
  if (page=="prestart"){
    prestart();
  }
  if (page=="set"){
    setting();
  }
  if (page=="preset"){
    preset();
  }
  if (page=="start"){
    start1();
  }
  if (page=="animstart"){
    animstart();
  }
  if (page=="game"){
    game();
  }
  if (page=="pregame"){
    pregame();
  }
}
void pregame(){
  shield=2;
  heart=4;
  transinoir=255;
  mob.clear();
  visionmobG=false;
  visionmobGd=false;
  x=0;
  y=-height;
  for(int i=0; i<=nbrmob; i++){
     mob.add(new mob (random(width/3.5,width*3.2/4.5),random(-height/2.2,height/2)));
   }
   page="game";   
}
