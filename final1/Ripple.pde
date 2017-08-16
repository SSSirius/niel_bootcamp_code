class Rip{
color Col;
float xpos;
float ypos;
float zr;
float life=400;
int countnum;
float startingZ = -5000;
float maxZ = 50;
//int[] radius=new int[50];
int count=0;
int radius=10;

Rip(float _xpos, float _ypos, color c){
  xpos=_xpos;
  ypos=_ypos;
  zr = -5000;
  Col=c;
  //println(Col);
  }
  void move(){
      radius=800;
      //count= (count+1)% 50;
    }
     boolean finished() {
    // Balls fade out
    life--;
    if (life < 0) {
      return true;
    } else {
      return false;
    }
  }
  void display(float intensity, float scoreGlobal){
  //for(int i=0;i<49; i++){
        //noFill();
        stroke(255,100);
        noFill();
        pushMatrix();
        translate(0, 0, zr);
        //ellipse(500,500,500,500);
        ellipse(xpos,ypos,radius,radius);
        popMatrix();
        zr+= (1+(intensity/5)+(pow((scoreGlobal/150), 2)));
       if (zr >= maxZ) {
      //x = random(0, width);
      //y = random(-2*height, height);
        zr = startingZ;
    }
    
  }
      
    //}
}