class Cube {
  //Position Z de "spawn" et position Z maximale
  float startingZ = -10000;
  float maxZ = 1000;

  //Valeurs de positions
  float x, y, z;
  float rotX, rotY, rotZ;
  float sumRotX, sumRotY, sumRotZ;

  //Constructeur
  Cube() {
    //Faire apparaitre le cube à un endroit aléatoire
    x = random(0, width);
    y = random(-2*height, height);
    z = random(startingZ, maxZ);

    //Donner au cube une rotation aléatoire
    rotX = random(0, 1);
    rotY = random(0, 1);
    rotZ = random(0, 1);
  }

  void display(float scoreLow, float scoreMid, float scoreHi, float intensity, float scoreGlobal, boolean isblack) {

    color displayColor = color(scoreLow*0.4, scoreMid*0.64, scoreHi*0.47, intensity*5);
    fill(displayColor, 255);

    //Couleur lignes, elles disparaissent avec l'intensité individuelle du cube
    color strokeColor = color(255, 150-(20*intensity));
    stroke(strokeColor, 100);
    sumRotX += intensity*(rotX/1000);
    sumRotY += intensity*(rotY/1000);
    sumRotZ += intensity*(rotZ/1000);

    if (isblack) {
      stroke(255);
      //fill(0, 150-(50*intensity));
      fill(0, 200);
      strokeWeight(3);
      pushMatrix();
      translate(x+width, y, z);
      rotateX(sumRotX);
      rotateY(sumRotY);
      rotateZ(sumRotZ);
      //box(100+(intensity/2));
      ellipse(0, 0, intensity/2+150, intensity/2+150);
      popMatrix();
      pushMatrix();
      translate(x-width, y, z);
      sumRotX += intensity*(rotX/1000);
      sumRotY += intensity*(rotY/1000);
      sumRotZ += intensity*(rotZ/1000); 
      ellipse(0, 0, intensity/2+150, intensity/2+150);
      popMatrix();
    } else {
      strokeWeight(1 + (scoreGlobal/300));
      strokeWeight(3);
      pushMatrix();
      //translate(x, y, z);
      translate(x-width, y, z);
      rotateX(sumRotX);
      rotateY(sumRotY);
      rotateZ(sumRotZ);
      box(100+(intensity/2));
      //ellipse(0,0,intensity/2+100,intensity/2+100);
      popMatrix();
     pushMatrix();
      //translate(x, y, z);
      translate(x+width, y, z);
      rotateX(sumRotX);
      rotateY(sumRotY);
      rotateZ(sumRotZ);
      box(100+(intensity/2));
      //ellipse(0,0,intensity/2+100,intensity/2+100);
      popMatrix();
    }



    //strokeWeight(1 + (scoreGlobal/300));
    //strokeWeight(3);

    //Création d'une matrice de transformation pour effectuer des rotations, agrandissements
    //pushMatrix();

    //Déplacement
    //translate(x+width, y, z);

    //Calcul de la rotation en fonction de l'intensité pour le cube
    //sumRotX += intensity*(rotX/1000);
    //sumRotY += intensity*(rotY/1000);
    //sumRotZ += intensity*(rotZ/1000);

    //Application de la rotation
    //rotateX(sumRotX);
    //rotateY(sumRotY);
    //rotateZ(sumRotZ);
    //noStroke();
    //lights();
    //Création de la boite, taille variable en fonction de l'intensité pour le cube
    //sphere(60+(intensity/2));
    ////box(100+(intensity/2));
    // ellipse(0,0,intensity/2+100,intensity/2+100);
    ////Application de la matrice
    //popMatrix();
    // pushMatrix();

    ////Déplacement
    //translate(x-width, y, z);

    ////Calcul de la rotation en fonction de l'intensité pour le cube
    //sumRotX += intensity*(rotX/1000);
    //sumRotY += intensity*(rotY/1000);
    //sumRotZ += intensity*(rotZ/1000);

    ////Application de la rotation
    ////rotateX(sumRotX);
    ////rotateY(sumRotY);
    ////rotateZ(sumRotZ);
    ////noStroke();
    //li//ghts();
    ////Création de la boite, taille variable en fonction de l'intensité pour le cube
    ////sphere(60+(intensity/2));
    ////box(100+(intensity/2));
    // ellipse(0,0,intensity/2+100,intensity/2+100);
    ////Application de la matrice
    //popMatrix();

    //Déplacement Z
    z+= (1+(intensity/5)+(pow((scoreGlobal/150), 2)));

    //Replacer la boite à l'arrière lorsqu'elle n'est plus visible
    if (z >= maxZ) {
      x = random(0, width);
      y = random(-2*height, height);
      z = startingZ;
    }
  }
}