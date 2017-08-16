import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer song;
FFT fft;

//Star[] stars=new Star[800];
ArrayList<Rip> ripples;
//ArrayList<Floors> floors;
float speed;
boolean isblack;
;
//Floors[] floors=new Floors[15];
//color Coll;
float specLow = 0.05; // 3%
float specMid = 0.15;  // 12.5%
float specHi = 0.30;   // 20%


float scoreLow = 0;
float scoreMid = 0;
float scoreHi = 0;

// previous
float oldScoreLow = scoreLow;
float oldScoreMid = scoreMid;
float oldScoreHi = scoreHi;

// Valeur d'adoucissement
float scoreDecreaseRate = 25;

//Lignes qui apparaissent sur les cotés
int nbFloors = 500;
Floor[] floors;
int nbCubes;
Cube[] cubes;


void setup() {
  isblack=true;
  size(1000, 1000, P3D);

  //for (int i =0; i<stars.length;i++){
  //stars[i]=new Star();

  //}
  ripples = new ArrayList<Rip>();
  ripples.add(new Rip(500, 600, color(255)));

  //music
  minim=new Minim(this);
  song=minim.loadFile("You.mp3", 1024);
  song.play();
  fft = new FFT(song.bufferSize(), song.sampleRate());

  //ellipse
  nbCubes = (int)(fft.specSize()*specHi);
  cubes = new Cube[nbCubes];
  for (int i = 0; i < nbCubes; i++) {
    cubes[i] = new Cube();
  }

  floors = new Floor[nbFloors];
  for (int i = 0; i < nbFloors; i++) {
    floors[i] = new Floor(width/2, height, width, 10);
  }
}

void draw() {

  speed = map(mouseX, 0, width, 0, 20);
  fill(0, 150);
  //rect(-500,-500,width*2,height*2);
  //background(0,5);
  //translate(width/2,height/2);
  //for (int i =0; i<stars.length;i++){
  //  stars[i].update();
  //  stars[i].display();}
  //for (int i =0; i<floors.length;i++){
  //floors[i].update();
  //floors[i].display();}

  //stroke(255);
  //line(-width/2,height/2,50,-15,0,0);
  //line(width/2,height/2,50,15,0,0);




  //music
  //float a = 0;
  // float angle = (2*PI) / 180;
  // int step = player.bufferSize() / 1024;
  // for(int i=0; i < player.bufferSize() - step; i+=step) {

  //   float x = cos(a) * (500 * player.mix.get(i) + 100);
  //   float y =  sin(a) * (500 * player.mix.get(i) + 100);
  //   float x2 =  cos(a + angle) * (500 * player.mix.get(i+step) + 100);
  //   float y2 =  sin(a + angle) * (500 * player.mix.get(i+step) + 100);
  //   stroke(color(random(180,255),random(180,255),random(180,255)),220);
  //   noFill();
  //      line(x,y,x2,y2);

  //   a += angle;
  // }

  fft.forward(song.mix);

  //Low,Mid,High
  oldScoreLow = scoreLow;
  oldScoreMid = scoreMid;
  oldScoreHi = scoreHi;

  scoreLow = 0;
  scoreMid = 0;
  scoreHi = 0;


  for (int i = 0; i < fft.specSize()*specLow; i++)
  {
    scoreLow += fft.getBand(i);
  }

  for (int i = (int)(fft.specSize()*specLow); i < fft.specSize()*specMid; i++)
  {
    scoreMid += fft.getBand(i);
  }

  for (int i = (int)(fft.specSize()*specMid); i < fft.specSize()*specHi; i++)
  {
    scoreHi += fft.getBand(i);
  }


  if (oldScoreLow > scoreLow) {
    scoreLow = oldScoreLow - scoreDecreaseRate;
  }

  if (oldScoreMid > scoreMid) {
    scoreMid = oldScoreMid - scoreDecreaseRate;
  }

  if (oldScoreHi > scoreHi) {
    scoreHi = oldScoreHi - scoreDecreaseRate;
  }

  //Volume pour toutes les fréquences à ce moment, avec les sons plus haut plus importants.
  //Cela permet à l'animation d'aller plus vite pour les sons plus aigus, qu'on remarque plus
  float scoreGlobal = 0.66*scoreLow + 0.8*scoreMid + 1*scoreHi;

  //Couleur subtile de background
  //background(scoreLow/100, scoreMid/100, scoreHi/100);
  background(240);
  if (frameCount>898) {
    background(0);
    //scoreLow*=0.3;
    //scoreMid*=0.3;
    //scoreHi*=0.3;
    isblack=false;
  }

  //float previousBandValue = fft.getBand(0);

  //Distance entre chaque point de ligne, négatif car sur la dimension z
  float dist = -25;

  //Multiplier la hauteur par cette constante
  //float heightMult = 2;

  //float previousBandValue = fft.getBand(0);
  for (int i = 1; i < fft.specSize(); i++)
  {
    //Valeur de la bande de fréquence, on multiplie les bandes plus loins pour qu'elles soient plus visibles.
    //float bandValue = fft.getBand(i)*(1 + (i/50));

    //Selection de la couleur en fonction des forces des différents types de sons
    //Coll= color(100+scoreLow, 100+scoreMid, 100+scoreHi, 255-i);
    stroke(100+scoreLow, 100+scoreMid, 100+scoreHi, 255-i);
    if (isblack) {
      stroke(0, 0, 0, 255-i);
      ;
    }
    strokeWeight(3);
    line(0, height, dist*(i-1), 0, height, dist*i);
    line(width, height, dist*(i-1), width, height, dist*i);
    //line(width, 0, dist*(i-1), width,0, dist*i);
    // line(0, 0, dist*(i-1), 0, 0, dist*i);
  }

  //Floors rectangles
  for (int i = 0; i < nbFloors; i++)
  {
    //On assigne à chaque floor une bande, et on lui envoie sa force.
    float intensity = fft.getBand(i%((int)(fft.specSize()*specHi)));
    floors[i].display(scoreLow, scoreMid, scoreHi, intensity, scoreGlobal, isblack);
  }

  //ripple
  for (int i = ripples.size()-1; i >= 0; i--) { 
    // An ArrayList doesn't know what it is storing so we have to cast the object coming out
    Rip ripple = ripples.get(i);
    ripple.move();
    float intensity = fft.getBand(i%((int)(fft.specSize()*specHi)));
    ripple.display(intensity, scoreGlobal);
    if (ripple.finished()) {
      // Items can be deleted with remove()
      ripples.remove(i);
    }
  } 


  //cubes
  //Cube pour chaque bande de fréquence
  for (int i = 0; i < nbCubes; i++)
  {
    float bandValue = fft.getBand(i);
    cubes[i].display(scoreLow, scoreMid, scoreHi, bandValue, scoreGlobal, isblack);
  }



  // framecount

  //println(frameCount);
}






void mousePressed() {
  // A new ball object is added to the ArrayList (by default to the end)
  ripples.add(new Rip(500, 600, color(100+scoreLow, 100+scoreMid, 100+scoreHi)));
  //println(mouseX, mouseY);
}