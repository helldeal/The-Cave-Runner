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
      float knockback=0.03;
      boolean visionmob;
      mob(float xmob,float ymob){
        this.xmob=xmob;
        this.ymob=ymob;
      }
      
    void zombie(){
      noFill();
      if(millis()-gracetime>500){grace=false;angle=0;}
      if(millis()-gracetimeG>500){hit=false;}
      if (visionmobG==false)visionmob=false;
      float abstandX=width/2-xmob-x;
      float abstandY=height/2-ymob-y;
      //afficher mob
      ellipseMode(CENTER);
      strokeWeight(3*height/1440);
      if(visionmob)stroke(255,0,0); else stroke(#FFF80F);
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
       if(grace&&sqrt(sq(width/2-(xmob+x))+sq(height/2-(ymob+y)))<250*width/2560){delay(1);angle=angle+0.18;y=y-knockback*(height/2-(ymob+y))+3*sin(angle);}
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
