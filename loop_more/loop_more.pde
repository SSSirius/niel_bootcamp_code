int[] radius=new int[50];
float [] posX = new float[1];
float [] posY = new float[1];
int cir=0;
int count=0;
int px=250;
int py=250;
void setup(){
  size(500,500);
  for(int x=0; x<width;x+=10){
  radius[count]=x;
  count+=1;
  posX[0]=250;
  posY[0]=250;
  };
  
  frameRate(25);

};
void draw(){
  fill(0,0,0,10);
  noStroke();
  rect(0,0,width,height);
     
     
     if (mousePressed){
      cir=0;
       posX = append(posX, mouseX); 
       posY = append(posY, mouseY);
     }
       for(int arrycount=0; arrycount< posX.length; arrycount++){
       for(int i=0;i<count; i++){
         if (i==cir){noFill();
        stroke(255,255,255);
        ellipse(posX[arrycount],posY[arrycount],radius[cir],radius[cir]);
        }}
      //else{
      //  noFill();
      //  stroke(100,100);
      //  ellipse(width/2,height/2,radius[i],radius[i]);}
      }
  //}
  cir=(cir+1)%(count);
}

void mousePressed(){
    px=mouseX;
   py=mouseY;
 
}