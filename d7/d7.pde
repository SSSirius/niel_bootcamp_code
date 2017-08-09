float r = 100;
float thera=0;
float orbit=0;
float lorbit=0;
PVector pos,vel;
int radius;
float re,g,b;
PImage bg,sun;
void setup(){
size(500,600);
//background(0);
pos= new PVector(10,10);
vel= new PVector(5,4);
radius=10;
smooth();
 bg = loadImage("1756368.jpg");
 sun = loadImage("sun.jpg");
//frameRate(30);
}

void draw(){
   image(bg,0,0,500,600);
fill(0,70);
//strokeWeight(1);
//rect(0, 0, width, height);
float x=r*cos(thera)/5;
float y=r*sin(thera)/5;
float sx=r*cos(orbit);
float sy=r*sin(orbit);
//float mx=r*cos(thera)*2;
//float my=r*sin(thera)*2;
float msx=r*cos(lorbit)*2;
float msy=r*sin(lorbit)*2;





stroke(200);
ellipse(width/2, height/2,400,500);
ellipse(width/2, height/2,200,200);
  //ellipse(width/2, height/2,395,395);
ellipse(width/2+sx, height/2+sy,35,35);

pos.add(vel);
if (mouseX<250){
   vel.x= -mouseX/100;}else{vel.x= mouseX/100;
}
if (mouseY<250){
   vel.y= -mouseY/100;}else{vel.y= mouseY/100;
}
 
if (pos.y >= (height-radius/2) || pos.y <= radius/2){
   pos.y=10;
  }
  if (pos.x >= (width-radius/2) || pos.x <= radius/2){
   pos.x=10;
  }
 
  noStroke();
  fill(255,200);
ellipse(pos.x-110,pos.y+45,2,2);
ellipse(pos.x+310,pos.y+310,7,5);
ellipse(pos.x+70,pos.y+58,2,2);
ellipse(pos.x+200,pos.y+150,5,7);
ellipse(pos.x+170,pos.y+58,2,2);
ellipse(pos.x+50,pos.y+280,5,7);
  ellipse(pos.x,pos.y,radius,radius);
  ellipse(pos.x+400,pos.y,radius,radius);
 


noStroke();
fill(220,220,220);
ellipse(x+width/2+sx, y+height/2+sy,10,10);
fill(162,255,233);
ellipse(width/2+sx, height/2+sy,20,20);
//fill(0,0,255);

//ellipse(x+100, y+100,20,20);


//sun
fill(255,100);
ellipse(width/2+msx, height/2+msy*1.25,60,60);

fill(0,0,0);
ellipse(width/2+msx, height/2+msy*1.25,45,45);

fill(204,175,183);
//ellipse(width/2+msx, height/2+msy,35,35);
ellipse(width/2+msx*1, height/2+msy*1.25,35,35);
//image(sun,250,250,70,70);
fill(255,199,32);
ellipse(width/2, height/2,70,70);



thera+=0.2;
orbit+=0.03;
lorbit+=0.01;
 
}