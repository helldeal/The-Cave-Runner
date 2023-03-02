float decalstart=0;float transstart=0;float easing = 0.02;
void backstart(){
  float dx = (transstart) - decalstart;
  decalstart += dx * easing;
  translate(decalstart,0);
  float dy = (animtransstart) - animstart;
  animstart += dy * easing;
  imageMode(CORNER);
  translate(0,0,-animstart);
  //salle start
  background(0);
   for (int zx = 0; zx < 8; zx++) {
  for (int zy = 0; zy < 3; zy++) {
    tint(100);
    image(startwall,-2*width*663/2560+zx*width*663/2560,-width*663/2560+zy*width*663/2560,width*663/2560,width*663/2560);
  }}
  rotateY(-PI/2); 
  translate(0,0,2*width*663/2560);
   for (int zx = 0; zx < 8; zx++) {
  for (int zy = 0; zy < 3; zy++) {
    tint(100);
    image(startwall,-width*663/2560+zx*width*663/2560,-width*663/2560+zy*width*663/2560,width*663/2560,width*663/2560);
  }}
  translate(0,0,-8*width*663/2560);
   for (int zx = 0; zx < 8; zx++) {
  for (int zy = 0; zy < 3; zy++) {
    tint(100);
    image(startwall,-width*663/2560+zx*width*663/2560,-width*663/2560+zy*width*663/2560,width*663/2560,width*663/2560);
  }}
  translate(0,0,8*width*663/2560);
  translate(0,0,-2*width*663/2560);
  rotateY(PI/2);
  rotateX(PI/2);
  translate(0,1*width*663/2560,0.5*width*663/2560);
   for (int zx = 0; zx < 8; zx++) {
  for (int zy = 0; zy < 8; zy++) {
    tint(100);
    image(stone,-2*width*663/2560+zx*width*663/2560,-width*663/2560+zy*width*663/2560,width*663/2560,width*663/2560);
  }}
  translate(0,0,-2.5*width*657/2560);
   for (int zx = 0; zx < 8; zx++) {
  for (int zy = 0; zy < 8; zy++) {
    tint(100);
    image(stone,-2*width*663/2560+zx*width*663/2560,-width*663/2560+zy*width*663/2560,width*663/2560,width*663/2560);
  }}
  translate(0,0,2.5*width*657/2560);
  translate(0,-1*width*663/2560,-0.5*width*663/2560);
  rotateX(-PI/2);
  textAlign(CENTER,CENTER);
  fill(255);
  textFont(policetitle);
  textSize(height*180/1440);
  text("THE CAVE RUNNER",width/2,height/8);
}
