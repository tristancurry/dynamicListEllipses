//Here's some code to demonstrate the use of DYNAMIC ARRAYS to
//add and remove OBJECTS from a program.

//The objects in this case are BALLOONS (ellipse kinda things) that live for a little while
//and are then extinguished. Also, if they go off the sides of the window they are deleted.

//This time a dynamic list is used to continuously create new balloons on mouseclick. They die after a while and are removed from memory.

//A global variable is used to record the number of balloons that have
//lived so far.

//also demonstrated: IF statements, pushMatrix/popMatrix techniques
///////////////////////////////////////////////////////////////////////////////////////////////////////////


int balloonNumber;
int balloonLifetime = 40; //how many frames should a balloon last for?

ArrayList balloonList;   //must declare this at the beginning! Once created, this will store the many balloons we'll create.

int balloonLimit = 20;   //how many balloons should be allowed to exist simultaneously? Usually a good idea to set something up like this.




void setup(){
  size(displayWidth,displayHeight);
  balloonNumber = 0;
  
  balloonList = new ArrayList();  //create the balloonList (an ArrayList object)
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
  background(200);
}



void draw(){
  
  //background(200);    //UNCOMMENT THIS to get rid of the trails
  
  if(balloonList.size() != 0){ //if there are any balloons in balloonList, do the following:
    for (int i = 0; i < balloonList.size(); i++) { //for each balloon in balloonList,
      NumberedBalloon balloon = (NumberedBalloon) balloonList.get(i);  //get the balloon (here we have to be specific and mention that it's a NumberedBalloon object),
      
      balloon.update(); //update position and rotation of this balloon
      
      if(balloon.balloonTimer >= balloonLifetime){ //fade this balloon if it's lived too long
        balloon.fade();
       }
      
      balloon.display(); //display this balloon on screen
       
       if(balloon.balloonAlpha <= 0){ //remove this balloon from the list if it's faded completely
         balloonList.remove(i);
       }
    }
  }
}
  
void mouseClicked(){          //do this stuff when the mouse is clicked
  
   if(balloonList.size() < balloonLimit){  //if there aren't already too many balloons around...
     NumberedBalloon newBalloon = new NumberedBalloon(mouseX, mouseY, random(-3,3), random(-3,3), color(random(0,255),random(0,255),random(0,255)));  //declare and create a new balloon, with random properties
     balloonList.add(newBalloon); //add this balloon to the list before it disappears
    }
    
    //alternatively, use a FOR LOOP to generate 5 balloons at once on each click...uncomment the following (and comment the above) to test
    
    /*
    for(int i = 0; i < 5; i++){
      if(balloonList.size() < balloonLimit){
         NumberedBalloon newBalloon = new NumberedBalloon(mouseX, mouseY, random(-3,3), random(-3,3), color(random(0,255),random(0,255),random(0,255)));  //declare and create a new balloon, with random properties
         balloonList.add(newBalloon); //add this balloon to the list before it disappears
      }
    } 
  */
 
 } 

  
boolean sketchFullScreen() {  //plop these lines at the end of your code to engage presentation mode (thanks S.H.)
  return true;
} 
