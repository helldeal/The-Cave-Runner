import java.util.List;
int gametimer;int msecondes;int savemsecondes;int secondes;int minutes;
String page;String stage;
int diff=199;
int nbrmob=2;int size;int size2;
float pluiex[]= new float[diff+1];
float pluiey[]= new float[diff+1];
PImage stone;PImage stonewall;PImage startwall;PImage portef;PImage porteo;PImage light;PImage light2;
PImage ICON;
void settings(){
  fullScreen(P3D,1);
  PJOGL.setIcon("torch.png"); 
}
void settings2(){
  if(reso==3){size=720*16/9;size2=720;}
 if(reso==2){size=1080*16/9;size2=1080;}
 if(reso==1){size=displayWidth;size2=displayHeight;}
 surface.setSize(size,size2 );
  
}
boolean load=true;
void load(){
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
void setup(){
  surface.setResizable(true);
  if(load)load();
  settings2();
}

void draw(){
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
void pregame(){
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
void prestart(){
   settings="jeu";
   if(mouseButton==LEFT);else page="start";
}
