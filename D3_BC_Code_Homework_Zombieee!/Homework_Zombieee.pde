PImage james;
PFont font;
int state;
PImage img ; 
void setup() {
   size(500, 500) ; 
   state = 0 ;
   img = loadImage("title.jpg");
   font= createFont("MAXWELL BOLD.ttf",20);
}


void draw(){
  background(48);
  image(img,0,0,500,500);
  noStroke();
  fill(0,0,0,150);
  rect(10,300,480,190);
  textFont(font);
  fill(255);
 if(state == 0 ) {
   //story background
   text("A virus called 'homework' is raging in the MFADT town." ,20,350);
   text("Everyone around you become zombies. Now you have ",20,390);
   text("to get rid of it.",20,430);
   text(">>>> press 'E' to continue",280,470);
   }
  
    if(state == 1 ) {
      text("Before you leave your house, you can take one object " ,20,350);
      text("with you, you will choose?",20,390);
      text("A. Your dog",20,440);
      text("B. Your pan",200,440);
    }
    if(state == 2 ) {
      text("You go out with your dog, but it slip into " ,20,350);
      text("a building. you will? ",20,390);
      text("A. Follow it",20,440);
      text("B. It is too dangerous, ",200,440);
      text("I will go some where else",200,470);
    }
      if(state == 3) {
      text("As soon as you walk outside, two zombies come at " ,20,350);
      text("you. You will use the pan to hit ?",20,390);
      text("A. Left zombie",20,440);
      text("B. Right zombie",200,440);
    }
     if(state == 4) {
      text("this is an old building, you feel anxious. you run " ,20,350);
        text("to the elevator and select? ",20,390);
       text("A. 6 Fl.",20,440);
      text("B. 12 Fl.",200,440);
    }
    if(state == 5 ) {
      text("You flee the region and walk along, you find " ,20,350);
      text("a friend and you will?",20,390);
      text("A. Say hi",20,440);
      text("B. Go away",200,440);
    }
    if(state == 6 ) {
      text("You miss it, will you hit again? " ,20,350);
      text("A. Yes",20,470);
      text("B. No ",200,470);
   
    }
    if(state == 7 ) {
      text("You made it! now you flee away. then you come to " ,20,350);
      text("the crossroad, you will select? ",20,390);
      
      text("A. Left road",20,470);
      text("B. Right road ",200,470);
      
    }
    //----endings--------
    if(state == 8 ) {
      text("Your dog becomes a zombie and bits you! " ,20,350);
      text("You DIE!",20,390);
    }
    if(state == 9 ) {
      text("Your dog finds a vaccine! with the vaccine you can " ,20,350);
      text(" defeat the virus! Congrats you save the town! ",20,390);
    
    }
    if(state == 10 ) {
      text("Oh no! He was infected with the virus! now you " ,20,350);
      text("are infected as well!",20,390);
    }
    if(state == 11 ) {
      text("But you friend notice you, he already become a " ,20,350);
      text("zombie and runs at you! You DIE  ",20,390);
  
    }
    if(state == 12 ) {
      text("It is a boss zombie and you" ,20,350);
      text(" DIE ",20,390);
     
    }
    if(state == 13 ) {
      text("You are infected with the virus and become a zombie." ,20,350);
    }
    if(state == 14 ) {
      text("You select the wrong way, and become exhausted. " ,20,350);
      text("Finally the zombies find you.",20,390);
      
    }
    if(state == 15 ) {
      text("It is the way out! YOU flee from MFADT town!" ,20,350);
      text("No more horrible homework!",20,390);
    }
  

}


void keyPressed() {
    if (state == 0) {
      state=1;
    }
    if(state != 0) {
      if(key == 'A' || key == 'a') {
        if(state == 1) {state = 2 ;
        } else  if(state == 2 ) {state = 4;
        } else  if(state == 3 ) {state = 6;
        } else  if(state == 4 ) {state = 8;
        } else  if(state == 5 ) {state = 10;
        } else  if(state == 6 ) {state = 12;
        } else  if(state == 7 ) {state = 14;
        }
      } 
      
      if(key == 'B' || key == 'b') {
         if(state == 1) {state = 3 ;
        } else  if(state == 2 ) {state = 5;
        } else  if(state == 3 ) {state = 7;
        } else  if(state == 4 ) {state = 9;
        } else  if(state == 5 ) {state = 11;
        } else  if(state == 6 ) {state = 13;
        } else  if(state == 7 ) {state = 15;
        }
        }
       if(key == 'E' || key == 'e') {
        if(state > 7 && state <15) {state = 0 ;
        }
        }
      }
     }
    