//base on the code form https://github.com/kctess5/Processing-Beat-Detection

class Floor {

  float startingZ = -10000;
  float maxZ =50;

  //Valeurs de position
  float x, y, z;
  float sizeX, sizeY;

  //Constructeur
  Floor(float mx, float my, float sizemX, float sizemY) {
    //Faire apparaitre la ligne à l'endroit spécifié
    x = mx;
    y = my;
    //Profondeur aléatoire
    z = random(startingZ, maxZ);  

    //On détermine la taille car les floors au planchers ont une taille différente que ceux sur les côtés
    sizeX = sizemX;
    sizeY = sizemY;
  }

  //Fonction d'affichage
  void display(float scoreLow, float scoreMid, float scoreHi, float intensity, float scoreGlobal, boolean isblack) {
    //Couleur déterminée par les sons bas, moyens et élevé
    //Opacité déterminé par le volume global
    color displayColor = color(scoreLow*0.67, scoreMid*0.67, scoreHi*0.67, scoreGlobal);



    //Faire disparaitre les lignes au loin pour donner une illusion de brouillard

    if (isblack) {
      fill(0, 100);

      //pushMatrix();   
      //translate(width/2, y, z);
      //scale(sizeX, sizeY, 50);
      //box(1);
      //popMatrix();

      stroke(0, 100);
      //fill(0, ((scoreGlobal-5)/1000)*(255+(z/25)));
      //fill(255); 240-(70*intensity)
    } else {
      fill(displayColor, ((scoreGlobal-5)/1000)*(255+(z/25)));
      if (xpos*ypos <40000 && xpos*ypos>2500) {
        fill(random(150, 255), 200+((xpos-600)/50*intensity), 230-((ypos-600)/50*intensity),((scoreGlobal-5)/1000)*(200+(z/5)));
        //println(xpos,ypos);
      } else if (xpos*ypos >40000) { 
        fill(250-intensity/24, 120-((xpos-600)/50*intensity), 50-((ypos-600)/50*intensity), ((scoreGlobal-5)/1000)*(200+(z/5)));
      };
    }


    noStroke();
    pushMatrix();

    //Déplacement
    translate(x, y, z);

    //Agrandissement
    if (intensity > 100) intensity = 100;
    scale(sizeX*(intensity/100), sizeY*(intensity/100), 50);

    //Création de la "boite"
    box(1);
    //rect(1,0,1,0,0,0);
    popMatrix();

    //Deuxième bande, celle qui est toujours de la même taille
    //displayColor = color(scoreLow*0.5, scoreMid*0.5, scoreHi*0.5, scoreGlobal);
    //fill(displayColor, (scoreGlobal/5000)*(255+(z/25)));
    //fill(displayColor, ((scoreGlobal-5)/1000)*(255+(z/25)));


    //Déplacement Z
    z+= (pow((scoreGlobal/150), 2));
    if (z >= maxZ) {
      z = startingZ;
    }
  }
}