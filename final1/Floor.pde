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
  void display(float scoreLow, float scoreMid, float scoreHi, float intensity, float scoreGlobal,boolean isblack) {
    //Couleur déterminée par les sons bas, moyens et élevé
    //Opacité déterminé par le volume global
    color displayColor = color(scoreLow*0.67, scoreMid*0.67, scoreHi*0.67, scoreGlobal);
    
    //Faire disparaitre les lignes au loin pour donner une illusion de brouillard
    fill(displayColor, ((scoreGlobal-5)/1000)*(255+(z/25)));
     if(isblack){
     stroke(0,100);
      fill(0, ((scoreGlobal-5)/1000)*(255+(z/25)));
    }
    noStroke();
    
    //Première bande, celle qui bouge en fonction de la force
    //Matrice de transformation
    pushMatrix();
    
    //Déplacement
    translate(x, y, z);
  
    //Agrandissement
    if (intensity > 100) intensity = 100;
    scale(sizeX*(intensity/100), sizeY*(intensity/100), 20);
    
    //Création de la "boite"
    box(1);
    //rect(1,0,1,0,0,0);
    popMatrix();
    
    //Deuxième bande, celle qui est toujours de la même taille
    //displayColor = color(scoreLow*0.5, scoreMid*0.5, scoreHi*0.5, scoreGlobal);
    //fill(displayColor, (scoreGlobal/5000)*(255+(z/25)));
    //Matrice de transformation
    //pushMatrix();
    
    ////Déplacement
    ////translate(x, y, z);
    
    ////Agrandissement
    ////scale(sizeX, sizeY, 50);
    
    ////Création de la "boite"
    //box(1);
    //popMatrix();
    
    //Déplacement Z
    z+= (pow((scoreGlobal/150), 2));
    if (z >= maxZ) {
      z = startingZ;  
    }
  }
}