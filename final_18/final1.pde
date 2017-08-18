//base on the code form https://github.com/kctess5/Processing-Beat-Detection

import processing.serial.*;

import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer song;
FFT fft;
import processing.serial.*;

int bgcolor;           // Background color
int fgcolor;           // Fill color
Serial myPort;                       // The serial port
int[] serialInArray = new int[3];    // Where we'll put what we receive
int serialCount = 0;                 // A count of how many bytes we receive
int xpos, ypos;                // Starting position of the ball
boolean firstContact = false;        // Whether we've heard from the microcontroller


//Star[] stars=new Star[800];
ArrayList<Rip> ripples;
//ArrayList<Floors> floors;
float speed;
boolean isblack;
float  oldbandValue = 0;
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
float scoreGlobal;
// Valeur d'adoucissement
float scoreDecreaseRate = 25;

//Lignes qui apparaissent sur les cotés
int nbFloors = 80;
Floor[] floors;
int nbCubes;
Cube[] cubes;

//Mover mover;

void setup() {
  //myport = 
  isblack=true;
  //size(1000, 1000, P3D);
  fullScreen(P3D);
  xpos = 2;
  ypos = 2;
  //println(Serial.list());
  ripples = new ArrayList<Rip>();
  ripples.add(new Rip(width/2, height/2+100, color(255), 800));

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

  //pcom
  String portName = Serial.list()[3];
  myPort = new Serial(this, portName, 9600);
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
  scoreGlobal = 0.66*scoreLow + 0.8*scoreMid + 1*scoreHi;

  //Couleur subtile de background
  //background(scoreLow/100, scoreMid/100, scoreHi/100);
  background(240);
  if (frameCount>887) {
    background(0);
    //scoreLow*=0.3;
    //scoreMid*=0.3;
    //scoreHi*=0.3;
    isblack=false;
    //for (int i = 0; i < nbFloors; i+=4) {
    //  floors[i] = new Floor(0, height/2, 10, height);
    //}

    ////Floors droits
    //for (int i = 1; i < nbFloors; i+=4) {
    //  floors[i] = new Floor(width, -height/2, 10, height);
    //}
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
    if (xpos*ypos <60000 && xpos*ypos>2500) {
      stroke(250 - oldbandValue*xpos/4, 200+((xpos-600)/50* oldbandValue), 230-((ypos-600)/50* oldbandValue), 240-(70* oldbandValue));
      //println(xpos,ypos);
    } else if (xpos*ypos >60000) { 
      stroke(250- oldbandValue/24, 120-((xpos-600)/50* oldbandValue), 50-((ypos-600)/50* oldbandValue), 240-(70* oldbandValue));
      //stroke(250 - oldbandValue*xpos/4, 120-((xpos-400)/50*oldbandValue), 50-((ypos-500)/50*oldbandValue), 240-(70* oldbandValue));
      //stroke(220-oldbandValue*xpos/2, 120-((xpos-400)/50*oldbandValue), 50-((ypos-500)/24*oldbandValue),  ((scoreGlobal-5)/1000)*(200));
      //println(250-oldbandValue*xpos/2, 120-((xpos-400)/50*oldbandValue), 50-((ypos-500)/50*oldbandValue),  ((scoreGlobal-5)/1000)*(200));
    };
    if (isblack) {
      stroke(0, 0, 0, 255-i);
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
    oldbandValue =bandValue;
    //cubes[i].update();
  }


  // framecount

  //println(frameCount);
}

void serialEvent(Serial myPort) {
  // read a byte from the serial port:
  int inByte = myPort.read();
  // if this is the first byte received, and it's an A, clear the serial
  // buffer and note that you've had first contact from the microcontroller.
  // Otherwise, add the incoming byte to the array:
  if (firstContact == false) {
    if (inByte == 'A') {
      myPort.clear();          // clear the serial port buffer
      firstContact = true;     // you've had first contact from the microcontroller
      myPort.write('A');       // ask for more
    }
  } else {
    // Add the latest byte from the serial port to array:
    serialInArray[serialCount] = inByte;
    serialCount++;

    // If we have 3 bytes:
    if (serialCount > 2 ) {
      //if( serialInArray[0]>50 || serialInArray[1]>50){
      xpos = serialInArray[0];
      ypos = serialInArray[1];
      //}
      if (isblack && xpos*ypos >2500) {
        ripples.add(new Rip(width/2, height/2+100, color(100+xpos, 100+xpos, 100+xpos), ypos));
      }

      //println(xpos + "\t" + ypos + "\t" + fgcolor);

      // Send a capital A to request new sensor readings:
      myPort.write('A');
      // Reset serialCount:
      serialCount = 0;
    }
  }
}




//void mousePressed() {
//  //background(scoreLow*0.67, scoreMid*0.67, scoreHi*0.67);
//  //cubes[(int)random(nbCubes)] = new Cube(mouseX, mouseY);
//  // A new ball object is added to the ArrayList (by default to the end)
//  //println(mouseX, mouseY);
//  //for (int i = 0; i < nbCubes; i++) {
//  // cubes[i] = new Cube();
//  // //cubes[i].update();
//  //}
//  ripples.add(new Rip(500, 600, color(100+scoreLow, 100+scoreMid, 100+scoreHi)));
//}