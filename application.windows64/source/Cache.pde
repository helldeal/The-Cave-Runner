String[] cursorcolor;
String[] cursor;
String[] Francais;String[] English;String[] langue;String[] languesel;int langueset;String[] resolution;int display=1;int reso;
PImage cursor1;PImage cursor2;PImage cursor3;PImage cursor4;int cursorset;int cursorcolorset;
void loaddata(){
  cursorcolor = loadStrings("cursorcolor.txt");
  cursorcolorset=int(cursorcolor[0]);
  cursor = loadStrings("cursor.txt");
  cursorset=int(cursor[0]);
  cursor1 = loadImage("cursor1.png");cursor2 = loadImage("cursor2.png");cursor3 = loadImage("cursor3.png");cursor4 = loadImage("cursor4.png");  
  langue = loadStrings("langue.txt");
  langueset=int(langue[0]);
  Francais= loadStrings("français.txt");
  English= loadStrings("anglais.txt"); 
  if(langueset==1)languesel=English;if(langueset==2)languesel=Francais;
  resolution= loadStrings("size.txt"); 
  reso=int(resolution[0]);
}
void cache1(){ 
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
