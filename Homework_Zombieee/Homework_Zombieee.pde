PImage titlepic,pic1,pic2,pic3,pic4,pic5,pic6,pic7,pic8,pic9,pic10,pic11,pic12,end1,end2,end3,end4,end5,end6,end7,end8;
PFont font1,font2;
int state;
   
import processing.sound.*;
SoundFile file;

void setup() {
   size(500, 500) ; 
   state = -1 ;
   file = new SoundFile(this, "Deathisacarousel.mp3");
  
   file.loop();
   titlepic = loadImage("title.png");
   pic1 = loadImage("house.jpg");
   pic2 = loadImage("dog.png");
   pic3 = loadImage("pan.png");
   pic4 = loadImage("building.png");
   pic5 = loadImage("elevator.png");
   pic6 = loadImage("zombies.png");
   pic7 = loadImage("leftzombie.png");
   pic8 = loadImage("back.png");
   pic9 = loadImage("forkroad.png");
   end1 = loadImage("title.png");
   end2 = loadImage("friendend.png");
   end3 = loadImage("bossend.jpg");
   end4 = loadImage("dogend.png");
   end5 = loadImage("billionsofzombies.png");
   end6 = loadImage("infect.png");
   end7 = loadImage("vaccineend.png");
   end8 = loadImage("survival.png");
   font1= createFont("SegoeMarker.ttf",20);
   font2= createFont("SegoeMarker.ttf",40);
}


void draw(){
  background(48);
  image(titlepic,0,0,500,500);
  noStroke();
  textFont(font1);
  fill(255);
   if(state == -1 ) {
   //story background
   text("Press'SHIFT' to start" ,270,350);
   text("Press'ESC' to exit",270,390);
  
   }
 if(state == 0 ) {
   //story background
   file.amp(0.5);
   text("A virus called 'homework' is raging in the MFADT town." ,20,350);
   text("Everyone around you become zombies. Now you have ",20,390);
   text("to get rid of it.",20,430);
   text(">>>> press 'SHIFT' to continue",260,470);
   }
  
    if(state == 1 ) {
      image(pic1,0,0,500,500);
      image(pic2,50,120,150,150);
      image(pic3,300,120,150,150);
      text("Before you leave your house, you can take one object " ,20,350);
      text("with you, you will choose?",20,390);
      text("<<< Your dog",20,440);
      text(">>> Your pan",300,440);
    }
    if(state == 2 ) {
   image(pic4,0,0,500,500);
      text("You go out with your dog, but it slip into " ,20,350);
      text("a building. you will? ",20,390);
      text("<<< Follow it",20,440);
      text(">>> It is too dangerous, ",250,440);
      text("I will go some where else",300,470);
    }
      if(state == 3) {
      image(pic6,0,0,500,500);
      text("As soon as you walk outside, two zombies come at " ,20,350);
      text("you. You will use the pan to hit ?",20,390);
      text("<<< Left zombie",20,440);
      text(">>> Right zombie",300,440);
    }
     if(state == 4) {
      image(pic5,0,0,500,500);
      text("this is an odd building, you feel anxious. you run " ,20,350);
      text("to the elevator and select? ",20,390);
      text("<<< 6 Fl.",20,440);
      text(">>> 12 Fl.",300,440);
    }
    if(state == 5 ) {
       image(pic8,0,0,500,500);
      text("You flee the region and walk along, you find " ,20,350);
      text("a friend and you will?",20,390);
      text("<<< Say hi",20,440);
      text(">>> Go away",300,440);
    }
    if(state == 6 ) {
       image(pic7,0,0,500,500);
      text("You miss it, will you hit again? " ,20,350);
      text("<<< Yes",20,440);
      text(">>> No ",300,440);
   
    }
    if(state == 7 ) {
       image(pic9,0,0,500,500);
      text("You made it! now you flee away. then you come to " ,20,350);
      text("the fork road, you will select? ",20,390);
      
      text("<<< Left road",20,440);
      text(">>> Right road ",300,440);
      
    }
    //----endings--------
    if(state == 8 ) {
      image(end4,0,0,500,500);
      text("Your dog becomes a zombie and bits you! " ,20,350);
      textFont(font2);
      text("You DIE!",20,400); 
      textFont(font1);
      text("Press 'SHIFT' to restart the game",260,470);
    }
    if(state == 9 ) {
      image(end7,0,0,500,500);
      text("Your dog finds a vaccine! with the vaccine you can " ,50,350);
      text(" defeat the virus! Congrats you save the town! ",50,390);
       text("Press 'SHIFT' to restart the game",260,470);
    
    }
    if(state == 10 ) {
      image(end2,0,0,500,500);
      text("Oh no! He was infected with the virus! now you " ,20,350);
      text("are infected as well!",20,390);
       text("Press 'SHIFT' to restart the game",260,470);
    }
    if(state == 11 ) {
      image(end2,0,0,500,500);
      text("But you friend notice you, he already become a " ,20,350);
      text("zombie and runs at you! You DIE  ",20,390);
      text("Press 'SHIFT' to restart the game",260,470);
  
    }
    if(state == 12 ) {
      image(end3,0,0,500,500);
      fill(255);
      text("It is a boss zombie and you" ,20,350);
       textFont(font2);
      text(" DIE ",20,400);
       textFont(font1);
      text("Press 'SHIFT' to restart the game",260,470);
     
    }
    if(state == 13 ) {
      image(end6,0,0,500,500);
      text("Oh no, the zombie runs at you and bits you." ,20,350);
      text("You are infected with the virus and become a zombie." ,20,390);
       text("Press 'SHIFT' to restart the game",260,470);
    }
    if(state == 14 ) {
      image(end5,0,0,500,500);
      text("You select the wrong way, and become exhausted. " ,20,350);
      text("Finally the zombies find you.",20,390);
      text("Press 'SHIFT' to restart the game",260,470);
      
    }
    if(state == 15 ) {
          image(end8,0,0,500,500);
      text("It is the way out! YOU flee from MFADT town!" ,20,350);
      text("No more horrible homework!",20,390);
      text("Press 'SHIFT' to restart the game",260,470);
    }
}

void keyPressed() {
   if (keyPressed&&(key==CODED)){
   if(keyCode == SHIFT) {
     if (state == -1) {
      state=0;}
      else if (state == 0) {
      state=1;
    }
 }
   if(keyCode == ESC) {
   exit();
   }
}
    if(state > -1) {
      if (keyPressed&&(key==CODED)){
        if(keyCode == LEFT) {
           if(state == 1) {state = 2 ;
        } else  if(state == 2 ) {state = 4;
        } else  if(state == 3 ) {state = 6;
        } else  if(state == 4 ) {state = 8;
        } else  if(state == 5 ) {state = 10;
        } else  if(state == 6 ) {state = 12;
        } else  if(state == 7 ) {state = 14;
        }
      } 
    };
       if (keyPressed&&(key==CODED)){
         if(keyCode == RIGHT) {
           //if(state == 0) {state = 1 ;}
       
        if(state == 1) {state = 3 ;
        } else  if(state == 2 ) {state = 5;
        } else  if(state == 3 ) {state = 7;
        } else  if(state == 4 ) {state = 9;
        } else  if(state == 5 ) {state = 11;
        } else  if(state == 6 ) {state = 13;
        } else  if(state == 7 ) {state = 15;
        }
        }};
        if(state > 7 && state <16){
          if(keyPressed&&(key==CODED)){
          if(keyCode == SHIFT) {
            state = -1 ;
        }
       }
      }
     }
   }
    